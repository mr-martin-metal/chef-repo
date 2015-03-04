current_dir = File.expand_path(File.dirname(__FILE__))
current_dir = "/home/martinme/Develop/local/chef-repo"
file_cache_path "#{current_dir}"
cookbook_path "#{current_dir}/cookbooks"
role_path "#{current_dir}/roles"
data_bag_path "#{current_dir}/data_bags"
