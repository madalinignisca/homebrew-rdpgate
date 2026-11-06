cask "rdpgate" do
  version "0.2.0"
  sha256 "61202562f525301bde156f6d6459442ff5466e459b0f6a0bea7e0090c13123ba"

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

  uninstall quit: "me.madalin.rdpgate"

  zap trash: "~/Library/Application Support/RDPGate"

  caveats <<~EOS
    Saved passwords stay in the login keychain after uninstall and --zap
    (services local.rdpgate and local.rdpgate.identity).
    Remove them with Keychain Access if you want them gone.
  EOS
end
