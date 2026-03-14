class Ccboard < Formula
  desc "Unified TUI/Web dashboard for Claude Code management"
  homepage "https://github.com/FlorianBruniaux/ccboard"
  version "0.12.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/FlorianBruniaux/ccboard/releases/download/v#{version}/ccboard-macos-aarch64.tar.gz"
      sha256 "6e1f8b54ad9d1ccffbef1c42e587c38aa3fe165be32963de31a1e0d93df7294d"
    end
    on_intel do
      url "https://github.com/FlorianBruniaux/ccboard/releases/download/v#{version}/ccboard-macos-x86_64.tar.gz"
      sha256 "e0d1389b7b6f0340b4676badf0b2d1f0a5f6ab23c9885a7761e2c84ea34d59aa"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/FlorianBruniaux/ccboard/releases/download/v#{version}/ccboard-linux-x86_64.tar.gz"
      sha256 "e61e4745d276f2c6bf18eb32605eb637037970ca7dcfec96c21698860fc31edc"
    end
  end

  def install
    bin.install "ccboard"
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
        ccboard discover     # Analyze sessions for CLAUDE.md/skills/commands suggestions

      Documentation:
        https://github.com/FlorianBruniaux/ccboard#readme
    EOS
  end

  test do
    assert_match "ccboard", shell_output("#{bin}/ccboard --version 2>&1")
  end
end
