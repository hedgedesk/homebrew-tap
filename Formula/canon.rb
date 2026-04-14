class Canon < Formula
  desc "Universal symbolic graph compiler for machine reasoning over software structure"
  homepage "https://github.com/hedgedesk/canon-releases"
  version "1.1.2"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hedgedesk/canon-releases/releases/download/v#{version}/canon-darwin-arm64"
      sha256 "866b91850a744c1ae4d0bb7ffe094771595b43e6a471eed7e1a59adeadbcbad1"
    else
      url "https://github.com/hedgedesk/canon-releases/releases/download/v#{version}/canon-darwin-amd64"
      sha256 "c81e120e508fa98b777124a848ad35367b07ebfce67f3eed1bb7aeb3409fde92"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/hedgedesk/canon-releases/releases/download/v#{version}/canon-linux-arm64"
      sha256 "3d2e7dca342c393d2cb9a8af847184731a5f2c09ae1eb3e13f6dae2a7bc96c0f"
    else
      url "https://github.com/hedgedesk/canon-releases/releases/download/v#{version}/canon-linux-amd64"
      sha256 "5ba5cccd1100ee20b10df679aa36998fc91d0dd52689ed1af1401ec9d7b5dffb"
    end
  end

  def install
    binary = Dir["canon-*"].first || "canon"
    bin.install binary => "canon"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/canon version")
  end
end
