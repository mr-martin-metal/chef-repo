install_dir="/tmp"

# Setup "<<repo>>/data_bags/esws/ESWS_Installer.json" file and write in:
#    "id": "ESWS_Installer",
#    "product_url" : "http://ubumameww.opentext.net/cloud/repository/sw/install.tar.gz"
# Then create data bag and upload its content:
#  knife data bag create esws
#  knife data bag from file esws ESWS_Installer.json
#  knife data bag show esws ESWS_Installer
# You can than refer to the data bag like this:
install = data_bag_item('esws', 'ESWS_Installer')

execute "download" do
   command "echo #{install['product_url']} > /tmp/data_bags"
end

# Extendering the data bag model for secret data
secret_file = Chef::EncryptedDataBagItem.load_secret("#{node['esws']['secret_file']}")
secret_data = Chef::EncryptedDataBagItem.load("secrets","postgresql", secret_file )

execute "secret" do
   command "echo #{secret_data['password']} > /tmp/postgress_pwd"
end

# This is a simple command. It performs a simple instruction
execute "unpack" do
#   command "tar zxvf #{Chef::Config['file_cache_path']}/install.tar.gz"
#   command "echo 'This is unpack command executed' > /tmp/stamp"
	command "echo #{Chef::Config['file_cache_path']} > /tmp/cfg"
end

# This is a sequence linked to another block. It gets trigerred
# though "remote_file" keywork mentioned in the next block.
bash "unpack installer" do
	user "root"
	cwd "#{install_dir}"
	code <<-EOH
		tar zxvf #{Chef::Config['file_cache_path']}/install.tar.gz
	EOH
	action :nothing
end

# Create a local file in the cache and trigger next processing
# for created file. In this case is the pospprocessing "unpack installer"
remote_file "#{Chef::Config['file_cache_path']}/install.tar.gz" do
  owner "root"
  group "root"
  mode "0644"
#  source "http://ubumameww.opentext.net/cloud/repository/sw/install.tar.gz"
  source "#{node['esws']['repository_url']}/#{node['esws']['package']}"
  notifies :run, "bash[unpack installer]", :immediately
end

# Example usage. This example required attribute file as well as template file.
# Both must be inthe same cookbook. It create local file "templated_file".
template "#{node['esws']['deploy_path']}/templated_file" do
	source "template.erb"
	owner "#{node['esws']['user']}"
	group "#{node['esws']['group']}"
	mode "0600"
	variables ({
		:ssh_key => node['esws']['ssh_key'],
		:user => node['esws']['ssh_user'],
		:password => node['esws']['ssh_pwd'],
	})
end

# each and every time the cookbook chnages, it must be uploaded to the server for tests.
#   knife upload cookbooks/esws -V -V
# which uploads the recipes and dependeing stuff and generates debug messages.  
