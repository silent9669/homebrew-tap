class AniTui < Formula
  desc "Netflix-inspired TUI for anime streaming"
  homepage "https://github.com/silent9669/ani-tui"
  url "https://github.com/silent9669/ani-tui/archive/refs/tags/v3.6.1.tar.gz"
  sha256 "a29819f7feebe7ce6bb442c372e7c1d228a98344b1320ba06762dcb2be394c3a"
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
