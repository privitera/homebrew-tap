class UtcClock < Formula
  desc "Menu bar clock showing UTC with seconds; click to copy an ISO-8601 timestamp"
  homepage "https://github.com/privitera/shareware/tree/main/utc-clock"
  url "https://github.com/privitera/shareware/archive/refs/tags/utc-clock-v1.0.0.tar.gz"
  sha256 "d81ee61d08ab1f70ac22d52b430edc89b796c4af5bc2c9479c7bc16b66af9efe"

  depends_on macos: :ventura

  def install
    contents = prefix/"UTCClock.app/Contents"
    (contents/"MacOS").mkpath
    cd "utc-clock" do
      contents.install "Info.plist"
      system "swiftc", "-O", "-o", contents/"MacOS/UTCClock", "main.swift"
    end
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
