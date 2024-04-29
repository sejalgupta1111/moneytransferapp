class AllDataModel {
  String name;
  String number;
  String password;
  String availableAmount;

  AllDataModel({
    required this.name,
    required this.number,
    required this.password,
    required this.availableAmount,
});

  AllDataModel.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        number = json['number'],
        password = json['password'],
  availableAmount = json['availableAmount'];

  Map<String, dynamic> toJson() => {
    'name': name,
    'number': number,
    'password': password,
    'availableAmount': availableAmount,
  };
}