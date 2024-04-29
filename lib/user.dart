import 'dart:ffi';

class User {
  int? id;
  String? phone;
  String? password;
  String? amount;

  User({this.id, this.phone, this.password,this.amount});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'phone': phone,
      'password': password,
      'amount': amount,
    };

    if (id != null) {
      map['id'] = id;
    }

    return map;
  }
}
