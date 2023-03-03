class Moon < Formula
  desc "Repository management, organization, orchestration, and notification tool"
  homepage "https://moonrepo.dev"
  url "https://github.com/moonrepo/moon/archive/refs/tags/@moonrepo/cli@0.25.2.tar.gz"
  sha256 "0615afc8738bab4df6169431e3091e294464f83842fe5ba6e761e529f26758aa"
  license "MIT"

  bottle do
    root_url "https://github.com/moonrepo/homebrew-tap/releases/download/moon-0.25.2"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "6a51bdda5e0faa87a8e7d097703451394b1db3edf10664e4c8ae7c599ef95832"
    sha256 cellar: :any_skip_relocation, monterey:      "b423b52d09fe23c04583d57849fe2721767f53a221cf1585d4b510e71fecb860"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "e893d68d381d048d9ab9431450818360bfc78e79454e26c15e838e4432eef9d6"
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
