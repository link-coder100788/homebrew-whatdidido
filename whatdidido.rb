# typed: false
# frozen_string_literal: true

class Whatdidido < Formula
  desc "A pretty wrapper for your shell history"
  homepage "https://github.com/link-coder100788/WhatDidIDo"
  url "https://github.com/link-coder100788/WhatDidIDo/archive/refs/tags/v1.3.2.tar.gz"
  sha256 "d5558cd419c8d46bdc958064cb97f963d1ea793866414c025906ec15033512ed"
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
