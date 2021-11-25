import 'package:json_annotation/json_annotation.dart';

part 'chat_model.g.dart';


@JsonSerializable()
class ChatModel extends Object {

  @JsonKey(name: 'image_url')
  String? imageUrl;

  @JsonKey(name: 'name')
  String? name;

  @JsonKey(name: 'message')
  String? message;

  @JsonKey(name: 'message_detail')
  String? messageDetail;

  ChatModel(this.imageUrl,this.name,this.message,this.messageDetail,);

  factory ChatModel.fromJson(Map<String, dynamic> srcJson) => _$ChatModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ChatModelToJson(this);

}


