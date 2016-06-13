
default['chef_server_ha_aws_provisioner']['chef_server_url'] = 'https://localhost:4000'
default['chef_server_ha_aws_provisioner']['chef_oauth2_app_id'] = '14dfcf186221781cff51eedd5ac1616'
default['chef_server_ha_aws_provisioner']['chef_oauth2_secret'] = 'a49402219627cfa6318d58b13e90aca'
default['chef_server_ha_aws_provisioner']['chef_oauth2_verify_ssl'] = false



#default['chef_server_ha_aws_provisioner']['package_version'] = '1.2.3'

# install from the repository of nightly packages
#default['chef_server_ha_aws_provisioner']['package_repo'] = ''
default['chef_server_ha_aws_provisioner']['package_url'] = 'https://packages.chef.io/stable/ubuntu/14.04/chef-ha_1.0.0-1_amd64.deb'
