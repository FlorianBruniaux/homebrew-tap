class Ccboard < Formula
  desc "Unified TUI/Web dashboard for Claude Code management"
  homepage "https://github.com/FlorianBruniaux/ccboard"
  version "0.25.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/FlorianBruniaux/ccboard/releases/download/v#{version}/ccboard-macos-aarch64.tar.gz"
      sha256 "f994311e47b2e534098a60910a75a006d28e39748fa26b40a91d6c95acc0beda"
    end
    on_intel do
      url "https://github.com/FlorianBruniaux/ccboard/releases/download/v#{version}/ccboard-macos-x86_64.tar.gz"
      sha256 "1406be3512faab360d746b1f9542ec4a5357b46de32bf5b6a5077f444d6f5996"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/FlorianBruniaux/ccboard/releases/download/v#{version}/ccboard-linux-x86_64.tar.gz"
      sha256 "edb5d5c4ae8880ef29a8f9b691f219b5e5f2380985f4849520a0bea580b01daa"
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
