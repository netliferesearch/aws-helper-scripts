Helper scripts to quickly build buckets with tidy access rights

## Getting started

1. Install [AWS command line tool](https://aws.amazon.com/cli).
    - Mac users can run `brew install awscli` (provided you have [brew](https://brew.sh/)).
1. Configure it with `aws configure` and add access token.
    - Note: We do not yet provide top level credentials to create buckets but soon.
1. Run `./s3-spin-up-a-bucket.sh bucket-name`. This will:
    1. Create a user called bucket-name for simplicity.
    1. Give user right to list buckets (not view their contents).
    1. Create bucket called bucket-name.
    1. Add bucket access policy so that user can work within the bucket. *Important:* All resources within bucket will be downloadable by anyone with a link by default.
    1. Create access tokens for the user.

Licensed under GNU GPLv3, see `LICENSE.txt`.
