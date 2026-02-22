cask "oh-my-query" do
  version "0.0.4"

  on_arm do
    url "https://github.com/victor-teles/oh-my-query/releases/download/v#{version}/oh-my-query_#{version}_aarch64.dmg"
    sha256 "8f47f8b0c5866024d30c147d882b8be49dbcccbc4d74a6f0ad412dfa1ecd5d92"
  end

  on_intel do
    url "https://github.com/victor-teles/oh-my-query/releases/download/v#{version}/oh-my-query_#{version}_x64.dmg"
    sha256 "13f9d16b00dee741918f2eeaf51c49e3d296ea6a69a5f443c973b32be231b6af"
  end

  name "Oh my query"
  desc "Desktop app for querying databases with AI"
  homepage "https://github.com/victor-teles/oh-my-query"

  app "OhMyQuery.app"

  postflight do
    system_command "/usr/bin/xattr",
      args: ["-dr", "com.apple.quarantine", "#{appdir}/OhMyQuery.app"],
      sudo: false
  end

  uninstall quit: "dev.ohmyquery.app"

  zap trash: [
    "~/Library/Application Support/dev.ohmyquery.app",
    "~/Library/Caches/dev.ohmyquery.app",
    "~/Library/Logs/dev.ohmyquery.app",
  ]
end
