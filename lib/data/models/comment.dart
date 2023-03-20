import 'package:grocery/data/models/user.dart';

class Comment {
  final User user;
  final String content;

  Comment({
    required this.user,
    required this.content,
  });
}
