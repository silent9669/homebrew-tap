class AniTui < Formula
  desc "Anime TUI with image previews and terminal streaming"
  homepage "https://github.com/silent9669/ani-TUI-for-macOS"
  url "https://github.com/silent9669/ani-TUI-for-macOS/archive/refs/heads/master.tar.gz"
  version "1.0.0"
  license "GPL-3.0-or-later"
  head "https://github.com/silent9669/ani-TUI-for-macOS.git", branch: "master"

  depends_on "bash"
  depends_on "curl"
  depends_on "fzf"
  depends_on "jq"
  depends_on "chafa" => :recommended
  depends_on "mpv" => :recommended

  def install
    bin.install "macos/ani-tui" => "ani-tui"
    
    # Install ani-cli for streaming
    libexec.install "ani-tui/ani-cli"
  end

  def caveats
    <<~EOS
      ani-tui has been installed!

      For image previews: brew install chafa
      For video playback: brew install mpv

      Usage: ani-tui
    EOS
  end

  test do
    assert_match "ani-tui", shell_output("#{bin}/ani-tui --version")
  end
end
