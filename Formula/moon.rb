class Moon < Formula
  desc ""
  homepage ""
  url "https://github.com/moonrepo/moon/archive/refs/tags/@moonrepo/cli@0.22.0.tar.gz"
  sha256 "c4eeee0374f20976a2a99cd35ce223f64c418341a39767a4d7889ee4ae1c6141"
  license ""

  depends_on "rust" => :build

  def install
    chdir "crates/cli" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test moon`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
