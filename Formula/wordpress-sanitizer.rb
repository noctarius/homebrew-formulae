class WordpressSanitizer < Formula
  desc "Sanitizes HTML based on rules sets written in JavaScript"
  homepage "https://github.com/noctarius/wordpress-sanitizer"
  url "https://github.com/noctarius/wordpress-sanitizer.git", :tag => "0.9.5"
  sha256 "3fc18dd51d94390b035c602b92d3877f056fd11842f68172ae6a928f6480d68e"

  depends_on "go" => :build

  def install
    path = buildpath/"src/wordpress-sanitizer"
    path.install buildpath.children

    ENV["GOPATH"] = buildpath

    cd path do
      system "go", "build", "-o", "wordpress-sanitizer"
      bin.install "wordpress-sanitizer"
    end
  end

  test do
    system "#{bin}/wordpress-sanitizer"
  end
end
