class Moon < Formula
  desc "Repository management, organization, orchestration, and notification tool"
  homepage "https://moonrepo.dev"
  url "https://github.com/moonrepo/moon/archive/refs/tags/@moonrepo/cli@0.22.0.tar.gz"
  sha256 "c4eeee0374f20976a2a99cd35ce223f64c418341a39767a4d7889ee4ae1c6141"
  license "MIT"

  bottle do
    root_url "https://github.com/moonrepo/homebrew-moon/releases/download/moon-0.22.0"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_ventura: "fcbf3db03207c9abe53b087894a1a3c205e08e8fab9b713bdda0be87746bf1e8"
    sha256 cellar: :any_skip_relocation, monterey:      "7543eef00f74e439f84ea3b3f061b5ff7c267983053b7d79fa566b225e9de50e"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "e782dccc94b2c4ecc67aaa16a92df67053b0107478d39cf883d992fbafc1fa5d"
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
