// ignore_for_file: public_member_api_docs, sort_constructors_first
class TodoItem {
  final String title;
  final bool isFavorite;
  final int updatedAt;

  TodoItem({
    required this.title,
    this.isFavorite = false,
    required this.updatedAt,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TodoItem &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          isFavorite == other.isFavorite &&
          updatedAt == other.updatedAt;

  @override
  int get hashCode => title.hashCode ^ isFavorite.hashCode ^ updatedAt.hashCode;
}
