class Uv < Formula
  desc "Extremely fast Python package installer and resolver, written in Rust"
  homepage "https://github.com/astral-sh/uv"
  url "https://github.com/astral-sh/uv/archive/refs/tags/0.2.29.tar.gz"
  sha256 "b469b8e08ec736a2a91d12c9f49209ed7a73def7b937fc95a51e1fc66a5e6d1a"
  license any_of: ["Apache-2.0", "MIT"]
  head "https://github.com/astral-sh/uv.git", branch: "main"

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_sonoma:   "15d511137c37c144f0fb724354104579d8c76b91a29e154155277da5842c184a"
    sha256 cellar: :any_skip_relocation, arm64_ventura:  "526a141f65f1df126daf5639431158eca9cb68ade724b0cdb7b779c2cbacc604"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "981bfc95345e19d1f121caac6818c7a34f8bf337fba36e4cdc815ad108363258"
    sha256 cellar: :any_skip_relocation, sonoma:         "327c643beca63abf4101fc3fe45070dc0a6ef00ce61b18930fb8912ed8308074"
    sha256 cellar: :any_skip_relocation, ventura:        "885e34d88c509740e9dfcba0f9beafa664b2a899667fda365131140629eb42c5"
    sha256 cellar: :any_skip_relocation, monterey:       "b416d9f06d22c94a7646694bc80c3d325e782274971ed853310d10362b713e91"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "2b15454912e72003353b647227016cfb8a9519420338b2045d09dbc505571db3"
  end

  depends_on "pkg-config" => :build
  depends_on "rust" => :build

  uses_from_macos "python" => :test

  on_linux do
    # On macOS, bzip2-sys will use the bundled lib as it cannot find the system or brew lib.
    # We only ship bzip2.pc on Linux which bzip2-sys needs to find library.
    depends_on "bzip2"
  end

  def install
    ENV["UV_COMMIT_HASH"] = ENV["UV_COMMIT_SHORT_HASH"] = tap.user
    ENV["UV_COMMIT_DATE"] = time.strftime("%F")
    system "cargo", "install", "--no-default-features", *std_cargo_args(path: "crates/uv")
    generate_completions_from_executable(bin/"uv", "generate-shell-completion")
  end

  test do
    (testpath/"requirements.in").write <<~EOS
      requests
    EOS

    compiled = shell_output("#{bin}/uv pip compile -q requirements.in")
    assert_match "This file was autogenerated by uv", compiled
    assert_match "# via requests", compiled

    assert_match "ruff 0.5.1", shell_output("#{bin}/uvx -q ruff@0.5.1 --version")
  end
end
