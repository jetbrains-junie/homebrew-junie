class JunieAT2432221 < Formula
  desc "Junie CLI"
  homepage "https://www.jetbrains.com/junie"
  url "https://github.com/jetbrains-junie/junie/releases/download/222.1/junie-cloud-eap-243.222.1-macos-aarch64.zip"
  sha256 "dcaa65a3a7b59f1c0f2bb11d93949c918ef150a453f82b8cb6827aa8dee9e9da"
  version "243.222.1"
  license "https://www.jetbrains.com/legal/docs/terms/jetbrains-junie"
  def install
    libexec.install "junie.app"
    (bin/"junie").write <<~EOS
      #!/bin/bash
      EJ_RUNNER_PWD=/mnt/agent/work/junie
      export EJ_RUNNER_PWD
      cd "#{libexec}/junie.app/Contents/MacOS"
      exec ./junie "$@"
    EOS
    chmod 0755, bin/"junie"
  end
  test do
    system "#{bin}/junie", "--version"
  end
end
