cask "oh-my-query" do
  version "0.0.8"

  on_arm do
    url "https://github.com/victor-teles/oh-my-query/releases/download/v#{version}/oh_my_query_#{version}_aarch64.dmg"
    sha256 "6db052c63f078644faf483f3cdf429cc8fe36d61c65711ccfba846df83d12f24"
  end

  on_intel do
    url "https://github.com/victor-teles/oh-my-query/releases/download/v#{version}/oh_my_query_#{version}_x64.dmg"
    sha256 "dbbd3a0eee0abd3af1cee206818ba3a6d68d0cc5d64d877e5cf2ed051ced57cc"
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
