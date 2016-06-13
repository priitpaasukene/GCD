# Installs chef-ha package and configures it

chef_ingredient 'chef-ha' do
  extend ChefServerCookbook::Helpers
  version node['chef-ha']['version'] unless node['chef-ha']['version'].nil?
  package_source node['chef-ha']['package_source']
  config <<-EOS
topology "#{node['chef-ha']['topology']}"
#{"api_fqdn \"#{node['chef-ha']['api_fqdn']}\"" if api_fqdn_available?}
#{node['chef-ha']['configuration']}
EOS
  action :install
end
