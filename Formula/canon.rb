class Canon < Formula
  desc "Universal symbolic graph compiler for machine reasoning over software structure"
  homepage "https://github.com/hedgedesk/canon-releases"
  version "1.2.0"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hedgedesk/canon-releases/releases/download/v#{version}/canon-darwin-arm64"
      sha256 "5630c6f32283da090fba8c258b77dc79824d3c32c3600596145f9c5498ffc7a7"
    else
      url "https://github.com/hedgedesk/canon-releases/releases/download/v#{version}/canon-darwin-amd64"
      sha256 "af7e479cde36c0afb64642a1316c72b9e037371ac426eed2cbc4035b0d461381"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/hedgedesk/canon-releases/releases/download/v#{version}/canon-linux-arm64"
      sha256 "45dd3f29f802fc84882e45f0235974f0d39058d10b3097c07a25d596a6ca564b"
    else
      url "https://github.com/hedgedesk/canon-releases/releases/download/v#{version}/canon-linux-amd64"
      sha256 "6a99c9faa4502b6dd4a6502343d5a5d938ffec3e92907a80be419745c36d95e1"
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
