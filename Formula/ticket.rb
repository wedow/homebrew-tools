class Ticket < Formula
  desc "Minimal ticket tracking in bash"
  homepage "https://github.com/wedow/ticket"
  url "https://github.com/wedow/ticket/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "63f8591a432d65ef87843fcd5e720a397865534bdbdc8d6724e8f70ce681a63b"
  license "MIT"

  def install
    bin.install "ticket" => "tk"
  end

  test do
    system "#{bin}/tk", "help"
  end
end
