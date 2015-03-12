file "/tmp/helloworld.txt" do
  owner "vagrant"
  group "vagrant"
  mode 00544
  action :create
  content "Hello, Implementor!\n"
end
