class Plancast < Formula
  desc "Turn documents and articles into local two-host audio briefings"
  homepage "https://sarthakdabhi.github.io/plancast/"
  url "https://github.com/sarthakdabhi/plancast/releases/download/v0.4.0/plancast-0.4.0-macos-arm64.tar.gz"
  sha256 "298ac736a5158e41b3f35c595ecd80c4c08be39780bc9ed0ce942e4dd931a048"
  license "MIT"

  depends_on arch: :arm64
  depends_on macos: :sonoma

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"plancast"
  end

  def caveats
    <<~EOS
      Run `plancast setup-local` to choose and download your writing model.
      Choose Qwen3 4B (2.5 GB), 8B (5.0 GB), or 14B (9.3 GB); setup remembers your choice.
      Speech assets and dependencies need additional space.
      This early prerelease is validated on Apple Silicon only.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/plancast --version")
    assert_match "--model", shell_output("#{bin}/plancast setup-local --help")
    assert_match "Non-interactive setup needs", shell_output("#{bin}/plancast setup-local </dev/null 2>&1", 2)
    (testpath/"article.txt").write "A report describes a small study and its limitations.\n"
    assert_match '"sourceKind": "text"', shell_output("#{bin}/plancast #{testpath}/article.txt --dry-run")
    assert_match '"provider": "gemini"', shell_output("#{bin}/plancast #{testpath}/article.txt --provider gemini --dry-run")
    (testpath/"plan.md").write "# Plan\nShip a small feature. Next action: test the prototype.\n"
    assert_match '"status": "dry_run"', shell_output("#{bin}/plancast #{testpath}/plan.md --dry-run")
  end
end
