class Harness < Formula
  desc "Minimal agent loop in bash"
  homepage "https://github.com/wedow/harness"
  url "https://github.com/wedow/harness/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "a587236c7598ea71b114073bb6e0d5505c5c1f44146d5bfa69310b3361a20e3e"
  license "MIT"

  depends_on "bash"
  depends_on "curl"
  depends_on "jq"

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
