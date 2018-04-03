#!/usr/bin/env bash
aws ec2 run-instances --image-id ami-0f60ae938604881a6 --instance-type t2.micro --key-name *yoursshkey.pem* --tag-specifications 'ResourceType=instance,Tags=[{Key=Environment,Value=Training},{Key=Name,Value=HelloWorld}]' --user-data file://advanced.txt --iam-instance-profile Name="*rolename*"
