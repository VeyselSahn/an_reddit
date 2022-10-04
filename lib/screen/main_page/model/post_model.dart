import 'package:json_annotation/json_annotation.dart';

part 'post_model.g.dart';

// tojson bu case için gereksiz
@JsonSerializable(createToJson: false)
class PostModel {
  String? title;
  String? author;
  String? thumbnail;
  String? url;
  @JsonKey(name: 'selftext')
  String? description;

  PostModel(
      this.title, this.author, this.thumbnail, this.description, this.url);

  factory PostModel.fromJson(Map<String, dynamic> json) =>
      _$PostModelFromJson(json);
}
