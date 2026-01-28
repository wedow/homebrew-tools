class Ticket < Formula
  desc "Minimal ticket tracking in bash"
  homepage "https://github.com/wedow/ticket"
  url "https://github.com/wedow/ticket/archive/refs/tags/v0.3.1.tar.gz"
  sha256 "ee6dd094e262d8f02e451847249f0c3b665b92ab8e2317c9424553fc1f046d9e"
  license "MIT"

  def install
    bin.install "ticket" => "tk"
  end

  test do
    system "#{bin}/tk", "help"
  end
end
