class Ticket < Formula
  desc "Minimal ticket tracking in bash"
  homepage "https://github.com/wedow/ticket"
  url "https://github.com/wedow/ticket/archive/refs/tags/v0.3.2.tar.gz"
  sha256 "5d4c82ed1c5cb4a2aeb63b47c3c8931738c3287e555f43bf831d3d323687db0f"
  license "MIT"

  def install
    bin.install "ticket" => "tk"
  end

  test do
    system "#{bin}/tk", "help"
  end
end
