
class GitRepoDatabaseFields {
  static const String tableName = 'repositories';
  static const String idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
  static const String textType = 'TEXT NOT NULL';
  static const String textTypeNULL = 'TEXT';
  static const String intType = 'INTEGER NOT NULL';
  static const String doubleType = 'REAL NOT NULL';
  static const String id = 'id';
  static const String name = 'name';
  static const String ownerName = 'login';
  static const String ownerPhoto = 'avatar_url';
  static const String starCount = 'stargazers_count';
  static const String gitLink = 'html_url';
  static const String ownerGit = 'url';
  static const String description = 'description';
  static const String updatedAt = 'updated_at';
}