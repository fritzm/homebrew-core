class Pdp11AoutBinutils < Formula
  desc "FSF Binutils for PDP-11 cross development"
  homepage "https://www.gnu.org/software/binutils/"
  head "/Users/fritzm/code/fritzm/binutils-gdb", :using => :git, :branch => "lda-2_33_1"

  def install
    system "./configure", "--target=pdp11-aout",
                          "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--disable-gdb",
                          "--disable-multilib",
                          "--disable-nls",
                          "--disable-werror",
                          "--prefix=#{prefix}"
    system "make"
    system "make", "install"
  end

  test do
    assert_match "f()", shell_output("#{bin}/pdp11-aout-c++filt -n _Z1fv")
  end
end
