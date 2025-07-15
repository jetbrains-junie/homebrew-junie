class JunieAT2522231 < Formula
  desc "Junie CLI"
  homepage "https://www.jetbrains.com/junie"
  url "https://github.com/jetbrains-junie/junie/releases/download/223.1/junie-cloud-eap-252.223.1-macos-aarch64.zip"
  sha256 "28be213647ac93cadce72b68a41aa7d3d03c10653a2818ea796beb6ca10eba21"
  version "252.223.1"
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
