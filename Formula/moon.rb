class Moon < Formula
  desc "Repository management, organization, orchestration, and notification tool"
  homepage "https://moonrepo.dev"
  url "https://github.com/moonrepo/moon/archive/refs/tags/@moonrepo/cli@0.22.0.tar.gz"
  sha256 "c4eeee0374f20976a2a99cd35ce223f64c418341a39767a4d7889ee4ae1c6141"
  license "MIT"

  bottle do
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_ventura: "2ed63b867804a4d999b7ea784d2b54caa8245bcb92c529625759830c3a228220"
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
