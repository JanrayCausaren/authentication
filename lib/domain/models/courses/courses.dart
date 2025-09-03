class Courses {
  Courses({
    required this.id,
    required this.title,
    required this.category,
    required this.thumbnailUrl,
    required this.progress,
    required this.status,
  });

  final String id;
  final String title;
  final String category;
  final String thumbnailUrl;
  final String progress;
  final String status;

  factory Courses.fromJson(Map<String, dynamic> json) {
    return Courses(
      id: json['id'],
      title: json['title'],
      category: json['category'],
      thumbnailUrl: json['thumbnail_url'],
      progress: json['progress'],
      status: json['status'],
    );
  }

  // @override
  // String toString() {
  //   return 'Courses(id: $id, title: $title, category: $category, '
  //       'thumbnailUrl: $thumbnailUrl, progress: $progress, status: $status)';
  // }
}
