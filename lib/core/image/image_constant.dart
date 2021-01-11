class ImageConstant {
  static ImageConstant _instance;

  static ImageConstant get instance {
    if (_instance == null) _instance = ImageConstant._init();

    return _instance;
  }

  ImageConstant._init();

  String get logo => toPng("emre");

  String toPng(String name) => "assets/images/$name";
}

class Test {
  static Test _instance;
  static Test get instance {
    if (_instance == null) _instance = Test._init();
    return _instance;
  }

  Test._init();
}
