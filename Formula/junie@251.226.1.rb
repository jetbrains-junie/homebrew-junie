class JunieAT2512261 < Formula
  desc "Junie CLI"
  homepage "https://www.jetbrains.com/junie"
  url "https://github.com/jetbrains-junie/junie/releases/download/226.1/junie-cloud-eap-251.226.1-macos-aarch64.zip"
  sha256 "b4f64fa38240dafa8c0d1f08d5d6f5d81e7f2fd46c5919ec325e004b5af6c6bd"
  version "251.226.1"
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
