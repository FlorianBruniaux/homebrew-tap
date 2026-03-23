class Ccboard < Formula
  desc "Unified TUI/Web dashboard for Claude Code management"
  homepage "https://github.com/FlorianBruniaux/ccboard"
  version "0.16.1"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/FlorianBruniaux/ccboard/releases/download/v#{version}/ccboard-macos-aarch64.tar.gz"
      sha256 "0caac2b1e41a8e61d6aa8296684ec558c179be6c916164c3f200aefa05a8f4f4"
    end
    on_intel do
      url "https://github.com/FlorianBruniaux/ccboard/releases/download/v#{version}/ccboard-macos-x86_64.tar.gz"
      sha256 "db9076f2bea5280c54fa5ed7e3169b015c97390c23307da5f4e8683c2698e6ea"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/FlorianBruniaux/ccboard/releases/download/v#{version}/ccboard-linux-x86_64.tar.gz"
      sha256 "7ca8d1a00d7bddf038e20e695d535c80d6c2522dd6bd8cea122649fc1f203f24"
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
