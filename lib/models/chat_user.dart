class ChatUser {
  ChatUser({
    required this.image,
    required this.name,
    required this.createdAt,
    required this.isOnline,
    required this.id,
    required this.lastActive,
    required this.message,
    required this.pushToken,
    required this.email,
  });
  late final String image;
  late final String name;
  late final String createdAt;
  late final bool isOnline;
  late final String id;
  late final String lastActive;
  late final String message;
  late final String pushToken;
  late final String email;
  
  ChatUser.fromJson(Map<String, dynamic> json){
    image = json['image'] ?? '';
    name = json['name'] ?? '';
    createdAt = json['created_at'] ?? '';
    isOnline = json['is_online'] ?? '';
    id = json['id'] ?? '';
    lastActive = json['last_active'] ?? '';
    message = json['message'] ?? '';
    pushToken = json['push_token'] ?? '';
    email = json['email'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['image'] = image;
    data['name'] = name;
    data['created_at'] = createdAt;
    data['is_online'] = isOnline;
    data['id'] = id;
    data['last_active'] = lastActive;
    data['message'] = message;
    data['push_token'] = pushToken;
    data['email'] = email;
    return data;
  }
}