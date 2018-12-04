defmodule AwsClientUploaderEx.S3Client do
  @moduledoc """
    module that wraps S3 functions we need to sign / upload files from the client
  """
  alias ExAws.S3
  import AwsClientUploaderEx.S3Config
  require Logger

  def signed_download_url(filename), do: build_presigned_download_url(filename)

  def signed_upload_url(filename), do: build_presigned_upload_url(filename)

  @doc """
    if our response does not include a body...

    TODO: we need to determine the status of the response!
  """
  def list_objects(bucket, opts \\ []) do
    options = opts || config_opts()

    response = bucket
    |> S3.list_objects()
    |> ExAws.request!(options)

    case response do
      %{body: %{contents: objects}, status_code: 200} ->
        objects
        |> Enum.map(&(&1.key))
        |> Enum.map(&(
          String.split(&1, "/")
          |> List.last()
        ))

      {:error, {:http_error, error_code, "redirected"}} ->
        ["files not listed due to: #{error_code}"]
      _ ->
        ["files not listed due to: generic aws error"]
    end
  end

  defp config_opts do
    [
      scheme: scheme(),
      host: host(),
      region: region(),
      access_key_id: aws_access_key_id(),
      secret_access_key: aws_secret_key()
    ]
  end

  defp build_presigned_upload_url(s3_key) do
    signed_url = AWSAuth.sign_url(
      aws_access_key_id(),
      aws_secret_key(),
      "PUT",
      "#{bucket_url()}/#{s3_key}", region(), "s3"
    )
    log_url(signed_url, "upload")
    signed_url
  end

  defp build_presigned_download_url(filename) do
    if filename do
      s3_key = "/#{bucket_divider}/#{filename}" # we are using the additional `uploads` folder here
      {:ok, signed_url} = S3.presigned_url(aws_config(), :get, bucket(), s3_key)
      log_url(signed_url, "download")
      signed_url
    else
      nil
    end
  end

  defp log_url(url, type) do
    Logger.debug "\n\n-------Signed #{type} url:"
    Logger.debug url
    Logger.debug "----------\n\n"
  end
end
