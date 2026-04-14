cask "oh-my-query" do
  version "0.0.9"

  on_arm do
    url "https://github.com/victor-teles/oh-my-query/releases/download/v#{version}/oh_my_query_#{version}_aarch64.dmg"
    sha256 "182698e6c73d012dea0d7223c4a1eec443bf659a95b30afd7521c603a4242606"
  end

  on_intel do
    url "https://github.com/victor-teles/oh-my-query/releases/download/v#{version}/oh_my_query_#{version}_x64.dmg"
    sha256 "e9ac99bc0a52201ee86c6125ec450e1107572c665d1cba8ccdc260bc8eeb0489"
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
