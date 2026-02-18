class Ccboard < Formula
  desc "Unified TUI/Web dashboard for Claude Code management"
  homepage "https://github.com/FlorianBruniaux/ccboard"
  url "https://github.com/FlorianBruniaux/ccboard/archive/refs/tags/v0.9.0.tar.gz"
  sha256 "35e027d22353cb769ab74d384eeb4657fc9445883d8bf5e53240cd9ac8deeead"
  version "0.9.0"
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
