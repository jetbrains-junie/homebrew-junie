class Junie < Formula
  desc "Junie CLI"
  homepage "https://github.com/jetbrains-junie/artifacts"
  url "https://github.com/jetbrains-junie/artifacts/releases/download/215.1/junie-cloud-eap-251.215.1-macos-aarch64.zip"
  sha256 "c60935697215bcbc25996186b03a8ccac8f6934fa29c65ce021b7d819788fc32"
  version "251.215.1"
  license "Proprietary" # Or whatever applies

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
