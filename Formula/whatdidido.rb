# typed: false
# frozen_string_literal: true

class Whatdidido < Formula
  desc "A pretty wrapper for your shell history"
  homepage "https://link-coder100788.github.io/WhatDidIDo/"
  url "https://github.com/link-coder100788/WhatDidIDo/archive/refs/tags/v1.3.9.tar.gz"
  sha256 "4c9872bb59922e5bf4f0d8adc45b20b3ca9c0bfb196b5f9ec9a25bb8189b2e0f"
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
