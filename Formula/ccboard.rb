class Ccboard < Formula
  desc "Unified TUI/Web dashboard for Claude Code management"
  homepage "https://github.com/FlorianBruniaux/ccboard"
  version "0.21.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/FlorianBruniaux/ccboard/releases/download/v#{version}/ccboard-macos-aarch64.tar.gz"
      sha256 "a33c724cae7212a138798000bf0af989e23440ff6f9bd3cd8b80aa129aba425e"
    end
    on_intel do
      url "https://github.com/FlorianBruniaux/ccboard/releases/download/v#{version}/ccboard-macos-x86_64.tar.gz"
      sha256 "3888b661159bdffd472c7944bae6f524e4fdfdb4d0149327d550e2921a3269f9"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/FlorianBruniaux/ccboard/releases/download/v#{version}/ccboard-linux-x86_64.tar.gz"
      sha256 "52e79f8a07234c33486c40586fb21673d09c966754d10f9ecdc5ed423243c657"
    end
  end

  def install
    bin.install "ccboard"
  end

  def caveats
    <<~EOS
      To set up live session monitoring hooks, run:
        ccboard setup

      To start the web dashboard:
        ccboard web --port 3333

      Sessions data is read from ~/.claude (read-only).
    EOS
  end

  test do
    system "#{bin}/ccboard", "--version"
  end
end
