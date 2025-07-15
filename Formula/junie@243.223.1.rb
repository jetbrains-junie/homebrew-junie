class JunieAT2432231 < Formula
  desc "Junie CLI"
  homepage "https://www.jetbrains.com/junie"
  url "https://github.com/jetbrains-junie/junie/releases/download/223.1/junie-cloud-eap-243.223.1-macos-aarch64.zip"
  sha256 "5e4c3db7a3b3b327df5c23976ce5fb7a46046bdd4bd8fedfb15222e6d1b0594f"
  version "243.223.1"
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
