class Moon < Formula
  desc "Repository management, organization, orchestration, and notification tool"
  homepage "https://moonrepo.dev"
  url "https://github.com/moonrepo/moon/archive/refs/tags/@moonrepo/cli@0.25.1.tar.gz"
  sha256 "4d92a4052dbfa8653a82b9ec0f4e3cde79164a296cf0c08fcb8c311f442f4906"
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
