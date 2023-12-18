class facultyindividual {
  int? id;
  String? name;
  String? email;
  String? siteName;
  String? joiningDate;
  String? createdAt;
  String? updatedAt;
  int? departmentId;
  int? mobile1;
  int? mobile2;
  int? landlineOffice;
  int? landlineResidential;
  Null? landlineOfficeIntercom;
  Null? landlineOfficeDirect;
  Null? designationId;
  Null? position1Id;
  Null? position2Id;

  facultyindividual(
      {this.id,
      this.name,
      this.email,
      this.siteName,
      this.joiningDate,
      this.createdAt,
      this.updatedAt,
      this.departmentId,
      this.mobile1,
      this.mobile2,
      this.landlineOffice,
      this.landlineResidential,
      this.landlineOfficeIntercom,
      this.landlineOfficeDirect,
      this.designationId,
      this.position1Id,
      this.position2Id});

  facultyindividual.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    siteName = json['site_name'];
    joiningDate = json['joining_date'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    departmentId = json['department_id'];
    mobile1 = json['mobile1'];
    mobile2 = json['mobile2'];
    landlineOffice = json['landline_office'];
    landlineResidential = json['landline_residential'];
    landlineOfficeIntercom = json['landline_office_intercom'];
    landlineOfficeDirect = json['landline_office_direct'];
    designationId = json['designation_id'];
    position1Id = json['position1_id'];
    position2Id = json['position2_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['site_name'] = this.siteName;
    data['joining_date'] = this.joiningDate;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['department_id'] = this.departmentId;
    data['mobile1'] = this.mobile1;
    data['mobile2'] = this.mobile2;
    data['landline_office'] = this.landlineOffice;
    data['landline_residential'] = this.landlineResidential;
    data['landline_office_intercom'] = this.landlineOfficeIntercom;
    data['landline_office_direct'] = this.landlineOfficeDirect;
    data['designation_id'] = this.designationId;
    data['position1_id'] = this.position1Id;
    data['position2_id'] = this.position2Id;
    return data;
  }
}
