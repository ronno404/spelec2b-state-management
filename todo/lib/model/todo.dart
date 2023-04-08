import 'package:uuid/uuid.dart';

class Todo {
  final String uuid;
  final String title;

  Todo({required this.title}) : uuid = const Uuid().v4();

  String get getTitle => title;

  @override
  bool operator ==(covariant Todo other) => uuid == other.uuid;

  @override
  int get hashCode => uuid.hashCode;
}
