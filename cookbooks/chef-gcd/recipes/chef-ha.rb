# Installs chef-ha package and configures it

include_recipe 'chef-server-ha-aws-provisioner::default'

file "/etc/chef/chef-server.rb" do
    content <<-EOS
topology "ha"
ha['provider'] = 'aws'
ha['aws_access_key_id'] = "#{node['aws']['aws_access_key_id']}"
ha['aws_secret_access_key'] = "#{node['aws']['aws_access_key_id']}"
ha['ebs_volume_id'] = "#{node['ebs_volume_id']}"
ha['ebs_device'] = "/dev/xvdz"
EOS
#    notifies chef-server-reconfigure
end
    
