
class User {
  User({
    required this.id,
    required this.bankPlanId,
    required this.accountNumber,
    required this.name,
    required this.firstName,
    required this.lastName,
    required this.countryCode,
    this.companyLegalName,
    required this.zip,
    required this.dateOfBirth,
    required this.city,
    required this.address,
    required this.phone,
    required this.photo,
    required this.email,
    required this.updatedAt,
    required this.createdAt,
    required this.content,
  });

  int id;
  int bankPlanId;
  String accountNumber;
  String name;
  String firstName;
  String lastName;
  String countryCode;
  dynamic companyLegalName;
  String zip;
  String dateOfBirth;
  String city;
  String address;
  String phone;
  String photo;
  String email;
  DateTime updatedAt;
  DateTime createdAt;
  Content content;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    bankPlanId: json["bank_plan_id"],
    accountNumber: json["account_number"],
    name: json["name"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    countryCode: json["country_code"],
    companyLegalName: json["company_legal_name"]??"",
    zip: json["zip"],
    dateOfBirth: json["date_of_birth"],
    city: json["city"],
    address: json["address"],
    phone: json["phone"],
    photo: json["photo"],
    email: json["email"],
    updatedAt: DateTime.parse(json["updated_at"]),
    createdAt: DateTime.parse(json["created_at"]),
    content: Content.fromJson(json["content"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "bank_plan_id": bankPlanId,
    "account_number": accountNumber,
    "name": name,
    "first_name": firstName,
    "last_name": lastName,
    "country_code": countryCode,
    "company_legal_name": companyLegalName,
    "zip": zip,
    "date_of_birth": dateOfBirth,
    "city": city,
    "address": address,
    "phone": phone,
    "photo": photo,
    "email": email,
    "updated_at": updatedAt.toIso8601String(),
    "created_at": createdAt.toIso8601String(),
    "content": content.toJson(),
  };

}

class Content {
  Content({
    required this.accountInfo,
  });

  List<AccountInfo> accountInfo;

  factory Content.fromJson(Map<String, dynamic> json) => Content(
    accountInfo: List<AccountInfo>.from(json["account_info"].map((x) => AccountInfo.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "account_info": List<dynamic>.from(accountInfo.map((x) => x.toJson())),
  };
}

class AccountInfo {
  AccountInfo({
    required this.modulrAccountId,
    required this.account,
    required this.accountTitle,
    this.accountNumber,
    required this.sortCode,
    required this.currencyCode,
    required this.accountStatus,
    required this.modulrCustomerId,
    required this.userId,
    required this.balance,
    required this.accountType,
    required this.createdAt,
    required this.updatedAt,
    required this.walletId,
    required this.walletAmount,
    required this.accountName,
    required this.bankName,
  });

  String modulrAccountId;
  String account;
  String accountTitle;
  dynamic accountNumber;
  String sortCode;
  String currencyCode;
  String accountStatus;
  String modulrCustomerId;
  int userId;
  String balance;
  String accountType;
  DateTime createdAt;
  DateTime updatedAt;
  String walletId;
  int walletAmount;
  String accountName;
  String bankName;

  factory AccountInfo.fromJson(Map<String, dynamic> json) => AccountInfo(
    modulrAccountId: json["modulr_account_id"] == null ? "" : json["modulr_account_id"],
    account: json["Account"],
    accountTitle: json["account_title"] == null ? "" : json["account_title"],
    accountNumber: json["account_number"],
    sortCode: json["sort_code"] == null ? "" : json["sort_code"],
    currencyCode: json["currency_code"] == null ? "" : json["currency_code"],
    accountStatus: json["account_status"] == null ? "" : json["account_status"],
    modulrCustomerId: json["modulr_customer_id"] == null ? "" : json["modulr_customer_id"],
    userId: json["user_id"],
    balance: json["balance"] == null ? "" : json["balance"],
    accountType: json["account_type"] == null ? "" : json["account_type"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    walletId: json["wallet_id"] == null ? "" : json["wallet_id"],
    walletAmount: json["wallet_amount"] == null ? 0 : json["wallet_amount"],
    accountName: json["account_name"] == null ? "" : json["account_name"],
    bankName: json["bank_name"] == null ? "" : json["bank_name"],
  );

  Map<String, dynamic> toJson() => {
    "modulr_account_id": modulrAccountId == null ? "" : modulrAccountId,
    "Account": account,
    "account_title": accountTitle == null ? "" : accountTitle,
    "account_number": accountNumber,
    "sort_code": sortCode == null ? "" : sortCode,
    "currency_code": currencyCode == null ? "" : currencyCode,
    "account_status": accountStatus == null ? "" : accountStatus,
    "modulr_customer_id": modulrCustomerId == null ? "" : modulrCustomerId,
    "user_id": userId,
    "balance": balance == null ? "" : balance,
    "account_type": accountType == null ? "" : accountType,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "wallet_id": walletId == null ? "" : walletId,
    "wallet_amount": walletAmount == null ? 0 : walletAmount,
    "account_name": accountName == null ? "" : accountName,
    "bank_name": bankName == null ? "" : bankName,
  };

}
