class Amux < Formula
  desc "TUI for running parallel coding agents"
  homepage "https://github.com/andyrewlee/amux"
  url "https://github.com/andyrewlee/amux/archive/refs/tags/v0.0.13.tar.gz"
  sha256 "9e546f050ba4cda0325036cb4103beffc1a461294c333bcee96b6afeeed8db58"
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
