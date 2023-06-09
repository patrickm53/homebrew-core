require "language/node"
require "json"

class Babel < Formula
  desc "Compiler for writing next generation JavaScript"
  homepage "https://babeljs.io/"
  url "https://registry.npmjs.org/@babel/core/-/core-7.22.5.tgz"
  sha256 "bf8de8da24f7028e58de3dc54ae36fb40cf3db517a561b50c2c6ec8ca8c896e5"
  license "MIT"

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_ventura:  "ed7a70402e27528e058b2829d601ad57059f715585e0d79c332bd76978c4ad9e"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "ed7a70402e27528e058b2829d601ad57059f715585e0d79c332bd76978c4ad9e"
    sha256 cellar: :any_skip_relocation, arm64_big_sur:  "ed7a70402e27528e058b2829d601ad57059f715585e0d79c332bd76978c4ad9e"
    sha256 cellar: :any_skip_relocation, ventura:        "ed7a70402e27528e058b2829d601ad57059f715585e0d79c332bd76978c4ad9e"
    sha256 cellar: :any_skip_relocation, monterey:       "ed7a70402e27528e058b2829d601ad57059f715585e0d79c332bd76978c4ad9e"
    sha256 cellar: :any_skip_relocation, big_sur:        "ed7a70402e27528e058b2829d601ad57059f715585e0d79c332bd76978c4ad9e"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "e96a5c764c79304d58b74cd596c8098336886e67db7cb488c5d9446561d9d5f3"
  end

  depends_on "node"

  resource "babel-cli" do
    url "https://registry.npmjs.org/@babel/cli/-/cli-7.22.5.tgz"
    sha256 "fd544704d09ae2845b595bbddb6f2eb4bb049de17062e4a3b2719204680057d7"
  end

  def install
    (buildpath/"node_modules/@babel/core").install Dir["*"]
    buildpath.install resource("babel-cli")

    cd buildpath/"node_modules/@babel/core" do
      system "npm", "install", *Language::Node.local_npm_install_args, "--production"
    end

    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    (testpath/"script.js").write <<~EOS
      [1,2,3].map(n => n + 1);
    EOS

    system bin/"babel", "script.js", "--out-file", "script-compiled.js"
    assert_predicate testpath/"script-compiled.js", :exist?, "script-compiled.js was not generated"
  end
end
