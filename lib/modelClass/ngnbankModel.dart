class BankModel {
  BankModel({
    required this.name,
    required this.code,
  });

  String name;
  String code;

  factory BankModel.fromJson(Map<String, dynamic> json) => BankModel(
    name: json["name"],
    code: json["code"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "code": code,
  };
  static List<BankModel> getListfromJson(List<dynamic> list){
    List<BankModel> unitList = [];
    list.forEach((unit)=> unitList.add(BankModel.fromJson(unit)));
    return unitList;
  }
}
