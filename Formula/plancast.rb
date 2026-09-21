class Plancast < Formula
  desc "Turn Markdown plans into local two-host audio briefings"
  homepage "https://github.com/sarthakdabhi/plancast"
  url "https://github.com/sarthakdabhi/plancast/releases/download/v0.1.0/plancast-0.1.0-macos-arm64.tar.gz"
  sha256 "270eed8ff6415f91a98779603dce080ef101c639513ce51d5d656ba29493375a"
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
    (testpath/"plan.md").write "# Plan\nShip a small feature. Next action: test the prototype.\n"
    assert_match '"status": "dry_run"', shell_output("#{bin}/plancast #{testpath}/plan.md --dry-run")
  end
end
