class Moon < Formula
  desc "Repository management, organization, orchestration, and notification tool"
  homepage "https://moonrepo.dev"
  url "https://github.com/moonrepo/moon/archive/refs/tags/@moonrepo/cli@0.26.0.tar.gz"
  sha256 "d6fed87b93a74fcc23a95a37598f5074214c506ac2df56e4b83a7070c39a2061"
  license "MIT"

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
