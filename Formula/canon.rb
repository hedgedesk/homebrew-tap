class Canon < Formula
  desc "Universal symbolic graph compiler for machine reasoning over software structure"
  homepage "https://github.com/hedgedesk/canon-releases"
  version "1.6.0"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hedgedesk/canon-releases/releases/download/v#{version}/canon-darwin-arm64"
      sha256 "6b460054f6d05b50bf4313733d86bb9dfd8026132e3ceb0f8ba3ab4055e4c324"
    else
      url "https://github.com/hedgedesk/canon-releases/releases/download/v#{version}/canon-darwin-amd64"
      sha256 "614a5bcbbaf7cb1c61668b2d256585f8d551c5025d17a47488be7d4ca2a3307d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/hedgedesk/canon-releases/releases/download/v#{version}/canon-linux-arm64"
      sha256 "5248af560fe500d438622f69b2104440ed7e7ed3b84ed0817291eca10bee304f"
    else
      url "https://github.com/hedgedesk/canon-releases/releases/download/v#{version}/canon-linux-amd64"
      sha256 "543e6b46c9e3e124699cad54ba8501876fa9f36fb8dc7b229c23ab95e55fb252"
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
