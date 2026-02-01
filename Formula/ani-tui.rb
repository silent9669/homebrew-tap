class AniTui < Formula
  desc "Netflix-inspired TUI for anime streaming"
  homepage "https://github.com/silent9669/ani-tui"
  url "https://github.com/silent9669/ani-tui/archive/refs/tags/v3.3.0.tar.gz"
  sha256 "7c5adb1bca21a562821c2dc1efcd4dd49ca8b5428414e4e338fc5e9bc5695b26"
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
