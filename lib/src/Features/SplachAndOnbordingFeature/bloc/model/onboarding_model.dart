class onboardingModel {
  String image;
  String title;
  String discription;
  double height;
  double width;

  onboardingModel({
    required this.image,
    required this.title,
    required this.discription,
    required this.height,
    required this.width,
  });
}

List<onboardingModel> contents = [
  onboardingModel(
    image: 'assets/images/OnBoarding1.png',
    title: 'Welcome to Querium',
    discription:
        'Querium transforms your documents into interactive quizzes ,making study sessions engaging and effective.',
    height: 411,
    width: double.infinity,
  ),
  onboardingModel(
    image: 'assets/images/OnBoarding2.png',
    title: 'Effortless quiz creation',
    discription:
        'Upload your document and let an AI craft structured quizzes instantly.',
    height: 411,
    width: double.infinity,
  ),
  onboardingModel(
    image: 'assets/images/OnBoarding3.png',
    title: 'Adaptable Learning for\nEveryone',
    discription:
        'Customize quizzes for any subject or level for a personalized learning experience.',
    height: 411,
    width: double.infinity,
  ),
];
