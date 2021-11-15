class ChatModel {
  ChatModel(this.name, this.message, this.iconUrl, this.messageDetail);

  final String? name;
  final String? message;
  final String? iconUrl;
  final String? messageDetail;

  factory ChatModel.fromMap(Map map) {
    return ChatModel(map["name"], map["message"], map["image_url"], map["message_detail"]);
  }
}
