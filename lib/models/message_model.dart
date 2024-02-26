class MessageModel {
  final String message;
  const MessageModel({required this.message});

  factory MessageModel.fromJson(map) {
    return MessageModel(
      message: map['message'],
    );
  }
}
