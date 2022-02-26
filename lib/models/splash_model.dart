class SplashModel {
  String title;
  String description;
  String image;

  SplashModel(
      {required this.title, required this.description, required this.image});
}

List<SplashModel> models = [
  SplashModel(
      title: "Symptoms of Covid-19",
      description:
          "Covid-19 affects different people in different ways. Most infected peoplewill develop mild to modarate illness.",
      image: "assets/images/first_image.png"),
  SplashModel(
      title: "Covid-19 Information",
      description:
          "Most people who fall sick with Covid-19 will experience mild to moderate symptoms.",
      image: "assets/images/second_image.png"),
  SplashModel(
      title: "Just Stay at Home",
      description:
          "Stay at home to self quarantine ourself from covid-19, hopefully everything gonna be fine soon.",
      image: "assets/images/third_image.png")
];
