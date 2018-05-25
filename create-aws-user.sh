#!/bin/bash

USERNAME=$1

aws iam create-user --user-name $USERNAME

aws iam add-user-to-group --user-name $USERNAME --group-name CraftListBuckets
