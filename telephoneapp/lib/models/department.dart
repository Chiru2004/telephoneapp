class department {
  int? id;
  String? name;
  String? createdAt;
  String? updatedAt;
  int? unitId;

  department({this.id, this.name, this.createdAt, this.updatedAt, this.unitId});

  department.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    unitId = json['unit_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['unit_id'] = this.unitId;
    return data;
  }
}
