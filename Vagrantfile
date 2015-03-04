Vagrant.configure("2") do |config|
 config.vm.box = "opscode_ubuntu-14.04"
 config.vm.box_url = "http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_ubuntu-14.04-i386_chef-provisionerless.box"
 config.omnibus.chef_version = :latest
 config.vm.provision :chef_solo do |chef|
   chef.provisioning_path = "/etc/chef"
   chef.node_name = "server"
 end
end
