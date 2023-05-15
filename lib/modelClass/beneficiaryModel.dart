class BeneficiaryModel {
  BeneficiaryModel({
    required this.id,
    required this.userId,
    required this.accountNumber,
    required this.isCompany,
    required this.beneficiaryName,
    required this.sortCode,
    required this.modulrBeneficiaryId,
    required this.referenceMessage,
    required this.formType,
    required this.createdAt,
    required this.updatedAt,
  });

  String id;
  int userId;
  String accountNumber;
  int isCompany;
  String beneficiaryName;
  String sortCode;
  String modulrBeneficiaryId;
  String referenceMessage;
  String formType;
  DateTime createdAt;
  DateTime updatedAt;

  factory BeneficiaryModel.fromJson(Map<String, dynamic> json) => BeneficiaryModel(
    id: json["id"],
    userId: json["user_id"],
    accountNumber: json["account_number"],
    isCompany: json["is_company"],
    beneficiaryName: json["beneficiary_name"],
    sortCode: json["sort_code"],
    modulrBeneficiaryId: json["modulr_beneficiary_id"],
    referenceMessage: json["reference_message"],
    formType: json["form_type"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "account_number": accountNumber,
    "is_company": isCompany,
    "beneficiary_name": beneficiaryName,
    "sort_code": sortCode,
    "modulr_beneficiary_id": modulrBeneficiaryId,
    "reference_message": referenceMessage,
    "form_type": formType,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
  static List<BeneficiaryModel> getListfromJson(List<dynamic> list){
    List<BeneficiaryModel> unitList = [];
    list.forEach((unit)=> unitList.add(BeneficiaryModel.fromJson(unit)));
    return unitList;
  }
}

