class JunieAT2512201 < Formula
  desc "Junie CLI"
  homepage "https://www.jetbrains.com/junie"
  url "https://github.com/jetbrains-junie/artifacts/releases/download/220.1/junie-cloud-eap-251.220.1-macos-aarch64.zip"
  sha256 "1807d9987edcc077f17847efb7f5c0bc8a7ebb0f223dbb9cfba161c76bde78a7"
  version "251.220.1"
  license "https://www.jetbrains.com/legal/docs/terms/jetbrains-junie"
  def install
    libexec.install "junie.app"
    (bin/"junie").write <<~EOS
      #!/bin/bash
      cd "#{libexec}/junie.app/Contents/MacOS"
      exec ./junie "$@"
    EOS
    chmod 0755, bin/"junie"
  end
  test do
    system "#{bin}/junie", "--version"
  end
end
