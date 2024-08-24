#!/bin/bash


####################################
# This script will help users to automate the list of  required aws resources from various regions
## Verion: V2 - Using Case statement
# Below are the services that can be listed out using this script
#
# EC2 Instances
# S3 Buckets
# EKS
# IAM
# Route53
# EBS
# DynamoDB
#
# This script would prompt user to insert two parameters i.e., AWS Region and AWS service
#
# Usage : ./AWS_Resource_Listing.sh <AWS_Region> <AWS_Service>
# Example : ./AWS_Resource_Listing.sh us-east-1 Route53
#######################################

# Check if required number of arguments are passed on not

if [ $# -ne 2 ]; then
        echo "error: Please insert all the required parameters"
        echo "Usage : $0 <aws_region> <aws_service>"
        exit 1
fi

# Assign the required parameters to be passed

aws_region=$1
aws_service=$2

# Check whether AWS-CLI is installed or not

if ! command -v aws &> /dev/null; then
        echo "error: Please install AWS-CLI and try running the script again"
        exit 1
fi

# Check if AWS-CLI is configured or not

if [ ! -d ~/.aws ]; then
        echo "error: AWS-CLI is not configured.Please configure the AWS-CLI and try again"
        exit 1
fi

# List out the aws services

case $aws_service in
        ec2)
                echo "List of ec2 instances in $aws_region"
                aws ec2 describe-instances --region $aws_region | jq ".Reservations[].Instances[].InstanceId"
                ;;

        s3)
                echo "List of s3 buckets in $aws_region"
                aws s3api list-buckets --region $aws_region
                ;;
        eks)
                echo "List of eks clusters in $aws_region"
                aws eks list-clusters --region $aws_region
                ;;
        iam)
                 echo "List of IAM Users in $aws_region"
                 aws iam list-users --region $aws_region
                 ;;
        route53)
                 echo "List of Route53 Hosted Zones in $aws_region"
                 aws route53 list-hosted-zones --region $aws_region
                 ;;
        ebs)
                echo "List of EBS Volumes in $aws_region"
                aws ec2 describe-volumes --region $aws_region
                ;;
        dynamodb)
                echo "Listing DynamoDB Tables in $aws_region"
                aws dynamodb list-tables --region $aws_region
                ;;
        *)
                echo "error: Invalid service. Please enter again"
                exit 1
                ;;
        esac


