class Junie < Formula
  desc "Junie CLI"
  homepage "https://www.jetbrains.com/junie"
  url "https://github.com/jetbrains-junie/artifacts/releases/download/34.1/junie-cloud-eap-243.34.1-macos-aarch64.zip"
  sha256 "136822ebc0316f526b897249cbded66ee29671f8c0b07be995ff762a3e68fc42"
  version "243.34.1"
  license "Proprietary" # Or whatever applies
  def install
    libexec.install "junie.app"
    (bin/"junie").write <<~EOS
      #!/bin/bash
      cd "#{libexec}/junie.app/Contents/MacOS"
      exec ./junie ""
    EOS
    chmod 0755, bin/"junie"
  end
  test do
    system "#{bin}/junie", "--version"
  end
end
