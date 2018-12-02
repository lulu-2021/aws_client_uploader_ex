# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
use Mix.Config

config :aws_client_uploader_ex,
  aws_access_key_id: {:system, :string, "AWS_CLIENT_CLIENT_UPLOADER_AWS_ACCESS_KEY_ID"},
  aws_secret_access_key: {:system, :string, "AWS_CLIENT_CLIENT_UPLOADER_AWS_SECRET_ACCESS_KEY"},
  aws_bucket: {:system, :string, "AWS_CLIENT_CLIENT_UPLOADER_AWS_BUCKET"},
  aws_region: {:system, :string, "AWS_CLIENT_CLIENT_UPLOADER_AWS_REGION"},
  aws_host: {:system, :string, "AWS_CLIENT_CLIENT_UPLOADER_AWS_HOST"},
  aws_scheme: {:system, :string, "AWS_CLIENT_CLIENT_UPLOADER_AWS_SCHEME"}
