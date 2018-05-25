#!/bin/bash

USERNAME=$1

# Will break if there is a list of keys. Can be improved.
ACCESSKEY=$(aws iam list-access-keys --user-name $USERNAME --query "AccessKeyMetadata[].AccessKeyId" --output text)

# we need to delete all user's access keys first
aws iam delete-access-key --access-key $ACCESSKEY --user-name $USERNAME
# then remove user from any groups
aws iam remove-user-from-group --user-name $USERNAME --group-name CraftListBuckets
# finally allowed to delete user
aws iam delete-user --user-name $USERNAME
