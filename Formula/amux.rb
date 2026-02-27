class Amux < Formula
  desc "TUI for running parallel coding agents"
  homepage "https://github.com/andyrewlee/amux"
  url "https://github.com/andyrewlee/amux/archive/refs/tags/v0.0.15.tar.gz"
  sha256 "305265e84930bc2308eab4d40c0fb1a376b4ddd0bc86e05ce89879a7380e41a7"
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
