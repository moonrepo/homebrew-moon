class Moon < Formula
  desc "Repository management, organization, orchestration, and notification tool"
  homepage "https://moonrepo.dev"
  url "https://github.com/moonrepo/moon/archive/refs/tags/@moonrepo/cli@0.26.0.tar.gz"
  sha256 "d6fed87b93a74fcc23a95a37598f5074214c506ac2df56e4b83a7070c39a2061"
  license "MIT"

  bottle do
    root_url "https://github.com/moonrepo/homebrew-tap/releases/download/moon-0.26.0"
    sha256 cellar: :any_skip_relocation, monterey:     "93448cec5f1be9257eb08014652495ac6de7baa59bc64a8ccc9ec849de995dcf"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "e522fb09388b97687023990963032a7dc44a5a52ea26668bc7f677ca9cd74997"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "be48913f53babf06f4e272274d830d4f5d6214a665a90dc30fddef0aa789531a"
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
