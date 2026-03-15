class AniTui < Formula
  desc "TUI for anime streaming"
  homepage "https://github.com/silent9669/ani-tui"
  url "https://github.com/silent9669/ani-tui/archive/refs/tags/v3.7.5.tar.gz"
  sha256 "e788b4c01a0ac1e611163aff4e58e65083cfa4fd98186bec72780d65f0d79233"
  license "MIT"
  head "https://github.com/silent9669/ani-tui.git", branch: "main"

  depends_on "pkgconf" => :build
  depends_on "rust" => :build
  depends_on "chafa"
  depends_on "mpv"

  on_linux do
    depends_on "openssl@3"
  end

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "ani-tui", shell_output("#{bin}/ani-tui --help")
    assert_match version.to_s, shell_output("#{bin}/ani-tui --version")
  end
end
