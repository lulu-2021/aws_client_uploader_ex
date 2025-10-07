defmodule AwsClientUploaderEx.MixProject do
  use Mix.Project

  def project do
    [
      app: :aws_client_uploader_ex,
      version: "0.2.1",
      elixir: "~> 1.18.4",
      start_permanent: Mix.env() == :prod,
      description: description(),
      package: package(),
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
      {:ex_aws, "~> 2.6.0"},
      {:ex_aws_s3, "~> 2.5.8"},
      {:aws_auth, git: "https://github.com/lulu-2021/aws_auth.git"},
      {:poison, "~> 5.0.0"},
      {:hackney, "~> 1.25.0"},
      {:sweet_xml, "~> 0.7.5"},
      {:confex, "~> 3.5.1"},
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false}
    ]
  end

  defp description do
    """
	a small library wrapping aws functions
    """
  end

  defp package do
    [
      files: ["lib", "mix.exs", "README*", "LICENSE*"],
      maintainers: ["Netflakes"],
      licenses: ["Apache License 2.0"],
      links: %{"GitHub" => "https://github.com/netflakes/aws_client_uploader"}
    ]
  end

end
