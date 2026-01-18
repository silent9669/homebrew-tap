class AniTui < Formula
  desc "Anime TUI with image previews and terminal streaming"
  homepage "https://github.com/silent9669/ani-tui"
  url "https://github.com/silent9669/ani-tui/archive/refs/tags/v2.0.0.tar.gz"
  sha256 "d900d34b699d91f4449d16f6a23e1c1f8a824467490156acab82ae2b1a51cd8c"
  license "GPL-3.0-or-later"
  head "https://github.com/silent9669/ani-tui.git", branch: "master"

  # macOS only (requires bash, fzf, chafa which work best on macOS)
  depends_on :macos

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
