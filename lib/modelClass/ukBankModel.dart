class UkModel {
  UkModel({
    required this.id,
    required this.name,
    required this.capabilities,
  });

  String id;
  String name;
  List<Capability> capabilities;

  factory UkModel.fromJson(Map<String, dynamic> json) => UkModel(
    id: json["id"],
    name: json["name"],
    capabilities: List<Capability>.from(json["capabilities"].map((x) => Capability.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "capabilities": List<dynamic>.from(capabilities.map((x) => x.toJson())),
  };
  static List<UkModel> getListfromJson(List<dynamic> list){
    List<UkModel> unitList = [];
    list.forEach((unit)=> unitList.add(UkModel.fromJson(unit)));
    return unitList;
  }
}

class Capability {
  Capability({
    required this.type,
    required this.status,
  });

  String type;
  String status;

  factory Capability.fromJson(Map<String, dynamic> json) => Capability(
    type: json["type"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "status": status,
  };

}
