#!/bin/bash

# Script that sets up the aws env for chef cluster
# Prerequisite - aws cli is set up with correct keys.

# As this is a quick hack I am not doing error handling
# but rather just running set of commands in order not to lose focus.

#TODO: Error handling.
#TODO: pokeyoke - damage control when used on wrong env.

#CONFIGURATION
DEBUG=1

#copy from config_sample.sh and populate w meaningful values.
source config.sh

CHEF_SUBNET='172.31.100.0/24'

#Script structure
if  [ ! -d $TMPDIR ]; then
    mkdir $TMPDIR
fi

#1. create subnet for chef

aws ec2 create-subnet --vpc-id "$VPC_ID" --cidr-block "$CHEF_SUBNET" >> $TMPDIR/subnet.txt

SUBNET_ID=$(grep -P '"SubnetId":.*?[^\\]",' $TMPDIR/subnet.txt | cut -d "\"" -f 4 )

#2. Create sec group that allows ssh access from MY_IP

aws ec2 create-security-group --vpc-id "$VPC_ID" --group-name "ssh_in" --description "Allow ssh" >> $TMPDIR/secgroup.txt

SECGROUP_ID=$(grep -P '"GroupId":.*?[^\\]"' $TMPDIR/secgroup.txt | cut -d "\"" -f 4 )

aws ec2 authorize-security-group-ingress --group-id "$SECGROUP_ID" --cidr "$MY_IP" --protocol "tcp" --port 22 >> $TMPDIR/secgroup_ingress.txt
aws ec2 authorize-security-group-ingress --group-id "$SECGROUP_ID" --cidr "$chef_subnet" --protocol "all" >> $TMPDIR/secgroup_ingress.txt

# There is much more intuitive way to do this by using either terraform
# or AWS CloudFormation or chef AWS cookbook. Somehow I chose making api calls via aws cli.
# skipping this step and falling back to aws cli because of too much time
# spent on finding chef aws cookbook that works out of the box and supports
# all needed operations.

#3. Create additional sec groups if needed (https, DB)
#skip

#4. Create 2x EC2 instances in chef subnet

aws ec2 import-key-pair --key-name "setup_key" --public-key-material "$(cat $MY_SSH_PUBLIC_KEY)" >> $TMPDIR/keypair.txt

aws ec2 run-instances --image-id "$CHEFSERVER_IMAGE_ID" --instance-type t1.micro --key "setup_key" --security-group-ids "$SECGROUP_ID" --count 2 --associate-public-ip-address > $TMPDIR/instances.txt

#5. if instances are ready - ssh to instances and set up chef there.

#sudo DEBIAN_FRONTEND=noninteractive apt-get -y install chef

#remove tmpdir
if [ $DEBUG -eq 0 ]; then
  rm -r $TMPDIR
fi 
