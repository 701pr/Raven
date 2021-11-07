class UserModel {
  String? uid;
  String? email;
  String? firstName;
  String? lastName;

  UserModel({
    this.uid,
    this.email,
    this.firstName,
    this.lastName,
  });
//receive
  factory UserModel.fromMap(map) => UserModel(
        uid: map["uid"],
        email: map["email"],
        firstName: map["firstName"],
        lastName: map["lastName"],
      );
//send
  Map<String, dynamic> toMap() => {
        "uid": uid,
        "email": email,
        "firstName": firstName,
        "lastName": lastName,
      };
}
