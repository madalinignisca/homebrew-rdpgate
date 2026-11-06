cask "rdpgate" do
  version "0.2.0"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"

  url "https://github.com/madalinignisca/rdpgate/releases/download/v#{version}/RDPGate-#{version}-arm64.zip"
  name "RDPGate"
  desc "Menu bar launcher for FreeRDP with per-target SOCKS5 proxies"
  homepage "https://github.com/madalinignisca/rdpgate"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on formula: "freerdp"
  depends_on macos: :sonoma

  app "RDPGate.app"

  uninstall quit: "io.github.madalinignisca.rdpgate"

  zap trash: "~/Library/Application Support/RDPGate"

  caveats <<~EOS
    Saved passwords stay in the login keychain after uninstall and --zap
    (services local.rdpgate and local.rdpgate.identity).
    Remove them with Keychain Access if you want them gone.
  EOS
end
