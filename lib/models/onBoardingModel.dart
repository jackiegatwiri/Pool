class OnBoardingModel {
  String imageAssetPath;
  String title;
  String description;
  OnBoardingModel({this.imageAssetPath, this.title, this.description});

  void setImageAssetPath(String getImageAssetPath) {
    imageAssetPath = getImageAssetPath;
  }

  void setTitle(String getTitle) {
    title = getTitle;
  }

  void setDesc(String getDesc) {
    description = getDesc;
  }

  String getImageAssetPath() {
    return imageAssetPath;
  }

  String getTitle() {
    return title;
  }

  String getDesc() {
    return description;
  }
}

List<OnBoardingModel> getSlides() {
  List<OnBoardingModel> slides = new List<OnBoardingModel>();
  OnBoardingModel sliderModel = new OnBoardingModel();

  //1
  sliderModel.setDesc(
      "Discover stores offering the best products and order multiple products at once");
  sliderModel.setTitle("Shop");
  sliderModel.setImageAssetPath("assets/illustration2.png");
  slides.add(sliderModel);

  sliderModel = new OnBoardingModel();

  //2
  sliderModel.setDesc("Fast and same day delivery at your door step");
  sliderModel.setTitle("Quick");
  sliderModel.setImageAssetPath("assets/illustration.png");
  slides.add(sliderModel);

  sliderModel = new OnBoardingModel();

  //3
  sliderModel.setDesc("Easy and safe payment methods");
  sliderModel.setTitle("Easy");
  sliderModel.setImageAssetPath("assets/illustration3.png");
  slides.add(sliderModel);

  sliderModel = new OnBoardingModel();

  return slides;
}
