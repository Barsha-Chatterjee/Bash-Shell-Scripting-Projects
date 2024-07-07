#!/bin/bash

## This script will report the AWS resources usage (EC2 instances, S3 Buckets, AWS Lambda, AWS IAM Users)

# Run the script in debug mode (optional-according to requirements)

set -x

#If you want to get list of instances complete data then use the cmd --  aws ec2 describe-instances
#List of EC2 Instance Ids

echo "Print list of EC2 instance ID's :"
aws ec2 describe-instances | jq '.Reservations[].Instances[].InstanceId'

#List S3 buckets

echo "Print list of S3 buckets :"
aws s3 ls

#List AWS Lambda

echo "Print list of AWS lambda :"
aws lambda list-functions

#List IAM Users

echo "Print list of IAM Users :"
aws iam list-users


