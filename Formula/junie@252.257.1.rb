class JunieAT2522571 < Formula
  desc "Junie CLI"
  homepage "https://www.jetbrains.com/junie"
  url "https://github.com/jetbrains-junie/junie/releases/download/257.1/junie-cloud-eap-252.257.1-macos-aarch64.zip"
  sha256 "08563375e40f5f6cfc3e0f28d007c59596d8608fc2d58218c76b0ea05b56bf3a"
  version "252.257.1"
  license "https://www.jetbrains.com/legal/docs/terms/jetbrains-junie"
  def install
    libexec.install "junie.app"
    (bin/"junie").write <<~EOS
      #!/bin/bash
      EJ_RUNNER_PWD=$(pwd)
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
