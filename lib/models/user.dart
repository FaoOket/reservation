class BUser {
     String? name;
  String? email;
  String? uid;
  BUser({this.email, this.name, this.uid});
  BUser.fromJson(Map<String, dynamic> json) {
    email = json["email"];
    name = json["name"];
    uid = json["uid"];
  }
  Map<String, dynamic> toJson() {
    return {"uid": uid, "email": email, "name": name};
  }
}