# include helper methods
class ::Chef::Recipe
  include ::Opscode::ChefClient::Helpers
end

# libraries/helpers.rb method to DRY directory creation resources
client_bin = find_chef_client
Chef::Log.debug("Found chef-client in #{client_bin}")
node.default['chef_client']['bin'] = client_bin
create_directories

group = node['root_group']

directory node['chef_client']['run_path'] do
  recursive true
  owner 'root'
  group group
  mode 00755
end

include_recipe 'bluepill' # ~FC007: bluepill is only required when using the bluepill_service recipe

template "#{node['bluepill']['conf_dir']}/chef-client.pill" do
  source 'chef-client.pill.erb'
  mode 00644
  notifies :restart, 'bluepill_service[chef-client]', :delayed
end

bluepill_service 'chef-client' do
  action [:enable, :load, :start]
end
