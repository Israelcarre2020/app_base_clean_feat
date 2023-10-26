class FetchDataTestModel {
  final int id;
  final String userName;
  final String email;

  FetchDataTestModel(
      {required this.id, required this.userName, required this.email});

  factory FetchDataTestModel.fromJson(Map<String, dynamic> json) {
    return FetchDataTestModel(
      id: json['id'],
      userName: json['username'],
      email: json['email'],
    );
  }
}
