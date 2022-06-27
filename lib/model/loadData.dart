 class loadData {
  final int userId;
  final int id;
  final String title;

  const loadData({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory loadData.fromJson(Map<String, dynamic> json) {
    return loadData(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
} 

