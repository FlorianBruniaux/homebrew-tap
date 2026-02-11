class Ccboard < Formula
  desc "Unified TUI/Web dashboard for Claude Code management"
  homepage "https://github.com/FlorianBruniaux/ccboard"
  url "https://github.com/FlorianBruniaux/ccboard/archive/refs/tags/v0.5.2.tar.gz"
  sha256 "0f47322a4d9f22fd8d155a8fcdb7e73df08802ed29045466b4a154dce5802b67"
  version "0.5.2"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/FlorianBruniaux/ccboard.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
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
