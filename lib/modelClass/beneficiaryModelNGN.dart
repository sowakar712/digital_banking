class BeneficiaryNGNModel {
  BeneficiaryNGNModel({
    required this.id,
    required this.userId,
    required this.accountNumber,
    required this.accountName,
    required this.referenceMessage,
    required this.bankName,
    required this.bankCode,
    required this.isCompany,
    required this.formType,
    required this.createdAt,
    required this.updatedAt,
  });

  String id;
  int userId;
  String accountNumber;
  dynamic accountName;
  String referenceMessage;
  dynamic bankName;
  String bankCode;
  int isCompany;
  String formType;
  DateTime createdAt;
  DateTime updatedAt;

  factory BeneficiaryNGNModel.fromJson(Map<String, dynamic> json) => BeneficiaryNGNModel(
    id: json["id"]??"",
    userId: json["user_id"]??"",
    accountNumber: json["account_number"]??"",
    accountName: json["account_name"]??"",
    referenceMessage: json["reference_message"]??"",
    bankName: json["bank_name"]??"",
    bankCode: json["bank_code"]??"",
    isCompany: json["is_company"]??"",
    formType: json["form_type"]??"",
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "account_number": accountNumber,
    "account_name": accountName,
    "reference_message": referenceMessage,
    "bank_name": bankName,
    "bank_code": bankCode,
    "is_company": isCompany,
    "form_type": formType,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
  static List<BeneficiaryNGNModel> getListfromJson(List<dynamic> list){
    List<BeneficiaryNGNModel> unitList = [];
    list.forEach((unit)=> unitList.add(BeneficiaryNGNModel.fromJson(unit)));
    return unitList;
  }
}
