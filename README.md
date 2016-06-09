# GCD

Documentation and how to set up things.

## AWS tasks

Set up AWS account

Add group "admin"
Add AdministratorAccess privilege to group "admin"
Create user and record access key
Add created user to "admin" group


## VM / laptop tasks to set up chef
sudo apt-get install ruby ruby-dev chef

sudo apt-get install chef-zero

sudo apt-get purge chef-zero

mkdir -p /tmp/ssh
ssh-keygen -f /tmp/ssh/id_rsa

create /etc/chef/client.pem for chef to be happy.

wget  https://packages.chef.io/stable/debian/8/chefdk_0.14.25-1_amd64.deb
sha1sum chefdk_0.14.25-1_amd64.deb |grep 7130b9f4405c622f0ccb5eb832f8ae1ba572a260

dpkg -i chefdk_0.14.25-1_amd64.deb

cd to cookbooks/chef-server-cluster
berks install
berks upload

## DOCS I have read

https://docs.chef.io/server_high_availability.html

http://sysadvent.blogspot.com.ee/2014/12/day-14-using-chef-provisioning-to-build.html


