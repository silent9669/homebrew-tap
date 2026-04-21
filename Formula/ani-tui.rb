class AniTui < Formula
  desc "TUI for anime streaming"
  homepage "https://github.com/silent9669/ani-tui"
  url "https://github.com/silent9669/ani-tui/archive/refs/tags/v3.8.0.tar.gz"
  version "3.8.0"
  sha256 "44ec7077dfee2ae18fedff1e4f20cafe3e8ab8f40db10d452f2c472842603582"
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
