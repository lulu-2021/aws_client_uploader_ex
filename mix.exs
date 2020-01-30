defmodule AwsClientUploaderEx.MixProject do
  use Mix.Project

  def project do
    [
      app: :aws_client_uploader_ex,
      version: "0.1.6",
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
      {:ex_aws, "~> 2.1"},
      {:ex_aws_s3, "~> 2.0.1"},
      {:aws_auth, "~> 0.7.2"},
      {:poison, "~> 3.0"},
      {:hackney, "~> 1.15.2"},
      {:sweet_xml, "~> 0.6.5"},
      {:confex, "~> 3.3.1"}
    ]
  end
end
