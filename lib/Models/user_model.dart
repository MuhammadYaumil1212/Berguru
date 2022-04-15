class UserModel {
  String ? uid;
  String ? nama;
  String ? email;

  UserModel({
    this.uid,
    this.nama,
    this.email
  });
    //receiving data from server
  factory UserModel.fromMap(map){
    return UserModel(
      uid: map['uid'],
      nama:map['nama'],
      email: map['email']
    );
  }
//  Sending data to our server
  Map<String,dynamic> toMap(){
    return {
      'uid' : uid,
      'nama' : nama,
      'email': email
    };
  }

  String? getNickName(){
    var getNama = this.nama;
    return getNama?[0];
  }
}