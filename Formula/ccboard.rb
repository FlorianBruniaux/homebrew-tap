class Ccboard < Formula
  desc "Unified TUI/Web dashboard for Claude Code management"
  homepage "https://github.com/FlorianBruniaux/ccboard"
  url "https://github.com/FlorianBruniaux/ccboard/archive/refs/tags/v0.5.2.tar.gz"
  sha256 "7515bf959b73b956ceb967351c7e299cbb3668a53d35f9c770eb72e00d93ced6"
  license "MIT OR Apache-2.0"

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
