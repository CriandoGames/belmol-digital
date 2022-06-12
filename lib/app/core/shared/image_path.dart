class ImagePath {
  static final ImagePath _singleton = ImagePath._internal();

  factory ImagePath() => _singleton;

  ImagePath._internal();

  static String getLogo() {
    return 'assets/image/logo.png';
  }
}
