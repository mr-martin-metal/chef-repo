Vagrant.configure("2") do |config|
 config.vm.box = "opscode_ubuntu"
 config.vm.box_url = "http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_ubuntu-14.04-i386_chef-provisionerless.box"
 config.omnibus.chef_version = :latest
 config.vm.provision :chef_solo do |chef|
   chef.provisioning_path = "/home/martinme/Develop/local/chef-repo"
   chef.cookbooks_path = "/home/martinme/Develop/local/chef-repo/cookbooks"
   chef.node_name = "server"
   chef.add_recipe "helloworld"
 end
end
