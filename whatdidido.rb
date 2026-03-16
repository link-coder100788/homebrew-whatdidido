# typed: false
# frozen_string_literal: true

class Whatdidido < Formula
  desc "A pretty wrapper for your shell history"
  homepage "https://link-coder100788.github.io/WhatDidIDo/"
  url "https://github.com/link-coder100788/WhatDidIDo/archive/refs/tags/v1.3.5.tar.gz"
  sha256 "6e3e4eca5711f04fea55c59e2b020187f6dc0cc3ed5a8a2b87e14e7f375adb40"
  license "MIT"
  head "https://github.com/link-coder100788/WhatDidIDo.git", branch: "main"

  depends_on :macos => :build
  
  on_macos do
	  depends_on xcode: ["14.0", :build]
  end
  
  on_linux do
	  depends_on "swift-lang" => :build
  end

  def install
	  on_macos do
		  system "xcrun", "swift", "build", "--disable-sandbox", "-c", "release"
	  end
	  
	  on_linux do
		  system "swift", "build", "--disable-sandbox", "-c", "release"
	  end
	  
	  bin.install ".build/release/whatdidido"
	end

  test do
    # Verify the binary runs and reports the correct version
    assert_match version.to_s, shell_output("#{bin}/whatdidido version")
    # Verify the debug command works (auto-detects shell/OS without a history file)
    assert_match "shell:", shell_output("#{bin}/whatdidido debug 2>&1")
  end
end
