class ProfileParams {
  final String universityIDCard;

  ProfileParams({
    required this.universityIDCard,
  });

  Future<Map<String, dynamic>> toMap() async {
    String? token = universityIDCard;

    return {
      'universityIDCard': token,
    };
  }
}
