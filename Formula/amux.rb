class Amux < Formula
  desc "TUI for running parallel coding agents"
  homepage "https://github.com/andyrewlee/amux"
  url "https://github.com/andyrewlee/amux/archive/refs/tags/v0.0.16.tar.gz"
  sha256 "41bce8e065bab2bc4bcef6d2f5f49b9ae96ff9fc5680a4e085e37b6c0436643b"
  license "MIT"

  depends_on "go" => :build
  depends_on "tmux"

  def install
    ldflags = %W[
      -s -w
      -X main.version=#{version}
      -X github.com/andyrewlee/amux/internal/update.homebrewBuild=true
    ]
    system "go", "build", *std_go_args(ldflags: ldflags), "./cmd/amux"
  end

  test do
    output = shell_output("#{bin}/amux --version")
    assert_match version.to_s, output
  end
end
