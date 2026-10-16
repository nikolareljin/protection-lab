class Labbin < Formula
  desc "Lab binary"
  homepage "https://github.com/nikolareljin/protection-lab"
  version "0.0.1"
  license "MIT"
  tag = "0.0.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nikolareljin/protection-lab/releases/download/#{tag}/labbin-#{tag}-macos-arm64.tar.gz"
      sha256 "2292b1b3c396162044add800fb28d9d019f227b5561affe0d8e428ae2fa163f1"
    else
      url "https://github.com/nikolareljin/protection-lab/releases/download/#{tag}/labbin-#{tag}-macos-x86_64.tar.gz"
      sha256 "8bc371ca693b775c14927fa4c4fa07370f18b5a98c049ceecd9b57c9a92ddfeb"
    end
  end

  on_linux do
    # Releases ship an x86_64 Linux build only.
    depends_on arch: :x86_64

    if Hardware::CPU.intel?
      url "https://github.com/nikolareljin/protection-lab/releases/download/#{tag}/labbin-#{tag}-linux-x86_64.tar.gz"
      sha256 "c4fe09663e1bec05160868f7cbcb60b1db51ac634766bef3e6f56ee1db17aa93"
    end
  end

  def install
    bin.install "labbin"
  end

  test do
    assert_match "labbin", shell_output("#{bin}/labbin --help")
  end
end
