class Moon < Formula
  desc "Repository management, organization, orchestration, and notification tool"
  homepage "https://moonrepo.dev"
  url "https://github.com/moonrepo/moon/archive/refs/tags/@moonrepo/cli@0.24.0.tar.gz"
  sha256 "5d42b629df5a8e415c8240987846d11a01f7920f3194b563024b85bb7a3e96ef"
  license "MIT"

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_ventura: "05a77a21f2ec01b29a2fe11887290907bc93d60119448c01c99755971388be55"
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
