class Canon < Formula
  desc "Universal symbolic graph compiler for machine reasoning over software structure"
  homepage "https://github.com/hedgedesk/canon-releases"
  version "2.0.0"
  license "Proprietary"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/hedgedesk/canon-releases/releases/download/v#{version}/canon-darwin-arm64"
      sha256 "06ab9757d99f92e1bedc1329dcfc5eb1b9403aa76918cfe713c33e5339ea89a1"
    else
      url "https://github.com/hedgedesk/canon-releases/releases/download/v#{version}/canon-darwin-amd64"
      sha256 "9525ff2b7b42798bd9cf9bc7ce59a595ca1c8a5941ad973a674756d013a04d83"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/hedgedesk/canon-releases/releases/download/v#{version}/canon-linux-arm64"
      sha256 "c1e0425cc1ad1fdcfb8a257cd8bb9998908ade5cbabb608e8f2e2d38676c44bb"
    else
      url "https://github.com/hedgedesk/canon-releases/releases/download/v#{version}/canon-linux-amd64"
      sha256 "89d8cbda7ace679ee2e310c32f6e673f76088fa61b1a9f2ea5994e00be55c4bf"
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
