defmodule AwsClientUploaderEx.S3Config do
  @moduledoc """
    module that handles the config settings for the aws s3 signing functions
  """

  def aws_config do
    %{
      scheme: scheme(),
      host: host(),
      region: region(),
      access_key_id: aws_access_key_id(),
      secret_access_key: aws_secret_key()
    }
  end

  def bucket_url, do: "https://#{host()}/#{bucket()}/#{bucket_divider()}"

  def region do
    {:ok, aws_region} = Confex.fetch_env(:aws_client_uploader_ex, :aws_region)
    aws_region
  end

  def scheme do
    {:ok, aws_scheme} = Confex.fetch_env(:aws_client_uploader_ex, :aws_scheme)
    aws_scheme
  end

  def host do
    {:ok, aws_host} = Confex.fetch_env(:aws_client_uploader_ex, :aws_host)
    aws_host
  end

  def bucket do
    {:ok, aws_bucket} = Confex.fetch_env(:aws_client_uploader_ex, :aws_bucket)
    aws_bucket
  end

  def bucket_divider do
    {:ok, aws_bucket_divider} = Confex.fetch_env(:aws_client_uploader_ex, :aws_bucket_divider)
    aws_bucket_divider
  end


  def aws_access_key_id do
    {:ok, access_key} = Confex.fetch_env(:aws_client_uploader_ex, :aws_access_key_id)
    access_key
  end

  def aws_secret_key do
    {:ok, access_secret} = Confex.fetch_env(:aws_client_uploader_ex, :aws_secret_access_key)
    access_secret
  end
end
