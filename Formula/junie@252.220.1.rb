class JunieAT2522201 < Formula
  desc "Junie CLI"
  homepage "https://www.jetbrains.com/junie"
  url "https://github.com/jetbrains-junie/artifacts/releases/download/220.1/junie-cloud-eap-252.220.1-macos-aarch64.zip"
  sha256 "e67c6ae87e784a3d2bb830beef2348f4a15ebd95f125ac22a8e5275956f6ce9a"
  version "252.220.1"
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
