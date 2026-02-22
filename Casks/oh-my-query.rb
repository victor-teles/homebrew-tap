cask "oh-my-query" do
  version "0.0.5"

  on_arm do
    url "https://github.com/victor-teles/oh-my-query/releases/download/v#{version}/oh-my-query_#{version}_aarch64.dmg"
    sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  end

  on_intel do
    url "https://github.com/victor-teles/oh-my-query/releases/download/v#{version}/oh-my-query_#{version}_x64.dmg"
    sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
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
