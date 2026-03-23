# typed: false
# frozen_string_literal: true

class Whatdidido < Formula
  desc "A pretty wrapper for your shell history"
  homepage "https://link-coder100788.github.io/WhatDidIDo/"
  url "https://github.com/link-coder100788/WhatDidIDo/archive/refs/tags/v1.6.0.tar.gz"
  sha256 "6ad48fd9f248f4ec64344a930a5d7c8b5765008ea34e77162dee13a21c0cd444"
  license "MIT"
  head "https://github.com/link-coder100788/WhatDidIDo.git", branch: "main"
  
  on_linux do
	  depends_on "swift" => :build
  end

  def install
	  on_macos do
		  system "swift", "build", "--disable-sandbox", "-c", "release"
		  bin.install ".build/release/whatdidido" # As of v1.3.7 this is executable name
	  end
	  
	  on_linux do
		  system "#{Formula["swift"].opt_bin}/swift", "build", "--disable-sandbox", "-c", "release"
		  bin.install ".build/release/whatdidido" # As of v1.3.7 this is executable name
	  end
	end

  test do
    # Verify the binary runs and reports the correct version
    assert_match version.to_s, shell_output("#{bin}/whatdidido version")
    # Verify the debug command works (auto-detects shell/OS without a history file)
    assert_match "shell:", shell_output("#{bin}/whatdidido debug 2>&1")
  end
end
