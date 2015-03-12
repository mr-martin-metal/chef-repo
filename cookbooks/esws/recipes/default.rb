install_dir="/tmp"

execute "unpack" do
#   command "tar zxvf #{Chef::Config['file_cache_path']}/install.tar.gz"
#   command "echo 'This is unpack command executed' > /tmp/stamp"
	command "echo #{Chef::Config['file_cache_path']} > /tmp/cfg"
end

bash "unpack installer" do
	user "root"
	cwd "#{install_dir}"
	code <<-EOH
		tar zxvf #{Chef::Config['file_cache_path']}/install.tar.gz
	EOH
	action :nothing
end

remote_file "#{Chef::Config['file_cache_path']}/install.tar.gz" do
  owner "root"
  group "root"
  mode "0644"
#  source "http://ubumameww.opentext.net/cloud/repository/sw/install.tar.gz"
  source "#{node['esws']['repository_url']}/#{node['esws']['package']}"
  notifies :run, "bash[unpack installer]", :immediately
end