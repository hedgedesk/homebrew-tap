class Canon < Formula
  desc "Universal symbolic graph compiler for machine reasoning over software structure"
  homepage "https://github.com/hedgedesk/canon-releases"
  version "1.2.2"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hedgedesk/canon-releases/releases/download/v#{version}/canon-darwin-arm64"
      sha256 "9e9dbb96b09fe21dac28c26a1c7e1d48ee60ef228a544e520e165c87e3db0d34"
    else
      url "https://github.com/hedgedesk/canon-releases/releases/download/v#{version}/canon-darwin-amd64"
      sha256 "42b195db54292210dca021a14393aac76b5525ef2f320dc042237891ce4481b8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/hedgedesk/canon-releases/releases/download/v#{version}/canon-linux-arm64"
      sha256 "f7d71b8c9649fe00cf07d34757bf07f62bbe2c93b8f136f5b4ff72a47983dc80"
    else
      url "https://github.com/hedgedesk/canon-releases/releases/download/v#{version}/canon-linux-amd64"
      sha256 "6e99284b1d01fbcfb0caa04707a6a0e51d7be8b4fb2472ea357ba9ba84fd6bee"
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
