class  < Formula
  desc "Junie CLI"
  homepage "https://www.jetbrains.com/junie"
  url "https://github.com/jetbrains-junie/artifacts/releases/download/34.1/junie-cloud-eap-252.34.1-macos-aarch64.zip"
  sha256 "7e1f22b5db3a04b40d77efccbf4e8d89c8cbbe41e38955a5e1e1d9df623aa963"
  version "252.34.1"
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
