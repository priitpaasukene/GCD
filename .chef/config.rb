config_dir = File.dirname(__FILE__)
chef_server_url 'http://localhost:7799'
node_name        'chef-provisioner'
cookbook_path [File.join(config_dir, '..', 'cookbooks')]
