defmodule AwsClientUploaderEx do
  @moduledoc """
    Documentation for AwsClientUploaderEx.
  """

  alias AwsClientUploaderEx.S3Client

  defdelegate signed_download_url(filename, options \\ []), to: S3Client, as: :signed_download_url
  defdelegate signed_upload_url(filename), to: S3Client, as: :signed_upload_url
  defdelegate list_files(bucket, options \\ []), to: S3Client, as: :list_objects
end
