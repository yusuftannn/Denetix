import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'app_database.g.dart';

class Inspections extends Table {
  TextColumn get id => text()();

  TextColumn get status => text()();

  DateTimeColumn get createdAt => dateTime()();

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

@DriftDatabase(
  tables: [
    Inspections,
    InspectionItems,
    Photos,
    Signatures,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    return driftDatabase(name: 'denetix.sqlite');
  });
}
