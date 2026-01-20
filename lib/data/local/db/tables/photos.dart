import 'package:drift/drift.dart';

class Photos extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get inspectionId => text()();
  TextColumn get filePath => text()();
}
