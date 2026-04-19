class AniTui < Formula
  desc "TUI for anime streaming"
  homepage "https://github.com/silent9669/ani-tui"
  url "https://github.com/silent9669/ani-tui/archive/refs/tags/v3.8.0.tar.gz"
  sha256 "42dc8c7fbcac94d5e2d2298fe8e623f664527a27a21b8af8dd77b00ba2bfbb10"
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
