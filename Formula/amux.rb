class Amux < Formula
  desc "TUI for running parallel coding agents"
  homepage "https://github.com/andyrewlee/amux"
  url "https://github.com/andyrewlee/amux/archive/refs/tags/v0.0.11.tar.gz"
  sha256 "e58ee8783829f9441bdf3de3cd2e048e87aa02e3b75374c397fea97e76bb5424"
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
