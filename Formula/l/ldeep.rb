class Ldeep < Formula
  include Language::Python::Virtualenv

  desc "LDAP enumeration utility"
  homepage "https://github.com/franc-pentest/ldeep"
  url "https://files.pythonhosted.org/packages/47/26/7de861659cc1a758f1cce229da915aaaf682ec96f7944edfa356f25809cb/ldeep-1.0.68.tar.gz"
  sha256 "1eda40bc4afb0a98a63b7c13eed72574fee116da73dbcd974ba1a1aaf64baeb5"
  license "MIT"
  head "https://github.com/franc-pentest/ldeep.git", branch: "master"

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "44c291245dd73376c5cde727c8236f98281774a4e4ff815a66a857a581101b0a"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "77b5b6f124d77605e3758d3ebc53038019ea135b3f6b82c49ff02031e137fc79"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "6a15563d6ccbe26c90f173ab8a35c517d807bc43ce0ea24a872e52123443bf21"
    sha256 cellar: :any_skip_relocation, sonoma:        "f39f3946d19db31fc3da91bd72ae8463310bf425c2d22eb48f5cc7abe330fce2"
    sha256 cellar: :any_skip_relocation, ventura:       "1a3e969b2430435f607ed272246fd6f6db5daecbf627fa45ba82b09cbba523dd"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "3f9c021fe5aa8c712b88fb77d4ccdb4e0f3358772433e796442d9510534d68e4"
  end

  depends_on "cryptography"
  depends_on "python@3.12"

  uses_from_macos "krb5"

  resource "asn1crypto" do
    url "https://files.pythonhosted.org/packages/de/cf/d547feed25b5244fcb9392e288ff9fdc3280b10260362fc45d37a798a6ee/asn1crypto-1.5.1.tar.gz"
    sha256 "13ae38502be632115abf8a24cbe5f4da52e3b5231990aff31123c805306ccb9c"
  end

  resource "commandparse" do
    url "https://files.pythonhosted.org/packages/79/6b/6f1879101e405e2a5c7d352b340bc97d1936f8d54a8934ae32aac1828e50/commandparse-1.1.2.tar.gz"
    sha256 "4bd7bdd01b52eaa32316d6149a00b4c3820a40ff2ad62476b46aaae65dbe9faa"
  end

  resource "decorator" do
    url "https://files.pythonhosted.org/packages/66/0c/8d907af351aa16b42caae42f9d6aa37b900c67308052d10fdce809f8d952/decorator-5.1.1.tar.gz"
    sha256 "637996211036b6385ef91435e4fae22989472f9d571faba8927ba8253acbc330"
  end

  resource "dnspython" do
    url "https://files.pythonhosted.org/packages/37/7d/c871f55054e403fdfd6b8f65fd6d1c4e147ed100d3e9f9ba1fe695403939/dnspython-2.6.1.tar.gz"
    sha256 "e8f0f9c23a7b7cb99ded64e6c3a6f3e701d78f50c55e002b839dea7225cff7cc"
  end

  resource "gssapi" do
    url "https://files.pythonhosted.org/packages/13/e7/dd88180cfcf243be62308707cc2f5dae4c726c68f30b9367931c794fda16/gssapi-1.8.3.tar.gz"
    sha256 "aa3c8d0b1526f52559552bb2c9d2d6be013d76a8e5db00b39a1db5727e93b0b0"
  end

  resource "ldap3-bleeding-edge" do
    url "https://files.pythonhosted.org/packages/b6/72/1f50f58d90ebc3900159db6b313f600b08460300543dab20f4087aa81eee/ldap3_bleeding_edge-2.10.1.1337.tar.gz"
    sha256 "8f887372ac0e38da25e98a98f4b773f58a618cf99a705a15caa5273075b56999"
  end

  resource "oscrypto" do
    url "https://files.pythonhosted.org/packages/06/81/a7654e654a4b30eda06ef9ad8c1b45d1534bfd10b5c045d0c0f6b16fecd2/oscrypto-1.3.0.tar.gz"
    sha256 "6f5fef59cb5b3708321db7cca56aed8ad7e662853351e7991fcf60ec606d47a4"
  end

  resource "pyasn1" do
    url "https://files.pythonhosted.org/packages/ba/e9/01f1a64245b89f039897cb0130016d79f77d52669aae6ee7b159a6c4c018/pyasn1-0.6.1.tar.gz"
    sha256 "6f580d2bdd84365380830acf45550f2511469f673cb4a5ae3857a3170128b034"
  end

  resource "pycryptodome" do
    url "https://files.pythonhosted.org/packages/b9/ed/19223a0a0186b8a91ebbdd2852865839237a21c74f1fbc4b8d5b62965239/pycryptodome-3.20.0.tar.gz"
    sha256 "09609209ed7de61c2b560cc5c8c4fbf892f8b15b1faf7e4cbffac97db1fffda7"
  end

  resource "pycryptodomex" do
    url "https://files.pythonhosted.org/packages/31/a4/b03a16637574312c1b54c55aedeed8a4cb7d101d44058d46a0e5706c63e1/pycryptodomex-3.20.0.tar.gz"
    sha256 "7a710b79baddd65b806402e14766c721aee8fb83381769c27920f26476276c1e"
  end

  resource "six" do
    url "https://files.pythonhosted.org/packages/71/39/171f1c67cd00715f190ba0b100d606d440a28c93c7714febeca8b79af85e/six-1.16.0.tar.gz"
    sha256 "1e61c37477a1626458e36f7b1d82aa5c9b094fa4802892072e49de9c60c4c926"
  end

  resource "termcolor" do
    url "https://files.pythonhosted.org/packages/10/56/d7d66a84f96d804155f6ff2873d065368b25a07222a6fd51c4f24ef6d764/termcolor-2.4.0.tar.gz"
    sha256 "aab9e56047c8ac41ed798fa36d892a37aca6b3e9159f3e0c24bc64a9b3ac7b7a"
  end

  resource "tqdm" do
    url "https://files.pythonhosted.org/packages/58/83/6ba9844a41128c62e810fddddd72473201f3eacde02046066142a2d96cc5/tqdm-4.66.5.tar.gz"
    sha256 "e1020aef2e5096702d8a025ac7d16b1577279c9d63f8375b63083e9a5f0fcbad"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    output = shell_output("#{bin}/ldeep ldap -d brew.ad -s ldap://127.0.0.1:389 enum_users test 2>&1", 1)
    assert_match "[!] Unable to open connection with ldap://127.0.0.1:389", output
  end
end
