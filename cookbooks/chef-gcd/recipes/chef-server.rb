# Recipe to install and manage chef-server

package "chef-server" do
  action :install
  provider "https://packages.chef.io/stable/debian/8/chef_12.11.18-1_amd64.deb"
end

