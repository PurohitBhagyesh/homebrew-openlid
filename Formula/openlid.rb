class Openlid < Formula
  desc "Keep your laptop running with the lid closed"
  homepage "https://openlid.devs.li/"
  url "https://github.com/PurohitBhagyesh/openlid/archive/refs/tags/v2.0.tar.gz"
  sha256 "4f0289dba857ccd4444387b7045317a782aa3593aa067532d448428ae38efe23"
  license "MIT"
  head "https://github.com/PurohitBhagyesh/openlid.git", branch: "main"

  depends_on xcode: ["15.0", :build]
  depends_on macos: :ventura

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/OpenLidCLI" => "openlid"
  end

  test do
    assert_match "OpenLid CLI", shell_output("#{bin}/openlid --help")
  end
end
