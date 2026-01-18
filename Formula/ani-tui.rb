class AniTui < Formula
  desc "Anime TUI with image previews and terminal streaming"
  homepage "https://github.com/silent9669/ani-tui"
  url "https://github.com/silent9669/ani-tui/archive/refs/tags/v2.0.1.tar.gz"
  sha256 "ea2caf1efd4f5c9c3cb388fb68d53aae28048ccc9e9dc9c9c2c8166f300cea68"
  license "GPL-3.0-or-later"
  head "https://github.com/silent9669/ani-tui.git", branch: "master"

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
