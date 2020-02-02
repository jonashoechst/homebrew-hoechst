class Dtn7 < Formula
  desc "Delay-tolerant networking software suite, Bundle Protocol Version 7"
  homepage "https://dtn7.github.io"
  url "https://github.com/dtn7/dtn7-go.git",
      :tag      => "v0.5.4",
      :revision => "69294c6eb269de128095099d74e34c3c8e6102c9"
  head "https://github.com/dtn7/dtn7-go.git"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath

    src = buildpath/"src/github.com/dtn7/dtn7-go"
    src.install buildpath.children
    src.cd do
      system "go", "build", "-o", "#{name}d", "./cmd/dtnd/"
      system "go", "build", "-o", "#{name}cat", "./cmd/dtncat/"
      bin.install "#{name}d"
      bin.install "#{name}cat"

      (src/"#{name}d.toml").write <<~EOS
        [core]
        store = "#{etc}/#{name}/store"
        inspect-all-bundles = true
        node-id = "dtn://#{Socket.gethostname}/"

        [logging]
        level = "info"
        report-caller = false
        format = "text"

        [discovery]
        ipv4 = true
        ipv6 = true
        interval = 30

        [simple-rest]
        node = "dtn://#{Socket.gethostname}/"
        listen = "127.0.0.1:8080"

        [[listen]]
        protocol = "tcpcl"
        endpoint = ":4556"

        [routing]
        algorithm = "epidemic"
      EOS

      etc.install "#{name}d.toml"
    end
  end

  plist_options :manual => "dtn7d"

  def plist; <<~EOS
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
      <dict>
        <key>Label</key>
        <string>#{plist_name}</string>
        <key>ProgramArguments</key>
        <array>
          <string>#{opt_bin}/#{name}d</string>
          <string>/usr/local/etc/#{name}d.toml</string>
        </array>
        <key>KeepAlive</key>
        <dict>
          <key>Crashed</key>
          <true />
          <key>SuccessfulExit</key>
          <false />
        </dict>
        <key>ProcessType</key>
        <string>Background</string>
        <key>StandardErrorPath</key>
        <string>#{var}/log/#{name}d.log</string>
        <key>StandardOutPath</key>
        <string>#{var}/log/#{name}d.log</string>
      </dict>
    </plist>
  EOS
  end

  test do
    # dtn7d runs as daemon, thus only the correct installation of the binary can be tested
    system "which", "#{name}d"

    # dtn7cat required a running dtn7d, thus use help as a simple test
    system "#{name}cat", "help"
  end
end
