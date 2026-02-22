cask "oh-my-query" do
  version "0.0.6"

  on_arm do
    url "https://github.com/victor-teles/oh-my-query/releases/download/v#{version}/oh_my_query_#{version}_aarch64.dmg"
    sha256 "6faf65ab3e9e18a86595c32fa224f6dc418780e62165fd8b2932ddd9fd06c2f7"
  end

  on_intel do
    url "https://github.com/victor-teles/oh-my-query/releases/download/v#{version}/oh_my_query_#{version}_x64.dmg"
    sha256 "ec0d0eb483e3397821f0de80d5fc570489cdffc47660a8b8b132fa9404d29490"
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
