cask "brainselector" do
  version "0.6.34"
  sha256 "8b8c5fe1cc25fa09260fcce164fa0b556d200cffaa8315d2ed96f1e561ec5e3e"

  url "https://github.com/jniedzie/brainselector/releases/download/v#{version}/BrainSelector-#{version}-macOS-arm64.zip"
  name "BrainSelector"
  desc "Model routing and usage dashboard for Codex and Claude"
  homepage "https://github.com/jniedzie/brainselector"

  depends_on arch: :arm64
  depends_on macos: :sequoia

  app "BrainSelector.app"
  binary "#{appdir}/BrainSelector.app/Contents/Resources/tui/brainselector", target: "brainselector"

  uninstall quit: ["com.jniedzie.brainselector", "ch.cern.brainselector", "local.llm-pilot.control"]

  caveats <<~EOS
    Open BrainSelector from Applications to finish setup.
    Before uninstalling, disconnect desktop routing in BrainSelector.
    Your history and settings are retained.
  EOS
end
