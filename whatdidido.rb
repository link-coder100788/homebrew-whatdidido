# typed: false
# frozen_string_literal: true

class Whatdidido < Formula
  desc "A pretty wrapper for your shell history"
  homepage "https://github.com/link-coder100788/WhatDidIDo"
  url "https://github.com/link-coder100788/WhatDidIDo/archive/refs/tags/v1.3.4.tar.gz"
  sha256 "4d7d41e2f760c04dbca1bf38eb866e25c5e8f00b135b5679461f9ff16c36f898"
  license "MIT"
  head "https://github.com/link-coder100788/WhatDidIDo.git", branch: "main"

  depends_on :macos

  def install
    system "xcrun", "swift", "build", "--disable-sandbox", "-c", "release"
    bin.install ".build/release/whatdidido"
  end

  test do
    # Verify the binary runs and reports the correct version
    assert_match version.to_s, shell_output("#{bin}/whatdidido version")
    # Verify the debug command works (auto-detects shell/OS without a history file)
    assert_match "shell:", shell_output("#{bin}/whatdidido debug 2>&1")
  end
end
