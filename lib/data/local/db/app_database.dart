import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

part 'app_database.g.dart';

class Inspections extends Table {
  TextColumn get id => text()();
  TextColumn get status => text()();
  DateTimeColumn get createdAt => dateTime()();
  TextColumn get checklistName => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

class InspectionItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get inspectionId => text()();
  TextColumn get title => text()();
  TextColumn get result => text()();
}

class Photos extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get inspectionId => text()();
  TextColumn get filePath => text()();
}

class Signatures extends Table {
  TextColumn get inspectionId => text()();
  TextColumn get filePath => text()();

  @override
  Set<Column> get primaryKey => {inspectionId};
}

class Checklists extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

class ChecklistItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get checklistId => text()();
  TextColumn get question => text()();
}

@DriftDatabase(
  tables: [
    Inspections,
    InspectionItems,
    Photos,
    Signatures,
    Checklists,
    ChecklistItems,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onUpgrade: (m, from, to) async {
          if (from < 2) {
            await m.createTable(checklists);
            await m.createTable(checklistItems);
            await m.addColumn(inspections, inspections.checklistName);
          }
        },
      );
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    return driftDatabase(name: 'denetix.sqlite');
  });
}
