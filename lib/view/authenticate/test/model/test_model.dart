


import 'package:json_annotation/json_annotation.dart';
import 'package:templeteproject/core/base/model/base_model.dart';

@JsonSerializable()
class TestModel  extends BaseModel{

  int userId;
  int id;
  String title;

  TestModel({
    this.userId,
    this.id,
    this.title,
  });



  Map<String, dynamic> toJson() =>
      {
        "userId": userId == null ? null : userId,
        "id": id == null ? null : id,
        "title": title == null ? null : title,
      };

  @override
  fromJson(Map<String, Object> json) {
     return TestModel(
      userId: json["userId"] == null ? null : json["userId"],
      id: json["id"] == null ? null : json["id"],
      title: json["title"] == null ? null : json["title"],
    );
  }
}
