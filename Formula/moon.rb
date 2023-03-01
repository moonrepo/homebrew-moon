class Moon < Formula
  desc "Repository management, organization, orchestration, and notification tool"
  homepage "https://moonrepo.dev"
  url "https://github.com/moonrepo/moon/archive/refs/tags/@moonrepo/cli@0.25.0.tar.gz"
  sha256 "1f962356646f81ac4d18752eaef639f80d875e3d851a06636c2e74f73db888e8"
  license "MIT"

  bottle do
    root_url "https://github.com/moonrepo/homebrew-tap/releases/download/moon-0.24.0"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "05a77a21f2ec01b29a2fe11887290907bc93d60119448c01c99755971388be55"
    sha256 cellar: :any_skip_relocation, monterey:      "998e7a0f84910955402c6678e1c7f99d36aa70fb37af29338909f705851fd949"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "0b5f68023a46041df21f6c20aabf48c90a7fdb34320133da382a8d229f73c67b"
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
