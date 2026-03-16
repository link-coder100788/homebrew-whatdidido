# typed: false
# frozen_string_literal: true

class Whatdidido < Formula
  desc "A pretty wrapper for your shell history"
  homepage "https://link-coder100788.github.io/WhatDidIDo/"
  url "https://github.com/link-coder100788/WhatDidIDo/archive/refs/tags/v1.3.8.tar.gz"
  sha256 "45e631307e4f0c2e6d6cba3302528ddff55068464cb3e9bdd648eb46dd251ffb"
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
