Vagrant.configure("2") do |config|
 config.vm.box = "test"
 config.vm.box_url = "http://ubumameww.opentext.net/cloud/repository/VMBox/ubuntu_14.04-i386_chef.box"
 config.omnibus.chef_version = "11.18.6"
 config.vm.provision :chef_client do |chef|
   chef.provisioning_path = "/etc/chef"
   chef.chef_server_url = "https://virtualchef/organizations/mame"
   chef.validation_key_path = ".chef/mame-validator.pem"
   chef.validation_client_name = "mame-validator"
   chef.node_name = "server"
   chef.add_recipe "helloworld"
   chef.add_recipe "esws"
 end
end
