{ stdenv, fetchurl, perl
, autoconf, libtool, pkg-config, m4, automake, libevent, libnl
# Pass PATH/LD_LIBRARY_PATH to point to current mpirun by default
#, enablePrefix ? false
}:

stdenv.mkDerivation {
  pname = "libverbs";
  version = "0.1";

  src = fetchurl {
    url = "https://github.com/gpudirect/libibverbs/archive/master.tar.gz";
    sha256 = "1nydy6imrr5yhymshxk62627d4kbir9hcm9fmkmcjcpcl8p71rs6";
  };
  buildInputs = [autoconf libtool pkg-config m4 automake libevent perl libnl];
  nativeBuildInputs = [autoconf libtool pkg-config m4 automake libevent perl libnl];
  preConfigure = ''
    sed -i 's/\/bin\/sh .*/\/bin\/sh/' autogen.sh
    ./autogen.sh
  '';

  #buildOutputs = ["include" "lib" "man"];

  meta = with stdenv.lib; {
    homepage = "TODO";
    description = "TODO";
    longDescription = "TODO";
    maintainers = with maintainers; [ guserav ];
    license = licenses.bsd3;
    platforms = platforms.unix;
  };
}
