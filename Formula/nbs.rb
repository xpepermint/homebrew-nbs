class Nbs < Formula
  desc "test cli"
  homepage "https://github.com/xpepermint"
  version "0.0.1"

  if OS.mac?
    url "https://github.com/xpepermint/nbs/archive/0.0.3.tar.gz"
    sha256 "d28a31f513c83c5355e2d91d6d5b5cc441f45fe24f9d62a982ba3a680a61b5ab"
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
