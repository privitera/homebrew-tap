class UtcClock < Formula
  desc "Menu bar clock showing UTC with seconds; click to copy an ISO-8601 timestamp"
  homepage "https://github.com/privitera/utc-clock"
  url "https://github.com/privitera/utc-clock/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "2899ea4b978721ccec1a054a564998f573804b4698068fc27a0e302fd834140b"
  license "MIT"

  depends_on macos: :ventura

  def install
    contents = prefix/"UTCClock.app/Contents"
    (contents/"MacOS").mkpath
    contents.install "Info.plist"
    system "swiftc", "-O", "-o", contents/"MacOS/UTCClock", "main.swift"
    system "codesign", "--force", "--sign", "-", prefix/"UTCClock.app"
  end

  def caveats
    <<~EOS
      If the clock doesn't appear, check System Settings > Menu Bar > Allow in the Menu Bar,
      or make room: a notch hides the leftmost menu bar items when the bar is crowded.
    EOS
  end

  # Restart after a crash, but stay quit after "Quit UTC Clock" until next login.
  service do
    run opt_prefix/"UTCClock.app/Contents/MacOS/UTCClock"
    keep_alive crashed: true
    process_type :interactive
  end

  test do
    assert_path_exists prefix/"UTCClock.app/Contents/MacOS/UTCClock"
    plist = prefix/"UTCClock.app/Contents/Info.plist"
    assert_match "local.utcclock", shell_output("plutil -extract CFBundleIdentifier raw #{plist}")
  end
end
