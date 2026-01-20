import 'package:drift/drift.dart';

class Inspections extends Table {
  TextColumn get id => text()();
  TextColumn get status => text()();
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

