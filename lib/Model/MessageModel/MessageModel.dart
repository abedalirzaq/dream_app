class ChatMessageModel {
  final int? id;
   String message;
  final bool isSystem;
  final DateTime? createdAt;

  ChatMessageModel({
    this.id,
    required this.message,
    required this.isSystem,
    this.createdAt,
  });

  factory ChatMessageModel.fromMap(Map<String, dynamic> map) {
    return ChatMessageModel(
      id: map['id'],
      message: map['message'],
      isSystem: map['isSystem'] == 1,
      createdAt: DateTime.tryParse(map['createdAt']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'message': message,
      'isSystem': isSystem ? 1 : 0,
      'createdAt': createdAt?.toIso8601String() ?? DateTime.now().toIso8601String(),
    };
  }
}
