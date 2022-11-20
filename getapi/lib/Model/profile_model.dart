class ProfileListModel {
  String? username;
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? email;
  String? nic;
  String? createdAt;

  ProfileListModel(
      {this.username,
      this.firstName,
      this.lastName,
      this.phoneNumber,
      this.email,
      this.nic,
      this.createdAt});

  ProfileListModel.fromJson(Map<String, dynamic> json) {
    username = json["username"];
    firstName = json["first_name"];
    lastName = json["last_name"];
    phoneNumber = json["phone_number"];
    email = json["email"];
    nic = json["nic"];
    createdAt = json["created_at"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["username"] = username;
    data["first_name"] = firstName;
    data["last_name"] = lastName;
    data["phone_number"] = phoneNumber;
    data["email"] = email;
    data["nic"] = nic;
    data["created_at"] = createdAt;
    return data;
  }
}
