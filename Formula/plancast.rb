class Plancast < Formula
  desc "Turn documents and articles into local two-host audio briefings"
  homepage "https://sarthakdabhi.github.io/plancast/"
  url "https://github.com/sarthakdabhi/plancast/releases/download/v0.2.0/plancast-0.2.0-macos-arm64.tar.gz"
  sha256 "0f4e16b4d4f8a67986ec3ce66e378a1ebc799af59dfe1c388081f9ce7447e650"
  license "MIT"

  depends_on arch: :arm64
  depends_on macos: :sonoma

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"plancast"
  end

  def caveats
    <<~EOS
      Run `plancast setup-local` to download private runtimes and models.
      The default dialogue model is about 9.3 GB; speech assets need additional space.
      This early prerelease is validated on Apple Silicon only.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/plancast --version")
    (testpath/"article.txt").write "A report describes a small study and its limitations.\n"
    assert_match '"sourceKind": "text"', shell_output("#{bin}/plancast #{testpath}/article.txt --dry-run")
    (testpath/"plan.md").write "# Plan\nShip a small feature. Next action: test the prototype.\n"
    assert_match '"status": "dry_run"', shell_output("#{bin}/plancast #{testpath}/plan.md --dry-run")
  end
end
