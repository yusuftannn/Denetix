// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $InspectionsTable extends Inspections
    with TableInfo<$InspectionsTable, Inspection> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $InspectionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _checklistNameMeta = const VerificationMeta(
    'checklistName',
  );
  @override
  late final GeneratedColumn<String> checklistName = GeneratedColumn<String>(
    'checklist_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [id, status, createdAt, checklistName];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'inspections';
  @override
  VerificationContext validateIntegrity(
    Insertable<Inspection> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('checklist_name')) {
      context.handle(
        _checklistNameMeta,
        checklistName.isAcceptableOrUnknown(
          data['checklist_name']!,
          _checklistNameMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Inspection map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Inspection(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      checklistName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}checklist_name'],
      ),
    );
  }

  @override
  $InspectionsTable createAlias(String alias) {
    return $InspectionsTable(attachedDatabase, alias);
  }
}

class Inspection extends DataClass implements Insertable<Inspection> {
  final String id;
  final String status;
  final DateTime createdAt;
  final String? checklistName;
  const Inspection({
    required this.id,
    required this.status,
    required this.createdAt,
    this.checklistName,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['status'] = Variable<String>(status);
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || checklistName != null) {
      map['checklist_name'] = Variable<String>(checklistName);
    }
    return map;
  }

  InspectionsCompanion toCompanion(bool nullToAbsent) {
    return InspectionsCompanion(
      id: Value(id),
      status: Value(status),
      createdAt: Value(createdAt),
      checklistName: checklistName == null && nullToAbsent
          ? const Value.absent()
          : Value(checklistName),
    );
  }

