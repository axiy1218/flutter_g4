class ChatUserModel {
  final bool isOnline;
  final String username;
  final String image;
  final int count;
  final bool hasNewMessage;
  final String lastMessage;
  final DateTime lastTime;
  const ChatUserModel(
      {required this.count,
      required this.hasNewMessage,
      required this.image,
      required this.isOnline,
      required this.lastMessage,
      required this.lastTime,
      required this.username});
}
