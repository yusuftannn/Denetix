import 'package:drift/drift.dart';

class Signatures extends Table {
  TextColumn get inspectionId => text()();
  TextColumn get filePath => text()();

  @override
  Set<Column> get primaryKey => {inspectionId};
}