  factory Inspection.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Inspection(
      id: serializer.fromJson<String>(json['id']),
      status: serializer.fromJson<String>(json['status']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      checklistName: serializer.fromJson<String?>(json['checklistName']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'status': serializer.toJson<String>(status),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'checklistName': serializer.toJson<String?>(checklistName),
    };
  }

  Inspection copyWith({
    String? id,
    String? status,
    DateTime? createdAt,
    Value<String?> checklistName = const Value.absent(),
  }) => Inspection(
    id: id ?? this.id,
    status: status ?? this.status,
    createdAt: createdAt ?? this.createdAt,
    checklistName: checklistName.present
        ? checklistName.value
        : this.checklistName,
  );
  Inspection copyWithCompanion(InspectionsCompanion data) {
    return Inspection(
      id: data.id.present ? data.id.value : this.id,
      status: data.status.present ? data.status.value : this.status,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      checklistName: data.checklistName.present
          ? data.checklistName.value
          : this.checklistName,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Inspection(')
          ..write('id: $id, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt, ')
          ..write('checklistName: $checklistName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, status, createdAt, checklistName);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Inspection &&
          other.id == this.id &&
          other.status == this.status &&
          other.createdAt == this.createdAt &&
          other.checklistName == this.checklistName);
}

class InspectionsCompanion extends UpdateCompanion<Inspection> {
  final Value<String> id;
  final Value<String> status;
  final Value<DateTime> createdAt;
  final Value<String?> checklistName;
  final Value<int> rowid;
  const InspectionsCompanion({
    this.id = const Value.absent(),
    this.status = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.checklistName = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  InspectionsCompanion.insert({
    required String id,
    required String status,
    required DateTime createdAt,
    this.checklistName = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       status = Value(status),
       createdAt = Value(createdAt);
  static Insertable<Inspection> custom({
    Expression<String>? id,
    Expression<String>? status,
    Expression<DateTime>? createdAt,
    Expression<String>? checklistName,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (status != null) 'status': status,
      if (createdAt != null) 'created_at': createdAt,
      if (checklistName != null) 'checklist_name': checklistName,
      if (rowid != null) 'rowid': rowid,
    });
  }

  InspectionsCompanion copyWith({
    Value<String>? id,
    Value<String>? status,
    Value<DateTime>? createdAt,
    Value<String?>? checklistName,
    Value<int>? rowid,
  }) {
    return InspectionsCompanion(
      id: id ?? this.id,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      checklistName: checklistName ?? this.checklistName,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (checklistName.present) {
      map['checklist_name'] = Variable<String>(checklistName.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('InspectionsCompanion(')
          ..write('id: $id, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt, ')
          ..write('checklistName: $checklistName, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $InspectionItemsTable extends InspectionItems
    with TableInfo<$InspectionItemsTable, InspectionItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $InspectionItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _inspectionIdMeta = const VerificationMeta(
    'inspectionId',
  );
  @override
  late final GeneratedColumn<String> inspectionId = GeneratedColumn<String>(
    'inspection_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _resultMeta = const VerificationMeta('result');
  @override
  late final GeneratedColumn<String> result = GeneratedColumn<String>(
    'result',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, inspectionId, title, result];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'inspection_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<InspectionItem> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('inspection_id')) {
      context.handle(
        _inspectionIdMeta,
        inspectionId.isAcceptableOrUnknown(
          data['inspection_id']!,
          _inspectionIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_inspectionIdMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('result')) {
      context.handle(
        _resultMeta,
        result.isAcceptableOrUnknown(data['result']!, _resultMeta),
      );
    } else if (isInserting) {
      context.missing(_resultMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  InspectionItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return InspectionItem(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      inspectionId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}inspection_id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      result: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}result'],
      )!,
    );
  }

  @override
  $InspectionItemsTable createAlias(String alias) {
    return $InspectionItemsTable(attachedDatabase, alias);
  }
}

class InspectionItem extends DataClass implements Insertable<InspectionItem> {
  final int id;
  final String inspectionId;
  final String title;
  final String result;
  const InspectionItem({
    required this.id,
    required this.inspectionId,
    required this.title,
    required this.result,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['inspection_id'] = Variable<String>(inspectionId);
    map['title'] = Variable<String>(title);
    map['result'] = Variable<String>(result);
    return map;
  }

  InspectionItemsCompanion toCompanion(bool nullToAbsent) {
    return InspectionItemsCompanion(
      id: Value(id),
      inspectionId: Value(inspectionId),
      title: Value(title),
      result: Value(result),
    );
  }

  factory InspectionItem.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return InspectionItem(
      id: serializer.fromJson<int>(json['id']),
      inspectionId: serializer.fromJson<String>(json['inspectionId']),
      title: serializer.fromJson<String>(json['title']),
      result: serializer.fromJson<String>(json['result']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'inspectionId': serializer.toJson<String>(inspectionId),
      'title': serializer.toJson<String>(title),
      'result': serializer.toJson<String>(result),
    };
  }

  InspectionItem copyWith({
    int? id,
    String? inspectionId,
    String? title,
    String? result,
  }) => InspectionItem(
    id: id ?? this.id,
    inspectionId: inspectionId ?? this.inspectionId,
    title: title ?? this.title,
    result: result ?? this.result,
  );
  InspectionItem copyWithCompanion(InspectionItemsCompanion data) {
    return InspectionItem(
      id: data.id.present ? data.id.value : this.id,
      inspectionId: data.inspectionId.present
          ? data.inspectionId.value
          : this.inspectionId,
      title: data.title.present ? data.title.value : this.title,
      result: data.result.present ? data.result.value : this.result,
    );
  }

  @override
  String toString() {
    return (StringBuffer('InspectionItem(')
          ..write('id: $id, ')
          ..write('inspectionId: $inspectionId, ')
          ..write('title: $title, ')
          ..write('result: $result')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, inspectionId, title, result);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is InspectionItem &&
          other.id == this.id &&
          other.inspectionId == this.inspectionId &&
          other.title == this.title &&
          other.result == this.result);
}

class InspectionItemsCompanion extends UpdateCompanion<InspectionItem> {
  final Value<int> id;
  final Value<String> inspectionId;
  final Value<String> title;
  final Value<String> result;
  const InspectionItemsCompanion({
    this.id = const Value.absent(),
    this.inspectionId = const Value.absent(),
    this.title = const Value.absent(),
    this.result = const Value.absent(),
  });
  InspectionItemsCompanion.insert({
    this.id = const Value.absent(),
    required String inspectionId,
    required String title,
    required String result,
  }) : inspectionId = Value(inspectionId),
       title = Value(title),
       result = Value(result);
  static Insertable<InspectionItem> custom({
    Expression<int>? id,
    Expression<String>? inspectionId,
    Expression<String>? title,
    Expression<String>? result,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (inspectionId != null) 'inspection_id': inspectionId,
      if (title != null) 'title': title,
      if (result != null) 'result': result,
    });
  }

  InspectionItemsCompanion copyWith({
    Value<int>? id,
    Value<String>? inspectionId,
    Value<String>? title,
    Value<String>? result,
  }) {
    return InspectionItemsCompanion(
      id: id ?? this.id,
      inspectionId: inspectionId ?? this.inspectionId,
      title: title ?? this.title,
      result: result ?? this.result,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (inspectionId.present) {
      map['inspection_id'] = Variable<String>(inspectionId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (result.present) {
      map['result'] = Variable<String>(result.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('InspectionItemsCompanion(')
          ..write('id: $id, ')
          ..write('inspectionId: $inspectionId, ')
          ..write('title: $title, ')
          ..write('result: $result')
          ..write(')'))
        .toString();
  }
}

class $PhotosTable extends Photos with TableInfo<$PhotosTable, Photo> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PhotosTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _inspectionIdMeta = const VerificationMeta(
    'inspectionId',
  );
  @override
  late final GeneratedColumn<String> inspectionId = GeneratedColumn<String>(
    'inspection_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _filePathMeta = const VerificationMeta(
    'filePath',
  );
  @override
  late final GeneratedColumn<String> filePath = GeneratedColumn<String>(
    'file_path',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, inspectionId, filePath];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'photos';
  @override
  VerificationContext validateIntegrity(
    Insertable<Photo> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('inspection_id')) {
      context.handle(
        _inspectionIdMeta,
        inspectionId.isAcceptableOrUnknown(
          data['inspection_id']!,
          _inspectionIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_inspectionIdMeta);
    }
    if (data.containsKey('file_path')) {
      context.handle(
        _filePathMeta,
        filePath.isAcceptableOrUnknown(data['file_path']!, _filePathMeta),
      );
    } else if (isInserting) {
      context.missing(_filePathMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Photo map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Photo(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      inspectionId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}inspection_id'],
      )!,
      filePath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}file_path'],
      )!,
    );
  }

  @override
  $PhotosTable createAlias(String alias) {
    return $PhotosTable(attachedDatabase, alias);
  }
}

class Photo extends DataClass implements Insertable<Photo> {
  final int id;
  final String inspectionId;
  final String filePath;
  const Photo({
    required this.id,
    required this.inspectionId,
    required this.filePath,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['inspection_id'] = Variable<String>(inspectionId);
    map['file_path'] = Variable<String>(filePath);
    return map;
  }

  PhotosCompanion toCompanion(bool nullToAbsent) {
    return PhotosCompanion(
      id: Value(id),
      inspectionId: Value(inspectionId),
      filePath: Value(filePath),
    );
  }

  factory Photo.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Photo(
      id: serializer.fromJson<int>(json['id']),
      inspectionId: serializer.fromJson<String>(json['inspectionId']),
      filePath: serializer.fromJson<String>(json['filePath']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'inspectionId': serializer.toJson<String>(inspectionId),
      'filePath': serializer.toJson<String>(filePath),
    };
  }

  Photo copyWith({int? id, String? inspectionId, String? filePath}) => Photo(
    id: id ?? this.id,
    inspectionId: inspectionId ?? this.inspectionId,
    filePath: filePath ?? this.filePath,
  );
  Photo copyWithCompanion(PhotosCompanion data) {
    return Photo(
      id: data.id.present ? data.id.value : this.id,
      inspectionId: data.inspectionId.present
          ? data.inspectionId.value
          : this.inspectionId,
      filePath: data.filePath.present ? data.filePath.value : this.filePath,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Photo(')
          ..write('id: $id, ')
          ..write('inspectionId: $inspectionId, ')
          ..write('filePath: $filePath')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, inspectionId, filePath);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Photo &&
          other.id == this.id &&
          other.inspectionId == this.inspectionId &&
          other.filePath == this.filePath);
}

class PhotosCompanion extends UpdateCompanion<Photo> {
  final Value<int> id;
  final Value<String> inspectionId;
  final Value<String> filePath;
  const PhotosCompanion({
    this.id = const Value.absent(),
    this.inspectionId = const Value.absent(),
    this.filePath = const Value.absent(),
  });
  PhotosCompanion.insert({
    this.id = const Value.absent(),
    required String inspectionId,
    required String filePath,
  }) : inspectionId = Value(inspectionId),
       filePath = Value(filePath);
  static Insertable<Photo> custom({
    Expression<int>? id,
    Expression<String>? inspectionId,
    Expression<String>? filePath,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (inspectionId != null) 'inspection_id': inspectionId,
      if (filePath != null) 'file_path': filePath,
    });
  }

  PhotosCompanion copyWith({
    Value<int>? id,
    Value<String>? inspectionId,
    Value<String>? filePath,
  }) {
    return PhotosCompanion(
      id: id ?? this.id,
      inspectionId: inspectionId ?? this.inspectionId,
      filePath: filePath ?? this.filePath,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (inspectionId.present) {
      map['inspection_id'] = Variable<String>(inspectionId.value);
    }
    if (filePath.present) {
      map['file_path'] = Variable<String>(filePath.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PhotosCompanion(')
          ..write('id: $id, ')
          ..write('inspectionId: $inspectionId, ')
          ..write('filePath: $filePath')
          ..write(')'))
        .toString();
  }
}

class $SignaturesTable extends Signatures
    with TableInfo<$SignaturesTable, Signature> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SignaturesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _inspectionIdMeta = const VerificationMeta(
    'inspectionId',
  );
  @override
  late final GeneratedColumn<String> inspectionId = GeneratedColumn<String>(
    'inspection_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _filePathMeta = const VerificationMeta(
    'filePath',
  );
  @override
  late final GeneratedColumn<String> filePath = GeneratedColumn<String>(
    'file_path',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [inspectionId, filePath];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'signatures';
  @override
  VerificationContext validateIntegrity(
    Insertable<Signature> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('inspection_id')) {
      context.handle(
        _inspectionIdMeta,
        inspectionId.isAcceptableOrUnknown(
          data['inspection_id']!,
          _inspectionIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_inspectionIdMeta);
    }
    if (data.containsKey('file_path')) {
      context.handle(
        _filePathMeta,
        filePath.isAcceptableOrUnknown(data['file_path']!, _filePathMeta),
      );
    } else if (isInserting) {
      context.missing(_filePathMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {inspectionId};
  @override
  Signature map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Signature(
      inspectionId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}inspection_id'],
      )!,
      filePath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}file_path'],
      )!,
    );
  }

  @override
  $SignaturesTable createAlias(String alias) {
    return $SignaturesTable(attachedDatabase, alias);
  }
}

class Signature extends DataClass implements Insertable<Signature> {
  final String inspectionId;
  final String filePath;
  const Signature({required this.inspectionId, required this.filePath});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['inspection_id'] = Variable<String>(inspectionId);
    map['file_path'] = Variable<String>(filePath);
    return map;
  }

  SignaturesCompanion toCompanion(bool nullToAbsent) {
    return SignaturesCompanion(
      inspectionId: Value(inspectionId),
      filePath: Value(filePath),
    );
  }

  factory Signature.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Signature(
      inspectionId: serializer.fromJson<String>(json['inspectionId']),
      filePath: serializer.fromJson<String>(json['filePath']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'inspectionId': serializer.toJson<String>(inspectionId),
      'filePath': serializer.toJson<String>(filePath),
    };
  }

  Signature copyWith({String? inspectionId, String? filePath}) => Signature(
    inspectionId: inspectionId ?? this.inspectionId,
    filePath: filePath ?? this.filePath,
  );
  Signature copyWithCompanion(SignaturesCompanion data) {
    return Signature(
      inspectionId: data.inspectionId.present
          ? data.inspectionId.value
          : this.inspectionId,
      filePath: data.filePath.present ? data.filePath.value : this.filePath,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Signature(')
          ..write('inspectionId: $inspectionId, ')
          ..write('filePath: $filePath')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(inspectionId, filePath);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Signature &&
          other.inspectionId == this.inspectionId &&
          other.filePath == this.filePath);
}

class SignaturesCompanion extends UpdateCompanion<Signature> {
  final Value<String> inspectionId;
  final Value<String> filePath;
  final Value<int> rowid;
  const SignaturesCompanion({
    this.inspectionId = const Value.absent(),
    this.filePath = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SignaturesCompanion.insert({
    required String inspectionId,
    required String filePath,
    this.rowid = const Value.absent(),
  }) : inspectionId = Value(inspectionId),
       filePath = Value(filePath);
  static Insertable<Signature> custom({
    Expression<String>? inspectionId,
    Expression<String>? filePath,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (inspectionId != null) 'inspection_id': inspectionId,
      if (filePath != null) 'file_path': filePath,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SignaturesCompanion copyWith({
    Value<String>? inspectionId,
    Value<String>? filePath,
    Value<int>? rowid,
  }) {
    return SignaturesCompanion(
      inspectionId: inspectionId ?? this.inspectionId,
      filePath: filePath ?? this.filePath,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (inspectionId.present) {
      map['inspection_id'] = Variable<String>(inspectionId.value);
    }
    if (filePath.present) {
      map['file_path'] = Variable<String>(filePath.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SignaturesCompanion(')
          ..write('inspectionId: $inspectionId, ')
          ..write('filePath: $filePath, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ChecklistsTable extends Checklists
    with TableInfo<$ChecklistsTable, Checklist> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ChecklistsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'checklists';
  @override
  VerificationContext validateIntegrity(
    Insertable<Checklist> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Checklist map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Checklist(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $ChecklistsTable createAlias(String alias) {
    return $ChecklistsTable(attachedDatabase, alias);
  }
}

class Checklist extends DataClass implements Insertable<Checklist> {
  final String id;
  final String name;
  final DateTime createdAt;
  const Checklist({
    required this.id,
    required this.name,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  ChecklistsCompanion toCompanion(bool nullToAbsent) {
    return ChecklistsCompanion(
      id: Value(id),
      name: Value(name),
      createdAt: Value(createdAt),
    );
  }

  factory Checklist.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Checklist(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  Checklist copyWith({String? id, String? name, DateTime? createdAt}) =>
      Checklist(
        id: id ?? this.id,
        name: name ?? this.name,
        createdAt: createdAt ?? this.createdAt,
      );
  Checklist copyWithCompanion(ChecklistsCompanion data) {
    return Checklist(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Checklist(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Checklist &&
          other.id == this.id &&
          other.name == this.name &&
          other.createdAt == this.createdAt);
}

class ChecklistsCompanion extends UpdateCompanion<Checklist> {
  final Value<String> id;
  final Value<String> name;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const ChecklistsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ChecklistsCompanion.insert({
    required String id,
    required String name,
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       createdAt = Value(createdAt);
  static Insertable<Checklist> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ChecklistsCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return ChecklistsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ChecklistsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ChecklistItemsTable extends ChecklistItems
    with TableInfo<$ChecklistItemsTable, ChecklistItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ChecklistItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _checklistIdMeta = const VerificationMeta(
    'checklistId',
  );
  @override
  late final GeneratedColumn<String> checklistId = GeneratedColumn<String>(
    'checklist_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _questionMeta = const VerificationMeta(
    'question',
  );
  @override
  late final GeneratedColumn<String> question = GeneratedColumn<String>(
    'question',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, checklistId, question];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'checklist_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<ChecklistItem> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('checklist_id')) {
      context.handle(
        _checklistIdMeta,
        checklistId.isAcceptableOrUnknown(
          data['checklist_id']!,
          _checklistIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_checklistIdMeta);
    }
    if (data.containsKey('question')) {
      context.handle(
        _questionMeta,
        question.isAcceptableOrUnknown(data['question']!, _questionMeta),
      );
    } else if (isInserting) {
      context.missing(_questionMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ChecklistItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ChecklistItem(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      checklistId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}checklist_id'],
      )!,
      question: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}question'],
      )!,
    );
  }

  @override
  $ChecklistItemsTable createAlias(String alias) {
    return $ChecklistItemsTable(attachedDatabase, alias);
  }
}

class ChecklistItem extends DataClass implements Insertable<ChecklistItem> {
  final int id;
  final String checklistId;
  final String question;
  const ChecklistItem({
    required this.id,
    required this.checklistId,
    required this.question,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['checklist_id'] = Variable<String>(checklistId);
    map['question'] = Variable<String>(question);
    return map;
  }

  ChecklistItemsCompanion toCompanion(bool nullToAbsent) {
    return ChecklistItemsCompanion(
      id: Value(id),
      checklistId: Value(checklistId),
      question: Value(question),
    );
  }

  factory ChecklistItem.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ChecklistItem(
      id: serializer.fromJson<int>(json['id']),
      checklistId: serializer.fromJson<String>(json['checklistId']),
      question: serializer.fromJson<String>(json['question']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'checklistId': serializer.toJson<String>(checklistId),
      'question': serializer.toJson<String>(question),
    };
  }

  ChecklistItem copyWith({int? id, String? checklistId, String? question}) =>
      ChecklistItem(
        id: id ?? this.id,
        checklistId: checklistId ?? this.checklistId,
        question: question ?? this.question,
      );
  ChecklistItem copyWithCompanion(ChecklistItemsCompanion data) {
    return ChecklistItem(
      id: data.id.present ? data.id.value : this.id,
      checklistId: data.checklistId.present
          ? data.checklistId.value
          : this.checklistId,
      question: data.question.present ? data.question.value : this.question,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ChecklistItem(')
          ..write('id: $id, ')
          ..write('checklistId: $checklistId, ')
          ..write('question: $question')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, checklistId, question);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ChecklistItem &&
          other.id == this.id &&
          other.checklistId == this.checklistId &&
          other.question == this.question);
}

class ChecklistItemsCompanion extends UpdateCompanion<ChecklistItem> {
  final Value<int> id;
  final Value<String> checklistId;
  final Value<String> question;
  const ChecklistItemsCompanion({
    this.id = const Value.absent(),
    this.checklistId = const Value.absent(),
    this.question = const Value.absent(),
  });
  ChecklistItemsCompanion.insert({
    this.id = const Value.absent(),
    required String checklistId,
    required String question,
  }) : checklistId = Value(checklistId),
       question = Value(question);
  static Insertable<ChecklistItem> custom({
    Expression<int>? id,
    Expression<String>? checklistId,
    Expression<String>? question,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (checklistId != null) 'checklist_id': checklistId,
      if (question != null) 'question': question,
    });
  }

  ChecklistItemsCompanion copyWith({
    Value<int>? id,
    Value<String>? checklistId,
    Value<String>? question,
  }) {
    return ChecklistItemsCompanion(
      id: id ?? this.id,
      checklistId: checklistId ?? this.checklistId,
      question: question ?? this.question,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (checklistId.present) {
      map['checklist_id'] = Variable<String>(checklistId.value);
    }
    if (question.present) {
      map['question'] = Variable<String>(question.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ChecklistItemsCompanion(')
          ..write('id: $id, ')
          ..write('checklistId: $checklistId, ')
          ..write('question: $question')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $InspectionsTable inspections = $InspectionsTable(this);
  late final $InspectionItemsTable inspectionItems = $InspectionItemsTable(
    this,
  );
  late final $PhotosTable photos = $PhotosTable(this);
  late final $SignaturesTable signatures = $SignaturesTable(this);
  late final $ChecklistsTable checklists = $ChecklistsTable(this);
  late final $ChecklistItemsTable checklistItems = $ChecklistItemsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    inspections,
    inspectionItems,
    photos,
    signatures,
    checklists,
    checklistItems,
  ];
}

typedef $$InspectionsTableCreateCompanionBuilder =
    InspectionsCompanion Function({
      required String id,
      required String status,
      required DateTime createdAt,
      Value<String?> checklistName,
      Value<int> rowid,
    });
typedef $$InspectionsTableUpdateCompanionBuilder =
    InspectionsCompanion Function({
      Value<String> id,
      Value<String> status,
      Value<DateTime> createdAt,
      Value<String?> checklistName,
      Value<int> rowid,
    });

class $$InspectionsTableFilterComposer
    extends Composer<_$AppDatabase, $InspectionsTable> {
  $$InspectionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get checklistName => $composableBuilder(
    column: $table.checklistName,
    builder: (column) => ColumnFilters(column),
  );
}

class $$InspectionsTableOrderingComposer
    extends Composer<_$AppDatabase, $InspectionsTable> {
  $$InspectionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get checklistName => $composableBuilder(
    column: $table.checklistName,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$InspectionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $InspectionsTable> {
  $$InspectionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get checklistName => $composableBuilder(
    column: $table.checklistName,
    builder: (column) => column,
  );
}

class $$InspectionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $InspectionsTable,
          Inspection,
          $$InspectionsTableFilterComposer,
          $$InspectionsTableOrderingComposer,
          $$InspectionsTableAnnotationComposer,
          $$InspectionsTableCreateCompanionBuilder,
          $$InspectionsTableUpdateCompanionBuilder,
          (
            Inspection,
            BaseReferences<_$AppDatabase, $InspectionsTable, Inspection>,
          ),
          Inspection,
          PrefetchHooks Function()
        > {
  $$InspectionsTableTableManager(_$AppDatabase db, $InspectionsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$InspectionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$InspectionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$InspectionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<String?> checklistName = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => InspectionsCompanion(
                id: id,
                status: status,
                createdAt: createdAt,
                checklistName: checklistName,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String status,
                required DateTime createdAt,
                Value<String?> checklistName = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => InspectionsCompanion.insert(
                id: id,
                status: status,
                createdAt: createdAt,
                checklistName: checklistName,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$InspectionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $InspectionsTable,
      Inspection,
      $$InspectionsTableFilterComposer,
      $$InspectionsTableOrderingComposer,
      $$InspectionsTableAnnotationComposer,
      $$InspectionsTableCreateCompanionBuilder,
      $$InspectionsTableUpdateCompanionBuilder,
      (
        Inspection,
        BaseReferences<_$AppDatabase, $InspectionsTable, Inspection>,
      ),
      Inspection,
      PrefetchHooks Function()
    >;
typedef $$InspectionItemsTableCreateCompanionBuilder =
    InspectionItemsCompanion Function({
      Value<int> id,
      required String inspectionId,
      required String title,
      required String result,
    });
typedef $$InspectionItemsTableUpdateCompanionBuilder =
    InspectionItemsCompanion Function({
      Value<int> id,
      Value<String> inspectionId,
      Value<String> title,
      Value<String> result,
    });

class $$InspectionItemsTableFilterComposer
    extends Composer<_$AppDatabase, $InspectionItemsTable> {
  $$InspectionItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get inspectionId => $composableBuilder(
    column: $table.inspectionId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get result => $composableBuilder(
    column: $table.result,
    builder: (column) => ColumnFilters(column),
  );
}

class $$InspectionItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $InspectionItemsTable> {
  $$InspectionItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get inspectionId => $composableBuilder(
    column: $table.inspectionId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get result => $composableBuilder(
    column: $table.result,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$InspectionItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $InspectionItemsTable> {
  $$InspectionItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get inspectionId => $composableBuilder(
    column: $table.inspectionId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get result =>
      $composableBuilder(column: $table.result, builder: (column) => column);
}

class $$InspectionItemsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $InspectionItemsTable,
          InspectionItem,
          $$InspectionItemsTableFilterComposer,
          $$InspectionItemsTableOrderingComposer,
          $$InspectionItemsTableAnnotationComposer,
          $$InspectionItemsTableCreateCompanionBuilder,
          $$InspectionItemsTableUpdateCompanionBuilder,
          (
            InspectionItem,
            BaseReferences<
              _$AppDatabase,
              $InspectionItemsTable,
              InspectionItem
            >,
          ),
          InspectionItem,
          PrefetchHooks Function()
        > {
  $$InspectionItemsTableTableManager(
    _$AppDatabase db,
    $InspectionItemsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$InspectionItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$InspectionItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$InspectionItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> inspectionId = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> result = const Value.absent(),
              }) => InspectionItemsCompanion(
                id: id,
                inspectionId: inspectionId,
                title: title,
                result: result,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String inspectionId,
                required String title,
                required String result,
              }) => InspectionItemsCompanion.insert(
                id: id,
                inspectionId: inspectionId,
                title: title,
                result: result,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$InspectionItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $InspectionItemsTable,
      InspectionItem,
      $$InspectionItemsTableFilterComposer,
      $$InspectionItemsTableOrderingComposer,
      $$InspectionItemsTableAnnotationComposer,
      $$InspectionItemsTableCreateCompanionBuilder,
      $$InspectionItemsTableUpdateCompanionBuilder,
      (
        InspectionItem,
        BaseReferences<_$AppDatabase, $InspectionItemsTable, InspectionItem>,
      ),
      InspectionItem,
      PrefetchHooks Function()
    >;
typedef $$PhotosTableCreateCompanionBuilder =
    PhotosCompanion Function({
      Value<int> id,
      required String inspectionId,
      required String filePath,
    });
typedef $$PhotosTableUpdateCompanionBuilder =
    PhotosCompanion Function({
      Value<int> id,
      Value<String> inspectionId,
      Value<String> filePath,
    });

class $$PhotosTableFilterComposer
    extends Composer<_$AppDatabase, $PhotosTable> {
  $$PhotosTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get inspectionId => $composableBuilder(
    column: $table.inspectionId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get filePath => $composableBuilder(
    column: $table.filePath,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PhotosTableOrderingComposer
    extends Composer<_$AppDatabase, $PhotosTable> {
  $$PhotosTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get inspectionId => $composableBuilder(
    column: $table.inspectionId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get filePath => $composableBuilder(
    column: $table.filePath,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PhotosTableAnnotationComposer
    extends Composer<_$AppDatabase, $PhotosTable> {
  $$PhotosTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get inspectionId => $composableBuilder(
    column: $table.inspectionId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get filePath =>
      $composableBuilder(column: $table.filePath, builder: (column) => column);
}

class $$PhotosTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PhotosTable,
          Photo,
          $$PhotosTableFilterComposer,
          $$PhotosTableOrderingComposer,
          $$PhotosTableAnnotationComposer,
          $$PhotosTableCreateCompanionBuilder,
          $$PhotosTableUpdateCompanionBuilder,
          (Photo, BaseReferences<_$AppDatabase, $PhotosTable, Photo>),
          Photo,
          PrefetchHooks Function()
        > {
  $$PhotosTableTableManager(_$AppDatabase db, $PhotosTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PhotosTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PhotosTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PhotosTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> inspectionId = const Value.absent(),
                Value<String> filePath = const Value.absent(),
              }) => PhotosCompanion(
                id: id,
                inspectionId: inspectionId,
                filePath: filePath,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String inspectionId,
                required String filePath,
              }) => PhotosCompanion.insert(
                id: id,
                inspectionId: inspectionId,
                filePath: filePath,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PhotosTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PhotosTable,
      Photo,
      $$PhotosTableFilterComposer,
      $$PhotosTableOrderingComposer,
      $$PhotosTableAnnotationComposer,
      $$PhotosTableCreateCompanionBuilder,
      $$PhotosTableUpdateCompanionBuilder,
      (Photo, BaseReferences<_$AppDatabase, $PhotosTable, Photo>),
      Photo,
      PrefetchHooks Function()
    >;
typedef $$SignaturesTableCreateCompanionBuilder =
    SignaturesCompanion Function({
      required String inspectionId,
      required String filePath,
      Value<int> rowid,
    });
typedef $$SignaturesTableUpdateCompanionBuilder =
    SignaturesCompanion Function({
      Value<String> inspectionId,
      Value<String> filePath,
      Value<int> rowid,
    });

class $$SignaturesTableFilterComposer
    extends Composer<_$AppDatabase, $SignaturesTable> {
  $$SignaturesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get inspectionId => $composableBuilder(
    column: $table.inspectionId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get filePath => $composableBuilder(
    column: $table.filePath,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SignaturesTableOrderingComposer
    extends Composer<_$AppDatabase, $SignaturesTable> {
  $$SignaturesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get inspectionId => $composableBuilder(
    column: $table.inspectionId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get filePath => $composableBuilder(
    column: $table.filePath,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SignaturesTableAnnotationComposer
    extends Composer<_$AppDatabase, $SignaturesTable> {
  $$SignaturesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get inspectionId => $composableBuilder(
    column: $table.inspectionId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get filePath =>
      $composableBuilder(column: $table.filePath, builder: (column) => column);
}

class $$SignaturesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SignaturesTable,
          Signature,
          $$SignaturesTableFilterComposer,
          $$SignaturesTableOrderingComposer,
          $$SignaturesTableAnnotationComposer,
          $$SignaturesTableCreateCompanionBuilder,
          $$SignaturesTableUpdateCompanionBuilder,
          (
            Signature,
            BaseReferences<_$AppDatabase, $SignaturesTable, Signature>,
          ),
          Signature,
          PrefetchHooks Function()
        > {
  $$SignaturesTableTableManager(_$AppDatabase db, $SignaturesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SignaturesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SignaturesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SignaturesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> inspectionId = const Value.absent(),
                Value<String> filePath = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SignaturesCompanion(
                inspectionId: inspectionId,
                filePath: filePath,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String inspectionId,
                required String filePath,
                Value<int> rowid = const Value.absent(),
              }) => SignaturesCompanion.insert(
                inspectionId: inspectionId,
                filePath: filePath,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SignaturesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SignaturesTable,
      Signature,
      $$SignaturesTableFilterComposer,
      $$SignaturesTableOrderingComposer,
      $$SignaturesTableAnnotationComposer,
      $$SignaturesTableCreateCompanionBuilder,
      $$SignaturesTableUpdateCompanionBuilder,
      (Signature, BaseReferences<_$AppDatabase, $SignaturesTable, Signature>),
      Signature,
      PrefetchHooks Function()
    >;
typedef $$ChecklistsTableCreateCompanionBuilder =
    ChecklistsCompanion Function({
      required String id,
      required String name,
      required DateTime createdAt,
      Value<int> rowid,
    });
typedef $$ChecklistsTableUpdateCompanionBuilder =
    ChecklistsCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

class $$ChecklistsTableFilterComposer
    extends Composer<_$AppDatabase, $ChecklistsTable> {
  $$ChecklistsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ChecklistsTableOrderingComposer
    extends Composer<_$AppDatabase, $ChecklistsTable> {
  $$ChecklistsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ChecklistsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ChecklistsTable> {
  $$ChecklistsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$ChecklistsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ChecklistsTable,
          Checklist,
          $$ChecklistsTableFilterComposer,
          $$ChecklistsTableOrderingComposer,
          $$ChecklistsTableAnnotationComposer,
          $$ChecklistsTableCreateCompanionBuilder,
          $$ChecklistsTableUpdateCompanionBuilder,
          (
            Checklist,
            BaseReferences<_$AppDatabase, $ChecklistsTable, Checklist>,
          ),
          Checklist,
          PrefetchHooks Function()
        > {
  $$ChecklistsTableTableManager(_$AppDatabase db, $ChecklistsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ChecklistsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ChecklistsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ChecklistsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ChecklistsCompanion(
                id: id,
                name: name,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                required DateTime createdAt,
                Value<int> rowid = const Value.absent(),
              }) => ChecklistsCompanion.insert(
                id: id,
                name: name,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ChecklistsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ChecklistsTable,
      Checklist,
      $$ChecklistsTableFilterComposer,
      $$ChecklistsTableOrderingComposer,
      $$ChecklistsTableAnnotationComposer,
      $$ChecklistsTableCreateCompanionBuilder,
      $$ChecklistsTableUpdateCompanionBuilder,
      (Checklist, BaseReferences<_$AppDatabase, $ChecklistsTable, Checklist>),
      Checklist,
      PrefetchHooks Function()
    >;
typedef $$ChecklistItemsTableCreateCompanionBuilder =
    ChecklistItemsCompanion Function({
      Value<int> id,
      required String checklistId,
      required String question,
    });
typedef $$ChecklistItemsTableUpdateCompanionBuilder =
    ChecklistItemsCompanion Function({
      Value<int> id,
      Value<String> checklistId,
      Value<String> question,
    });

class $$ChecklistItemsTableFilterComposer
    extends Composer<_$AppDatabase, $ChecklistItemsTable> {
  $$ChecklistItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get checklistId => $composableBuilder(
    column: $table.checklistId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get question => $composableBuilder(
    column: $table.question,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ChecklistItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $ChecklistItemsTable> {
  $$ChecklistItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get checklistId => $composableBuilder(
    column: $table.checklistId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get question => $composableBuilder(
    column: $table.question,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ChecklistItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ChecklistItemsTable> {
  $$ChecklistItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get checklistId => $composableBuilder(
    column: $table.checklistId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get question =>
      $composableBuilder(column: $table.question, builder: (column) => column);
}

class $$ChecklistItemsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ChecklistItemsTable,
          ChecklistItem,
          $$ChecklistItemsTableFilterComposer,
          $$ChecklistItemsTableOrderingComposer,
          $$ChecklistItemsTableAnnotationComposer,
          $$ChecklistItemsTableCreateCompanionBuilder,
          $$ChecklistItemsTableUpdateCompanionBuilder,
          (
            ChecklistItem,
            BaseReferences<_$AppDatabase, $ChecklistItemsTable, ChecklistItem>,
          ),
          ChecklistItem,
          PrefetchHooks Function()
        > {
  $$ChecklistItemsTableTableManager(
    _$AppDatabase db,
    $ChecklistItemsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ChecklistItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ChecklistItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ChecklistItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> checklistId = const Value.absent(),
                Value<String> question = const Value.absent(),
              }) => ChecklistItemsCompanion(
                id: id,
                checklistId: checklistId,
                question: question,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String checklistId,
                required String question,
              }) => ChecklistItemsCompanion.insert(
                id: id,
                checklistId: checklistId,
                question: question,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ChecklistItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ChecklistItemsTable,
      ChecklistItem,
      $$ChecklistItemsTableFilterComposer,
      $$ChecklistItemsTableOrderingComposer,
      $$ChecklistItemsTableAnnotationComposer,
      $$ChecklistItemsTableCreateCompanionBuilder,
      $$ChecklistItemsTableUpdateCompanionBuilder,
      (
        ChecklistItem,
        BaseReferences<_$AppDatabase, $ChecklistItemsTable, ChecklistItem>,
      ),
      ChecklistItem,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$InspectionsTableTableManager get inspections =>
      $$InspectionsTableTableManager(_db, _db.inspections);
  $$InspectionItemsTableTableManager get inspectionItems =>
      $$InspectionItemsTableTableManager(_db, _db.inspectionItems);
  $$PhotosTableTableManager get photos =>
      $$PhotosTableTableManager(_db, _db.photos);
  $$SignaturesTableTableManager get signatures =>
      $$SignaturesTableTableManager(_db, _db.signatures);
  $$ChecklistsTableTableManager get checklists =>
      $$ChecklistsTableTableManager(_db, _db.checklists);
  $$ChecklistItemsTableTableManager get checklistItems =>
      $$ChecklistItemsTableTableManager(_db, _db.checklistItems);
}
