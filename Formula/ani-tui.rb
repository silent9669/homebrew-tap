class AniTui < Formula
  desc "Anime TUI with image previews and terminal streaming"
  homepage "https://github.com/silent9669/ani-tui"
  url "https://github.com/silent9669/ani-tui/archive/refs/heads/master.tar.gz"
  sha256 "dc4148c84b42867c57c8c04250603538bf64f4b08c9b95dc72cdccca0b565c78"
  version "1.0.0"
  license "GPL-3.0-or-later"
  head "https://github.com/silent9669/ani-tui.git", branch: "master"

  depends_on "bash"
  depends_on "curl"
  depends_on "fzf"
  depends_on "jq"
  depends_on "chafa" => :recommended
  depends_on "mpv" => :recommended

  def install
    bin.install "macos/ani-tui" => "ani-tui"
    libexec.install "ani-tui/ani-cli"
  end

  def caveats
    <<~EOS
      For image previews: brew install chafa
      For video playback: brew install mpv
      Usage: ani-tui
    EOS
  end

  test do
    assert_match "ani-tui", shell_output("#{bin}/ani-tui --version")
  end
end
