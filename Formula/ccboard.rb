class Ccboard < Formula
  desc "Unified TUI/Web dashboard for Claude Code management"
  homepage "https://github.com/FlorianBruniaux/ccboard"
  url "https://github.com/FlorianBruniaux/ccboard/archive/refs/tags/v0.11.0.tar.gz"
  sha256 "0f14f5d5ea4780a45b8db64566168796ef0076ed18e06f82c99c2b4606d4de7f"
  version "0.11.0"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/FlorianBruniaux/ccboard.git", branch: "main"

  depends_on "rust" => :build

  def install
    # Build workspace and install binary from ccboard crate
    system "cargo", "build", "--release", "--bin", "ccboard"
    bin.install "target/release/ccboard"
  end

  def caveats
    <<~EOS
      ccboard requires Claude Code installed with ~/.claude directory.

      Run Claude Code at least once to generate the directory:
        claude

      Launch ccboard:
        ccboard              # TUI mode (default)
        ccboard web          # Web interface on port 3333
        ccboard stats        # Print stats and exit

      Documentation:
        https://github.com/FlorianBruniaux/ccboard#readme
    EOS
  end

  test do
    assert_match "ccboard", shell_output("#{bin}/ccboard --version 2>&1")
  end
end
