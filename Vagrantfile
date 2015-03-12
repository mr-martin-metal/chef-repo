Vagrant.configure("2") do |config|
 config.vm.box = "test"
 config.vm.box_url = "http://ubumameww.opentext.net/cloud/repository/VMBox/ubuntu_14.04-i386_chef.box"
# config.vm.box_url = "http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_ubuntu-14.04-i386_chef-provisionerless.box"
# config.omnibus.chef_version = :latest
 config.omnibus.chef_version = "11.18.6"
 config.vm.provision :chef_solo do |chef|
   chef.provisioning_path = "/home/martinme/Develop/local/chef-repo"
   chef.cookbooks_path = "/home/martinme/Develop/local/chef-repo/cookbooks"
   chef.file_cache_path = "/home/martinme/Develop/local/chef-repo/repository"
   chef.node_name = "server"
   chef.add_recipe "helloworld"
   chef.add_recipe "esws"
 end
end
