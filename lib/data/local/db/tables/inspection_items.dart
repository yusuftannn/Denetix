import 'package:drift/drift.dart';

class InspectionItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get inspectionId => text()();
  TextColumn get title => text()();
  TextColumn get result => text()();
}
