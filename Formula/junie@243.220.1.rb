class JunieAT2432201 < Formula
  desc "Junie CLI"
  homepage "https://www.jetbrains.com/junie"
  url "https://github.com/jetbrains-junie/artifacts/releases/download/220.1/junie-cloud-eap-243.220.1-macos-aarch64.zip"
  sha256 "9b049e6bd2f5d5eae59130ac41c0899bcdf62f9f1ada298454b006f58d6ce61d"
  version "243.220.1"
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
