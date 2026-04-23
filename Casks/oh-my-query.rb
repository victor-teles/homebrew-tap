cask "oh-my-query" do
  version "0.0.10"

  on_arm do
    url "https://github.com/victor-teles/oh-my-query/releases/download/v#{version}/oh_my_query_#{version}_aarch64.dmg"
    sha256 "803c0b55abc9f81ba03c72c8466b9dce6329e8d8b58bfb23c70e5f6d2b399de1"
  end

  on_intel do
    url "https://github.com/victor-teles/oh-my-query/releases/download/v#{version}/oh_my_query_#{version}_x64.dmg"
    sha256 "e8ab6ae6b1793ee1c792437400af80e94a3f9b2ad21afaa4712b45c856e73129"
  end

  name "Oh my query"
  desc "Desktop app for querying databases with AI"
  homepage "https://github.com/victor-teles/oh-my-query"

  app "oh_my_query.app"

  postflight do
    system_command "/usr/bin/xattr",
      args: ["-dr", "com.apple.quarantine", "#{appdir}/oh_my_query.app"],
      sudo: false
  end

  uninstall quit: "dev.ohmyquery.app"

  zap trash: [
    "~/Library/Application Support/dev.ohmyquery.app",
    "~/Library/Caches/dev.ohmyquery.app",
    "~/Library/Logs/dev.ohmyquery.app",
  ]
end
