class Nbs < Formula
  desc "test cli"
  homepage "https://github.com/xpepermint"
  version "0.0.1"

  if OS.mac?
    url "https://github.com/xpepermint/nbs/archive/0.0.3.tar.gz"
    sha256 "55731e903011e6ecc4b93ba6be6ca275553ede9ab2d23162e424c17bb4f5c26b"
  end

  def install
    system "make", "bin/gh"
    bin.install "bin/nbs"
    (bash_completion/"nbs.sh").write `#{bin}/nbs completion -s bash`
    (zsh_completion/"_nbs").write `#{bin}/nbs completion -s zsh`
    (fish_completion/"nbs.fish").write `#{bin}/nbs completion -s fish`    
  end

  test do
    help_text = shell_output("#{bin}/nbs --help")
    assert_includes help_text, "Usage:"
  end
end
