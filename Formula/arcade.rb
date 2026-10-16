class Arcade < Formula
  desc "Retro mini-game arcade: SkiFree, Pong, Breakout, Snake and a sketch pad"
  homepage "https://github.com/privitera/shareware/tree/main/arcade"
  url "https://github.com/privitera/shareware/releases/download/arcade-v0.1.0/arcade-0.1.0-macos.tar.gz"
  sha256 "a6494a911756ffdd72f8b3f0523c4844622b49eb05aa7f99ef20e1c3586f0d4f"
  license "MIT"

  depends_on :macos

  # A prebuilt universal binary from the shareware release workflow.
  def install
    bin.install "arcade"
  end

  # The binary opens a window, so check it rather than run it.
  test do
    assert_match "x86_64 arm64", shell_output("lipo -archs #{bin}/arcade")
  end
end
