import 'package:drift/drift.dart';

class SyncQueue extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get type => text()();
  TextColumn get refId => text()();
  BoolColumn get completed =>
      boolean().withDefault(const Constant(false))();
}
