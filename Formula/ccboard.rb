class Ccboard < Formula
  desc "Unified TUI/Web dashboard for Claude Code management"
  homepage "https://github.com/FlorianBruniaux/ccboard"
  version "0.16.5"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/FlorianBruniaux/ccboard/releases/download/v#{version}/ccboard-macos-aarch64.tar.gz"
      sha256 "50915a2361a14bc7c297427d26c307944ae617d94c4c713adfd9d5aa850fa508"
    end
    on_intel do
      url "https://github.com/FlorianBruniaux/ccboard/releases/download/v#{version}/ccboard-macos-x86_64.tar.gz"
      sha256 "30a52a7b1182478fbf1336afbf0d7e63e1954b345d6990f2ec24765a656d5edf"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/FlorianBruniaux/ccboard/releases/download/v#{version}/ccboard-linux-x86_64.tar.gz"
      sha256 "f31404af9f00a74ecfc272a149fbe6a72aba3bcec29593d3cb8fb3242c7409bd"
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
