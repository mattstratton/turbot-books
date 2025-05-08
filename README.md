# turbot-books

This is a basic setup that uses docker-compose to run Writebook behind an Envoy reverse proxy.

The Dockerfile for Writebook has some modifications to allow it to run behind the reverse proxy, and also to have automatic backups to S3 using [Litestream](https://litestream.io/).

## Environment var

Before running the setup, you need to create a `.env` file in the root directory with the following variables:

```env
# .env
REPLICA_URL=s3://....
AWS_ACCESS_KEY_ID=AKIAXXXXXX
AWS_SECRET_ACCESS_KEY=XXXXX
SECRET_KEY_BASE=xxxx
```

| Variable | Description |
| - | - |
| REPLICA_URL | URL to the s3 bucket/path |
| AWS_ACCESS_KEY_ID | the access key for AWS for the user with access to the backup bucket |
| AWS_SECRET_ACCESS_KEY | the secret access key for AWS for the user with access to the backup bucket |
| SECRET_KEY_BASE |  a random string, unique to your deployment used to generate installation-specific secrets like cookies |

## Running locally

Just run the following command to start the setup:

```bash
docker-compose up -d --build
```