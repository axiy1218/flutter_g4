class ChatServiceModel {
  final String name;
  final bool isSelected;
  const ChatServiceModel({required this.isSelected, required this.name});

  ChatServiceModel copyWith({String? name, bool? isSelected}) =>
      ChatServiceModel(
          isSelected: isSelected ?? this.isSelected, name: name ?? this.name);
}
