class  < Formula
  desc "Junie CLI"
  homepage "https://www.jetbrains.com/junie"
  url "https://github.com/jetbrains-junie/artifacts/releases/download/34.1/junie-cloud-eap-251.34.1-macos-aarch64.zip"
  sha256 "11efe0b3c1e4ba423200cae7e3221713242c7bad1687c11338dd08db4cc74bd6"
  version "251.34.1"
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
