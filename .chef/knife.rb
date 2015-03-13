# See https://docs.getchef.com/config_rb_knife.html for more information on knife configuration options

current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "qmadmin"
client_key               "#{current_dir}/qmadmin.pem"
validation_client_name   "mame-validator"
validation_key           "#{current_dir}/mame-validator.pem"
chef_server_url          "https://localhost/organizations/mame"
syntax_check_cache_path  "#{ENV['HOME']}/.chef/syntaxcache"
cookbook_path            ["#{current_dir}/../cookbooks"]
