{pkgs, ...}:
pkgs.stdenv.mkDerivation rec {
  pname = "archi";
  version = "5.9.0";

  src = pkgs.fetchurl {
    url = "https://www.archimatetool.com/downloads/archi/${version}/Archi-Linux64-${version}.tgz";
    hash = "sha256-0/3/EZw5upB0dvyhS0sfKqp7C4tc6vGDW+O9WU5iTc8=";
  };

  nativeBuildInputs = [
    pkgs.autoPatchelfHook
    pkgs.makeWrapper
    pkgs.wrapGAppsHook3
    pkgs.copyDesktopItems
  ];

  buildInputs = [
    pkgs.libsecret
  ];

  dontUnpack = false;

  installPhase = ''
    runHook preInstall

    mkdir -p $out/bin $out/libexec
    for f in configuration features p2 plugins Archi.ini; do
      cp -r $f $out/libexec
    done
    install -D -m755 Archi $out/libexec/Archi

    makeWrapper $out/libexec/Archi $out/bin/Archi \
      --prefix LD_LIBRARY_PATH : ${pkgs.lib.makeLibraryPath [pkgs.glib pkgs.webkitgtk_4_1]} \
      --set WEBKIT_DISABLE_DMABUF_RENDERER 1 \
      --prefix PATH : ${pkgs.jdk}/bin

    install -Dm444 icon.xpm $out/share/icons/hicolor/256x256/apps/archi.xpm

    runHook postInstall
  '';

  desktopItems = [
    (pkgs.makeDesktopItem {
      name = "archi";
      desktopName = "Archi";
      exec = "Archi";
      type = "Application";
      comment = "ArchiMate modelling toolkit";
      icon = "archi";
      categories = ["Development"];
    })
  ];

  meta = with pkgs.lib; {
    description = "ArchiMate modelling toolkit";
    homepage = "https://www.archimatetool.com/";
    license = licenses.mit;
    platforms = ["x86_64-linux"];
    mainProgram = "Archi";
  };
}
