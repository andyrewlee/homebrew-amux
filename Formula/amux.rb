class Amux < Formula
  desc "TUI for running parallel coding agents"
  homepage "https://github.com/andyrewlee/amux"
  url "https://github.com/andyrewlee/amux/archive/refs/tags/v0.0.19.tar.gz"
  sha256 "7cdc5f0ec1a9d47e3c3dc5bbe6fec95f766f7cd4ea619bc013acd00f073fe6b6"
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
