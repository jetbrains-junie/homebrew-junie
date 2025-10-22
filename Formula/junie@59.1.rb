class JunieAT4591 < Formula
  desc "Junie CLI"
  homepage "https://www.jetbrains.com/junie"
  url "https://github.com/jetbrains-junie/junie/releases/download/459.1/junie-eap-459.1-macos-aarch64.zip"
  sha256 "4dfc5f1421f9a6d4de6068ab87efa70746fc87ab3cbf6dd8b629d0610e24cf65"
  version "459.1"
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
