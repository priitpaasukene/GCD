default['chef-ha']['version'] = nil
default['chef-ha']['package_source'] = nil

# The Chef Server must have an API FQDN set.
# Ref. http://docs.chef.io/install_server_pre.html#hostnames
default['chef-ha']['api_fqdn'] = node['fqdn']

default['chef-ha']['topology'] = 'standalone'
default['chef-ha']['addons'] = []
