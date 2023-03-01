class Moon < Formula
  desc "Repository management, organization, orchestration, and notification tool"
  homepage "https://moonrepo.dev"
  url "https://github.com/moonrepo/moon/archive/refs/tags/@moonrepo/cli@0.25.0.tar.gz"
  sha256 "1f962356646f81ac4d18752eaef639f80d875e3d851a06636c2e74f73db888e8"
  license "MIT"

  bottle do
    root_url "https://github.com/moonrepo/homebrew-tap/releases/download/moon-0.25.0"
    sha256 cellar: :any_skip_relocation, monterey:     "eeb25fb107618093d68212328194149e1d807e0297b765e02b2f81ccc4cf2e8f"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "83f1d82d0a46e6ff1b4d7586c672b98f72edd710230e066cb50739355340949f"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "cb665eafd5dc627c7c915c8e67f589fad8f3f1810a40419b47759454fe17b740"
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
