class AniTui < Formula
  desc "A Netflix-inspired TUI for anime streaming"
  homepage "https://github.com/silent9669/ani-tui"
  url "https://github.com/silent9669/ani-tui/archive/refs/tags/v'${VERSION}'.tar.gz"
  sha256 "56567e40324881446d0636151c2bb888be21fd1e5cce6eb4aab7ee19f2449d9e"
  license "MIT"
  head "https://github.com/silent9669/ani-tui.git", branch: "main"

  depends_on "rust" => :build
  depends_on "chafa"
  depends_on "mpv"

  on_macos do
    depends_on macos: :sonoma
  end

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/ani-tui", "--version"
  end
end
