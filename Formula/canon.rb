class Canon < Formula
  desc "Universal symbolic graph compiler for machine reasoning over software structure"
  homepage "https://github.com/hedgedesk/canon-releases"
  version "1.0.4"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hedgedesk/canon-releases/releases/download/v#{version}/canon-darwin-arm64"
      sha256 "98930d9b1acabd295796e364c6283b3261b6de9a467f37af99b3eadf977645e3"
    else
      url "https://github.com/hedgedesk/canon-releases/releases/download/v#{version}/canon-darwin-amd64"
      sha256 "b3a8a357a9e0450c8edf1879e3426a36272c1280fdd1a6651e1d0e5c649b5024"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/hedgedesk/canon-releases/releases/download/v#{version}/canon-linux-arm64"
      sha256 "27a0efac2b0bfa34e1478ae749682f76c8c75d1741f05445b8ff8e7d0a2ca652"
    else
      url "https://github.com/hedgedesk/canon-releases/releases/download/v#{version}/canon-linux-amd64"
      sha256 "bf0710d5af7f62a19d37f9c5c2c99047be9e1b9308512a7b676945aa8d3bc777"
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
