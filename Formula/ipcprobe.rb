# Placeholder head-only formula. GoReleaser replaces this file with a versioned, checksummed formula on the first
# tagged release of ipcprobe (v0.1.0). Until then:  brew install --HEAD AlexandruIspas659/tap/ipcprobe
class Ipcprobe < Formula
  desc "Discover and reconfigure TVT/OEM (e.g. DVC) IP cameras on a LAN — a cross-platform IPTool replacement"
  homepage "https://github.com/AlexandruIspas659/ipcprobe"
  license "MIT"
  head "https://github.com/AlexandruIspas659/ipcprobe.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", "-trimpath", "-ldflags", "-s -w -X main.version=head", "-o", bin/"ipcprobe", "./cmd/ipcprobe"
  end

  test do
    assert_match "ipcprobe", shell_output("#{bin}/ipcprobe --version")
  end
end
