class ObjectAlreadyAddedException implements Exception {
  final String databaseName;

  ObjectAlreadyAddedException(this.databaseName);
  String get message =>
      "Object was already added to the database : $databaseName";
}
