chef_server_url 'http://localhost:7799'
node_name       'chef-provisioner'

#use_policyfile   true
deployment_group 'sysadvent-demo-provisioner'

private_keys     'hc-metal-provisioner' => '/tmp/ssh/id_rsa'
public_keys      'hc-metal-provisioner' => '/tmp/ssh/id_rsa.pub'

secret_file      '/home/priitp/.chef/secret.pem'


