#!/bin/bash

# Script that sets up the aws env for chef cluster
# Prerequisite - aws cli is set up with correct keys.

# As this is a quick hack I am not doing error handling
# but rather just running set of commands in order not to lose focus.

#TODO: Error handling.
#TODO: pokeyoke - damage control when used on wrong env.

#CONFIGURATION

#copy from config_sample.sh and populate w meaningful values.
source config.sh

#Script structure

#1. create subnet for chef

#2. Create sec group that allows ssh access from MY_IP

#3. Create additional sec groups if needed (https, DB)

#4. Create 2x EC2 instances in chef subnet

#5. if instances are ready - ssh to instances and set up chef there. 
