class Dtn7 < Formula
  desc "Delay-tolerant networking software suite, Bundle Protocol Version 7"
  homepage "https://dtn7.github.io"
  url "https://github.com/dtn7/dtn7-go/archive/v0.4.0.tar.gz"
  sha256 "77b9c01ad1678d71f54fee05aed5cab9193d10a7b98779abef4eecbca407c99b"

  depends_on "go" => :build

  def install
    system "go", "build", "-o", "#{bin}/#{name}d", "./cmd/dtnd/"
    system "go", "build", "-o", "#{bin}/#{name}cat", "./cmd/dtncat"
  end

  test do
    # dtn7d runs as daemon, thus only the correct installation of the binary can be tested
    system "which", "dtn7d"
    
    # dtn7cat required a running dtn7d, thus use help as a simple test
    system "dtn7cat", "help"
  end
end
