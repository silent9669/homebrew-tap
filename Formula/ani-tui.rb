class AniTui < Formula
  desc "Netflix-inspired TUI for anime streaming"
  homepage "https://github.com/silent9669/ani-tui"
  url "https://github.com/silent9669/ani-tui/archive/refs/tags/v3.4.0.tar.gz"
  sha256 "fe267b67947f203ed1919798e8036ff5b7f304675e8234a3d1e1e86d72f8012e"
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
