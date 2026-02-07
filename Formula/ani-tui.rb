class AniTui < Formula
  desc "Netflix-inspired TUI for anime streaming"
  homepage "https://github.com/silent9669/ani-tui"
  url "https://github.com/silent9669/ani-tui/archive/refs/tags/v3.6.0.tar.gz"
  sha256 "c85bdfd554adeeda829f9ede60954fd7ba650da1b180f41c9449497f5ea0e8fa"
  license "MIT"
  head "https://github.com/silent9669/ani-tui.git", branch: "main"

  depends_on "rust" => :build
  depends_on "chafa"
  depends_on "mpv"

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/ani-tui", "--version"
  end
end
