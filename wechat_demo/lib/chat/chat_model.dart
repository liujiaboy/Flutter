class ChatModel {
  ChatModel(this.name, this.message, this.iconUrl);

  final String? name;
  final String? message;
  final String? iconUrl;

  factory ChatModel.fromMap(Map map) {
    return ChatModel(map["name"], map["content"], map["iconUrl"]);
  }
}
