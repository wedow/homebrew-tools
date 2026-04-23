class Harness < Formula
  desc "Minimal agent loop in bash"
  homepage "https://github.com/wedow/harness"
  url "https://github.com/wedow/harness/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "3bcdba6d565af4e02fe6345edbfcfb89fa1965349fe7d33676b5a5bc158c0f3b"
  license "MIT"

  depends_on "bash"
  uses_from_macos "curl"
  depends_on "jq"
  uses_from_macos "perl"

  def install
    bin.install "bin/harness"
    bin.install_symlink "harness" => "hs"
    prefix.install "AGENTS.md"
    prefix.install "docs"
    prefix.install "LICENSE"
    prefix.install "plugins"
    prefix.install "README.md"

    inreplace bin/"harness", /^readonly HARNESS_ROOT=.*$/, <<~EOS
      readonly HARNESS_ROOT="#{prefix}"
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/harness version")
    assert_match version.to_s, shell_output("#{bin}/hs version")
  end
end
