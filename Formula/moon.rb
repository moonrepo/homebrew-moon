class Moon < Formula
  desc "Repository management, organization, orchestration, and notification tool"
  homepage "https://moonrepo.dev"
  url "https://github.com/moonrepo/moon/archive/refs/tags/@moonrepo/cli@0.25.1.tar.gz"
  sha256 "4d92a4052dbfa8653a82b9ec0f4e3cde79164a296cf0c08fcb8c311f442f4906"
  license "MIT"

  bottle do
    root_url "https://github.com/moonrepo/homebrew-tap/releases/download/moon-0.25.1"
    sha256 cellar: :any_skip_relocation, monterey:     "66da23ac5ce2c1254938f0b49f4c9982e5d293d4a5c5e4856b5da42357fcf70a"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "78aa6aecdef921290681baca0c33e23c2dbef808f12553387263530fccf36654"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "dca04b422d8301fbb05538860ea5abdfc3e241cccd0df1464766ccddeff5cdf7"
  end

  depends_on "rust" => :build

  def install
    chdir "crates/cli" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    system "#{bin}/moon", "-V"
  end
end
