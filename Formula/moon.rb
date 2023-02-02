class Moon < Formula
  desc "Repository management, organization, orchestration, and notification tool"
  homepage "https://moonrepo.dev"
  url "https://github.com/moonrepo/moon/archive/refs/tags/@moonrepo/cli@0.23.2.tar.gz"
  sha256 "4121721d58489815d9ea7e7e92a60724917b413cddd87bc99cf4494a22b25081"
  license "MIT"

  bottle do
    root_url "https://github.com/moonrepo/homebrew-moon/releases/download/moon-0.23.2"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "c22b071fc880121fe057d40bd4bd0125f542a4ad5a023af03bb8cac74cb02e55"
    sha256 cellar: :any_skip_relocation, monterey:      "98a24aa78a096cbe3a67396e2addfe1bb7943ec7e6c93a069d4dc2e37cc60514"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "33e9c90d80f79f0effdd05ed9273195bb9fbd8962768b9fdf73a9e66800a8549"
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
