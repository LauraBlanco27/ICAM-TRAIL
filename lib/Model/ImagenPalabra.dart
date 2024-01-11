class ImagenPalabra {
  String rutaImagen;
  int idPar;
  bool esImagen;
  bool volteada = false;

  ImagenPalabra({
    required this.rutaImagen,
    required this.idPar,
    this.esImagen = true,
  });
}