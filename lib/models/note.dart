class Note {
  Note({
    required this.id,
    required this.color,
    required this.title,
    required this.timestamp,
    required this.description,
  });
  final int id;
  final String title;
  final String color;
  final String timestamp;
  final String description;
}