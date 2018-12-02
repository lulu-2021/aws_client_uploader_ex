defmodule AwsClientUploaderEx.MixProject do
  use Mix.Project

  def project do
    [
      app: :aws_client_uploader_ex,
      version: "0.1.0",
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :ex_aws, :ex_aws_s3]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_aws, "~> 2.0"},
      {:ex_aws_s3, "~> 2.0"}
    ]
  end
end
