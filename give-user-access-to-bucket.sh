#!/bin/bash

# For simplicity we align bucketname with username.
#
# Purpose of this script is to give a user only the necessary rights to
# manipulate a specific bucket.
#
# See policy.json file for details about the policy.
#
BUCKETNAME=$1
USERNAME=$BUCKETNAME

USER_ARN=$(aws iam get-user --user-name $USERNAME --query "User.Arn" --output text)

CONFIGURED_POLICY=$(sed "s~IAM_USER_ID~$USER_ARN~" policy.json | sed "s/BUCKETNAME/$BUCKETNAME/")

aws s3api put-bucket-policy --bucket $BUCKETNAME --policy "$CONFIGURED_POLICY"
