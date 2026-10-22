// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $CachedOpportunityRowsTable extends CachedOpportunityRows
    with TableInfo<$CachedOpportunityRowsTable, CachedOpportunityRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CachedOpportunityRowsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _scopeMeta = const VerificationMeta('scope');
  @override
  late final GeneratedColumn<String> scope = GeneratedColumn<String>(
    'scope',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _payloadMeta = const VerificationMeta(
    'payload',
  );
  @override
  late final GeneratedColumn<String> payload = GeneratedColumn<String>(
    'payload',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lastVerifiedAtMeta = const VerificationMeta(
    'lastVerifiedAt',
  );
  @override
  late final GeneratedColumn<DateTime> lastVerifiedAt =
      GeneratedColumn<DateTime>(
        'last_verified_at',
        aliasedName,
        false,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _cachedAtMeta = const VerificationMeta(
    'cachedAt',
  );
  @override
  late final GeneratedColumn<DateTime> cachedAt = GeneratedColumn<DateTime>(
    'cached_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    scope,
    payload,
    lastVerifiedAt,
    cachedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cached_opportunity_rows';
  @override
  VerificationContext validateIntegrity(
    Insertable<CachedOpportunityRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('scope')) {
      context.handle(
        _scopeMeta,
        scope.isAcceptableOrUnknown(data['scope']!, _scopeMeta),
      );
    } else if (isInserting) {
      context.missing(_scopeMeta);
    }
    if (data.containsKey('payload')) {
      context.handle(
        _payloadMeta,
        payload.isAcceptableOrUnknown(data['payload']!, _payloadMeta),
      );
    } else if (isInserting) {
      context.missing(_payloadMeta);
    }
    if (data.containsKey('last_verified_at')) {
      context.handle(
        _lastVerifiedAtMeta,
        lastVerifiedAt.isAcceptableOrUnknown(
          data['last_verified_at']!,
          _lastVerifiedAtMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_lastVerifiedAtMeta);
    }
    if (data.containsKey('cached_at')) {
      context.handle(
        _cachedAtMeta,
        cachedAt.isAcceptableOrUnknown(data['cached_at']!, _cachedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_cachedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CachedOpportunityRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CachedOpportunityRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      scope: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}scope'],
      )!,
      payload: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}payload'],
      )!,
      lastVerifiedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_verified_at'],
      )!,
      cachedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}cached_at'],
      )!,
    );
  }

  @override
  $CachedOpportunityRowsTable createAlias(String alias) {
    return $CachedOpportunityRowsTable(attachedDatabase, alias);
  }
}

class CachedOpportunityRow extends DataClass
    implements Insertable<CachedOpportunityRow> {
  /// The stable identifier of the opportunity.
  final String id;

  /// `national` or a state code such as `mh`.
  final String scope;

  /// The serialized domain model.
  final String payload;

  /// The day the record was last checked against its official source.
  final DateTime lastVerifiedAt;

  /// The moment this copy was written.
  final DateTime cachedAt;
  const CachedOpportunityRow({
    required this.id,
    required this.scope,
    required this.payload,
    required this.lastVerifiedAt,
    required this.cachedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['scope'] = Variable<String>(scope);
    map['payload'] = Variable<String>(payload);
    map['last_verified_at'] = Variable<DateTime>(lastVerifiedAt);
    map['cached_at'] = Variable<DateTime>(cachedAt);
    return map;
  }

  CachedOpportunityRowsCompanion toCompanion(bool nullToAbsent) {
    return CachedOpportunityRowsCompanion(
      id: Value(id),
      scope: Value(scope),
      payload: Value(payload),
      lastVerifiedAt: Value(lastVerifiedAt),
      cachedAt: Value(cachedAt),
    );
  }

  factory CachedOpportunityRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CachedOpportunityRow(
      id: serializer.fromJson<String>(json['id']),
      scope: serializer.fromJson<String>(json['scope']),
      payload: serializer.fromJson<String>(json['payload']),
      lastVerifiedAt: serializer.fromJson<DateTime>(json['lastVerifiedAt']),
      cachedAt: serializer.fromJson<DateTime>(json['cachedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'scope': serializer.toJson<String>(scope),
      'payload': serializer.toJson<String>(payload),
      'lastVerifiedAt': serializer.toJson<DateTime>(lastVerifiedAt),
      'cachedAt': serializer.toJson<DateTime>(cachedAt),
    };
  }

  CachedOpportunityRow copyWith({
    String? id,
    String? scope,
    String? payload,
    DateTime? lastVerifiedAt,
    DateTime? cachedAt,
  }) => CachedOpportunityRow(
    id: id ?? this.id,
    scope: scope ?? this.scope,
    payload: payload ?? this.payload,
    lastVerifiedAt: lastVerifiedAt ?? this.lastVerifiedAt,
    cachedAt: cachedAt ?? this.cachedAt,
  );
  CachedOpportunityRow copyWithCompanion(CachedOpportunityRowsCompanion data) {
    return CachedOpportunityRow(
      id: data.id.present ? data.id.value : this.id,
      scope: data.scope.present ? data.scope.value : this.scope,
      payload: data.payload.present ? data.payload.value : this.payload,
      lastVerifiedAt: data.lastVerifiedAt.present
          ? data.lastVerifiedAt.value
          : this.lastVerifiedAt,
      cachedAt: data.cachedAt.present ? data.cachedAt.value : this.cachedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CachedOpportunityRow(')
          ..write('id: $id, ')
          ..write('scope: $scope, ')
          ..write('payload: $payload, ')
          ..write('lastVerifiedAt: $lastVerifiedAt, ')
          ..write('cachedAt: $cachedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, scope, payload, lastVerifiedAt, cachedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CachedOpportunityRow &&
          other.id == this.id &&
          other.scope == this.scope &&
          other.payload == this.payload &&
          other.lastVerifiedAt == this.lastVerifiedAt &&
          other.cachedAt == this.cachedAt);
}

class CachedOpportunityRowsCompanion
    extends UpdateCompanion<CachedOpportunityRow> {
  final Value<String> id;
  final Value<String> scope;
  final Value<String> payload;
  final Value<DateTime> lastVerifiedAt;
  final Value<DateTime> cachedAt;
  final Value<int> rowid;
  const CachedOpportunityRowsCompanion({
    this.id = const Value.absent(),
    this.scope = const Value.absent(),
    this.payload = const Value.absent(),
    this.lastVerifiedAt = const Value.absent(),
    this.cachedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CachedOpportunityRowsCompanion.insert({
    required String id,
    required String scope,
    required String payload,
    required DateTime lastVerifiedAt,
    required DateTime cachedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       scope = Value(scope),
       payload = Value(payload),
       lastVerifiedAt = Value(lastVerifiedAt),
       cachedAt = Value(cachedAt);
  static Insertable<CachedOpportunityRow> custom({
    Expression<String>? id,
    Expression<String>? scope,
    Expression<String>? payload,
    Expression<DateTime>? lastVerifiedAt,
    Expression<DateTime>? cachedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (scope != null) 'scope': scope,
      if (payload != null) 'payload': payload,
      if (lastVerifiedAt != null) 'last_verified_at': lastVerifiedAt,
      if (cachedAt != null) 'cached_at': cachedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CachedOpportunityRowsCompanion copyWith({
    Value<String>? id,
    Value<String>? scope,
    Value<String>? payload,
    Value<DateTime>? lastVerifiedAt,
    Value<DateTime>? cachedAt,
    Value<int>? rowid,
  }) {
    return CachedOpportunityRowsCompanion(
      id: id ?? this.id,
      scope: scope ?? this.scope,
      payload: payload ?? this.payload,
      lastVerifiedAt: lastVerifiedAt ?? this.lastVerifiedAt,
      cachedAt: cachedAt ?? this.cachedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (scope.present) {
      map['scope'] = Variable<String>(scope.value);
    }
    if (payload.present) {
      map['payload'] = Variable<String>(payload.value);
    }
    if (lastVerifiedAt.present) {
      map['last_verified_at'] = Variable<DateTime>(lastVerifiedAt.value);
    }
    if (cachedAt.present) {
      map['cached_at'] = Variable<DateTime>(cachedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CachedOpportunityRowsCompanion(')
          ..write('id: $id, ')
          ..write('scope: $scope, ')
          ..write('payload: $payload, ')
          ..write('lastVerifiedAt: $lastVerifiedAt, ')
          ..write('cachedAt: $cachedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $UserProfileRowsTable extends UserProfileRows
    with TableInfo<$UserProfileRowsTable, UserProfileRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserProfileRowsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _studentIdMeta = const VerificationMeta(
    'studentId',
  );
  @override
  late final GeneratedColumn<String> studentId = GeneratedColumn<String>(
    'student_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _payloadMeta = const VerificationMeta(
    'payload',
  );
  @override
  late final GeneratedColumn<String> payload = GeneratedColumn<String>(
    'payload',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [studentId, payload, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_profile_rows';
  @override
  VerificationContext validateIntegrity(
    Insertable<UserProfileRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('student_id')) {
      context.handle(
        _studentIdMeta,
        studentId.isAcceptableOrUnknown(data['student_id']!, _studentIdMeta),
      );
    } else if (isInserting) {
      context.missing(_studentIdMeta);
    }
    if (data.containsKey('payload')) {
      context.handle(
        _payloadMeta,
        payload.isAcceptableOrUnknown(data['payload']!, _payloadMeta),
      );
    } else if (isInserting) {
      context.missing(_payloadMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {studentId};
  @override
  UserProfileRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserProfileRow(
      studentId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}student_id'],
      )!,
      payload: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}payload'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $UserProfileRowsTable createAlias(String alias) {
    return $UserProfileRowsTable(attachedDatabase, alias);
  }
}

class UserProfileRow extends DataClass implements Insertable<UserProfileRow> {
  /// The student's identifier. Never a phone number.
  final String studentId;

  /// The serialized domain model.
  final String payload;

  /// The moment this copy was written.
  final DateTime updatedAt;
  const UserProfileRow({
    required this.studentId,
    required this.payload,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['student_id'] = Variable<String>(studentId);
    map['payload'] = Variable<String>(payload);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  UserProfileRowsCompanion toCompanion(bool nullToAbsent) {
    return UserProfileRowsCompanion(
      studentId: Value(studentId),
      payload: Value(payload),
      updatedAt: Value(updatedAt),
    );
  }

  factory UserProfileRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserProfileRow(
      studentId: serializer.fromJson<String>(json['studentId']),
      payload: serializer.fromJson<String>(json['payload']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'studentId': serializer.toJson<String>(studentId),
      'payload': serializer.toJson<String>(payload),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  UserProfileRow copyWith({
    String? studentId,
    String? payload,
    DateTime? updatedAt,
  }) => UserProfileRow(
    studentId: studentId ?? this.studentId,
    payload: payload ?? this.payload,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  UserProfileRow copyWithCompanion(UserProfileRowsCompanion data) {
    return UserProfileRow(
      studentId: data.studentId.present ? data.studentId.value : this.studentId,
      payload: data.payload.present ? data.payload.value : this.payload,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserProfileRow(')
          ..write('studentId: $studentId, ')
          ..write('payload: $payload, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(studentId, payload, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserProfileRow &&
          other.studentId == this.studentId &&
          other.payload == this.payload &&
          other.updatedAt == this.updatedAt);
}

class UserProfileRowsCompanion extends UpdateCompanion<UserProfileRow> {
  final Value<String> studentId;
  final Value<String> payload;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const UserProfileRowsCompanion({
    this.studentId = const Value.absent(),
    this.payload = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UserProfileRowsCompanion.insert({
    required String studentId,
    required String payload,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : studentId = Value(studentId),
       payload = Value(payload),
       updatedAt = Value(updatedAt);
  static Insertable<UserProfileRow> custom({
    Expression<String>? studentId,
    Expression<String>? payload,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (studentId != null) 'student_id': studentId,
      if (payload != null) 'payload': payload,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UserProfileRowsCompanion copyWith({
    Value<String>? studentId,
    Value<String>? payload,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return UserProfileRowsCompanion(
      studentId: studentId ?? this.studentId,
      payload: payload ?? this.payload,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (studentId.present) {
      map['student_id'] = Variable<String>(studentId.value);
    }
    if (payload.present) {
      map['payload'] = Variable<String>(payload.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserProfileRowsCompanion(')
          ..write('studentId: $studentId, ')
          ..write('payload: $payload, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ProgressRowsTable extends ProgressRows
    with TableInfo<$ProgressRowsTable, ProgressRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProgressRowsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _studentIdMeta = const VerificationMeta(
    'studentId',
  );
  @override
  late final GeneratedColumn<String> studentId = GeneratedColumn<String>(
    'student_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _payloadMeta = const VerificationMeta(
    'payload',
  );
  @override
  late final GeneratedColumn<String> payload = GeneratedColumn<String>(
    'payload',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [studentId, payload, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'progress_rows';
  @override
  VerificationContext validateIntegrity(
    Insertable<ProgressRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('student_id')) {
      context.handle(
        _studentIdMeta,
        studentId.isAcceptableOrUnknown(data['student_id']!, _studentIdMeta),
      );
    } else if (isInserting) {
      context.missing(_studentIdMeta);
    }
    if (data.containsKey('payload')) {
      context.handle(
        _payloadMeta,
        payload.isAcceptableOrUnknown(data['payload']!, _payloadMeta),
      );
    } else if (isInserting) {
      context.missing(_payloadMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {studentId};
  @override
  ProgressRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProgressRow(
      studentId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}student_id'],
      )!,
      payload: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}payload'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $ProgressRowsTable createAlias(String alias) {
    return $ProgressRowsTable(attachedDatabase, alias);
  }
}

class ProgressRow extends DataClass implements Insertable<ProgressRow> {
  /// The student the progress belongs to.
  final String studentId;

  /// The serialized domain model.
  final String payload;

  /// The moment this copy was written.
  final DateTime updatedAt;
  const ProgressRow({
    required this.studentId,
    required this.payload,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['student_id'] = Variable<String>(studentId);
    map['payload'] = Variable<String>(payload);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  ProgressRowsCompanion toCompanion(bool nullToAbsent) {
    return ProgressRowsCompanion(
      studentId: Value(studentId),
      payload: Value(payload),
      updatedAt: Value(updatedAt),
    );
  }

  factory ProgressRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProgressRow(
      studentId: serializer.fromJson<String>(json['studentId']),
      payload: serializer.fromJson<String>(json['payload']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'studentId': serializer.toJson<String>(studentId),
      'payload': serializer.toJson<String>(payload),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  ProgressRow copyWith({
    String? studentId,
    String? payload,
    DateTime? updatedAt,
  }) => ProgressRow(
    studentId: studentId ?? this.studentId,
    payload: payload ?? this.payload,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  ProgressRow copyWithCompanion(ProgressRowsCompanion data) {
    return ProgressRow(
      studentId: data.studentId.present ? data.studentId.value : this.studentId,
      payload: data.payload.present ? data.payload.value : this.payload,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProgressRow(')
          ..write('studentId: $studentId, ')
          ..write('payload: $payload, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(studentId, payload, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProgressRow &&
          other.studentId == this.studentId &&
          other.payload == this.payload &&
          other.updatedAt == this.updatedAt);
}

class ProgressRowsCompanion extends UpdateCompanion<ProgressRow> {
  final Value<String> studentId;
  final Value<String> payload;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const ProgressRowsCompanion({
    this.studentId = const Value.absent(),
    this.payload = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ProgressRowsCompanion.insert({
    required String studentId,
    required String payload,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : studentId = Value(studentId),
       payload = Value(payload),
       updatedAt = Value(updatedAt);
  static Insertable<ProgressRow> custom({
    Expression<String>? studentId,
    Expression<String>? payload,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (studentId != null) 'student_id': studentId,
      if (payload != null) 'payload': payload,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ProgressRowsCompanion copyWith({
    Value<String>? studentId,
    Value<String>? payload,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return ProgressRowsCompanion(
      studentId: studentId ?? this.studentId,
      payload: payload ?? this.payload,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (studentId.present) {
      map['student_id'] = Variable<String>(studentId.value);
    }
    if (payload.present) {
      map['payload'] = Variable<String>(payload.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProgressRowsCompanion(')
          ..write('studentId: $studentId, ')
          ..write('payload: $payload, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DailyProgressRowsTable extends DailyProgressRows
    with TableInfo<$DailyProgressRowsTable, DailyProgressRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DailyProgressRowsTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _studentIdMeta = const VerificationMeta(
    'studentId',
  );
  @override
  late final GeneratedColumn<String> studentId = GeneratedColumn<String>(
    'student_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _clipIdMeta = const VerificationMeta('clipId');
  @override
  late final GeneratedColumn<String> clipId = GeneratedColumn<String>(
    'clip_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dateIsoMeta = const VerificationMeta(
    'dateIso',
  );
  @override
  late final GeneratedColumn<String> dateIso = GeneratedColumn<String>(
    'date_iso',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _pointsMeta = const VerificationMeta('points');
  @override
  late final GeneratedColumn<int> points = GeneratedColumn<int>(
    'points',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _completedAtMeta = const VerificationMeta(
    'completedAt',
  );
  @override
  late final GeneratedColumn<DateTime> completedAt = GeneratedColumn<DateTime>(
    'completed_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    studentId,
    clipId,
    dateIso,
    points,
    completedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'daily_progress_rows';
  @override
  VerificationContext validateIntegrity(
    Insertable<DailyProgressRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('student_id')) {
      context.handle(
        _studentIdMeta,
        studentId.isAcceptableOrUnknown(data['student_id']!, _studentIdMeta),
      );
    } else if (isInserting) {
      context.missing(_studentIdMeta);
    }
    if (data.containsKey('clip_id')) {
      context.handle(
        _clipIdMeta,
        clipId.isAcceptableOrUnknown(data['clip_id']!, _clipIdMeta),
      );
    } else if (isInserting) {
      context.missing(_clipIdMeta);
    }
    if (data.containsKey('date_iso')) {
      context.handle(
        _dateIsoMeta,
        dateIso.isAcceptableOrUnknown(data['date_iso']!, _dateIsoMeta),
      );
    } else if (isInserting) {
      context.missing(_dateIsoMeta);
    }
    if (data.containsKey('points')) {
      context.handle(
        _pointsMeta,
        points.isAcceptableOrUnknown(data['points']!, _pointsMeta),
      );
    }
    if (data.containsKey('completed_at')) {
      context.handle(
        _completedAtMeta,
        completedAt.isAcceptableOrUnknown(
          data['completed_at']!,
          _completedAtMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_completedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DailyProgressRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DailyProgressRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      studentId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}student_id'],
      )!,
      clipId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}clip_id'],
      )!,
      dateIso: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}date_iso'],
      )!,
      points: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}points'],
      )!,
      completedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}completed_at'],
      )!,
    );
  }

  @override
  $DailyProgressRowsTable createAlias(String alias) {
    return $DailyProgressRowsTable(attachedDatabase, alias);
  }
}

class DailyProgressRow extends DataClass
    implements Insertable<DailyProgressRow> {
  /// The auto incrementing row identifier.
  final int id;

  /// The student the completion belongs to.
  final String studentId;

  /// The clip that was completed.
  final String clipId;

  /// The ISO day, `yyyy-MM-dd`, the clip was completed on.
  final String dateIso;

  /// The points awarded for the completion.
  final int points;

  /// The moment the completion was recorded.
  final DateTime completedAt;
  const DailyProgressRow({
    required this.id,
    required this.studentId,
    required this.clipId,
    required this.dateIso,
    required this.points,
    required this.completedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['student_id'] = Variable<String>(studentId);
    map['clip_id'] = Variable<String>(clipId);
    map['date_iso'] = Variable<String>(dateIso);
    map['points'] = Variable<int>(points);
    map['completed_at'] = Variable<DateTime>(completedAt);
    return map;
  }

  DailyProgressRowsCompanion toCompanion(bool nullToAbsent) {
    return DailyProgressRowsCompanion(
      id: Value(id),
      studentId: Value(studentId),
      clipId: Value(clipId),
      dateIso: Value(dateIso),
      points: Value(points),
      completedAt: Value(completedAt),
    );
  }

  factory DailyProgressRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DailyProgressRow(
      id: serializer.fromJson<int>(json['id']),
      studentId: serializer.fromJson<String>(json['studentId']),
      clipId: serializer.fromJson<String>(json['clipId']),
      dateIso: serializer.fromJson<String>(json['dateIso']),
      points: serializer.fromJson<int>(json['points']),
      completedAt: serializer.fromJson<DateTime>(json['completedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'studentId': serializer.toJson<String>(studentId),
      'clipId': serializer.toJson<String>(clipId),
      'dateIso': serializer.toJson<String>(dateIso),
      'points': serializer.toJson<int>(points),
      'completedAt': serializer.toJson<DateTime>(completedAt),
    };
  }

  DailyProgressRow copyWith({
    int? id,
    String? studentId,
    String? clipId,
    String? dateIso,
    int? points,
    DateTime? completedAt,
  }) => DailyProgressRow(
    id: id ?? this.id,
    studentId: studentId ?? this.studentId,
    clipId: clipId ?? this.clipId,
    dateIso: dateIso ?? this.dateIso,
    points: points ?? this.points,
    completedAt: completedAt ?? this.completedAt,
  );
  DailyProgressRow copyWithCompanion(DailyProgressRowsCompanion data) {
    return DailyProgressRow(
      id: data.id.present ? data.id.value : this.id,
      studentId: data.studentId.present ? data.studentId.value : this.studentId,
      clipId: data.clipId.present ? data.clipId.value : this.clipId,
      dateIso: data.dateIso.present ? data.dateIso.value : this.dateIso,
      points: data.points.present ? data.points.value : this.points,
      completedAt: data.completedAt.present
          ? data.completedAt.value
          : this.completedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DailyProgressRow(')
          ..write('id: $id, ')
          ..write('studentId: $studentId, ')
          ..write('clipId: $clipId, ')
          ..write('dateIso: $dateIso, ')
          ..write('points: $points, ')
          ..write('completedAt: $completedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, studentId, clipId, dateIso, points, completedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DailyProgressRow &&
          other.id == this.id &&
          other.studentId == this.studentId &&
          other.clipId == this.clipId &&
          other.dateIso == this.dateIso &&
          other.points == this.points &&
          other.completedAt == this.completedAt);
}

class DailyProgressRowsCompanion extends UpdateCompanion<DailyProgressRow> {
  final Value<int> id;
  final Value<String> studentId;
  final Value<String> clipId;
  final Value<String> dateIso;
  final Value<int> points;
  final Value<DateTime> completedAt;
  const DailyProgressRowsCompanion({
    this.id = const Value.absent(),
    this.studentId = const Value.absent(),
    this.clipId = const Value.absent(),
    this.dateIso = const Value.absent(),
    this.points = const Value.absent(),
    this.completedAt = const Value.absent(),
  });
  DailyProgressRowsCompanion.insert({
    this.id = const Value.absent(),
    required String studentId,
    required String clipId,
    required String dateIso,
    this.points = const Value.absent(),
    required DateTime completedAt,
  }) : studentId = Value(studentId),
       clipId = Value(clipId),
       dateIso = Value(dateIso),
       completedAt = Value(completedAt);
  static Insertable<DailyProgressRow> custom({
    Expression<int>? id,
    Expression<String>? studentId,
    Expression<String>? clipId,
    Expression<String>? dateIso,
    Expression<int>? points,
    Expression<DateTime>? completedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (studentId != null) 'student_id': studentId,
      if (clipId != null) 'clip_id': clipId,
      if (dateIso != null) 'date_iso': dateIso,
      if (points != null) 'points': points,
      if (completedAt != null) 'completed_at': completedAt,
    });
  }

  DailyProgressRowsCompanion copyWith({
    Value<int>? id,
    Value<String>? studentId,
    Value<String>? clipId,
    Value<String>? dateIso,
    Value<int>? points,
    Value<DateTime>? completedAt,
  }) {
    return DailyProgressRowsCompanion(
      id: id ?? this.id,
      studentId: studentId ?? this.studentId,
      clipId: clipId ?? this.clipId,
      dateIso: dateIso ?? this.dateIso,
      points: points ?? this.points,
      completedAt: completedAt ?? this.completedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (studentId.present) {
      map['student_id'] = Variable<String>(studentId.value);
    }
    if (clipId.present) {
      map['clip_id'] = Variable<String>(clipId.value);
    }
    if (dateIso.present) {
      map['date_iso'] = Variable<String>(dateIso.value);
    }
    if (points.present) {
      map['points'] = Variable<int>(points.value);
    }
    if (completedAt.present) {
      map['completed_at'] = Variable<DateTime>(completedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DailyProgressRowsCompanion(')
          ..write('id: $id, ')
          ..write('studentId: $studentId, ')
          ..write('clipId: $clipId, ')
          ..write('dateIso: $dateIso, ')
          ..write('points: $points, ')
          ..write('completedAt: $completedAt')
          ..write(')'))
        .toString();
  }
}

class $PendingSyncRowsTable extends PendingSyncRows
    with TableInfo<$PendingSyncRowsTable, PendingSyncRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PendingSyncRowsTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _targetMeta = const VerificationMeta('target');
  @override
  late final GeneratedColumn<String> target = GeneratedColumn<String>(
    'target',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _payloadMeta = const VerificationMeta(
    'payload',
  );
  @override
  late final GeneratedColumn<String> payload = GeneratedColumn<String>(
    'payload',
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
  List<GeneratedColumn> get $columns => [id, target, payload, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'pending_sync_rows';
  @override
  VerificationContext validateIntegrity(
    Insertable<PendingSyncRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('target')) {
      context.handle(
        _targetMeta,
        target.isAcceptableOrUnknown(data['target']!, _targetMeta),
      );
    } else if (isInserting) {
      context.missing(_targetMeta);
    }
    if (data.containsKey('payload')) {
      context.handle(
        _payloadMeta,
        payload.isAcceptableOrUnknown(data['payload']!, _payloadMeta),
      );
    } else if (isInserting) {
      context.missing(_payloadMeta);
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
  PendingSyncRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PendingSyncRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      target: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}target'],
      )!,
      payload: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}payload'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $PendingSyncRowsTable createAlias(String alias) {
    return $PendingSyncRowsTable(attachedDatabase, alias);
  }
}

class PendingSyncRow extends DataClass implements Insertable<PendingSyncRow> {
  /// The auto incrementing row identifier.
  final int id;

  /// The collection the write targets, for example `progress`.
  final String target;

  /// The serialized payload of the write.
  final String payload;

  /// The moment the write was queued.
  final DateTime createdAt;
  const PendingSyncRow({
    required this.id,
    required this.target,
    required this.payload,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['target'] = Variable<String>(target);
    map['payload'] = Variable<String>(payload);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  PendingSyncRowsCompanion toCompanion(bool nullToAbsent) {
    return PendingSyncRowsCompanion(
      id: Value(id),
      target: Value(target),
      payload: Value(payload),
      createdAt: Value(createdAt),
    );
  }

  factory PendingSyncRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PendingSyncRow(
      id: serializer.fromJson<int>(json['id']),
      target: serializer.fromJson<String>(json['target']),
      payload: serializer.fromJson<String>(json['payload']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'target': serializer.toJson<String>(target),
      'payload': serializer.toJson<String>(payload),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  PendingSyncRow copyWith({
    int? id,
    String? target,
    String? payload,
    DateTime? createdAt,
  }) => PendingSyncRow(
    id: id ?? this.id,
    target: target ?? this.target,
    payload: payload ?? this.payload,
    createdAt: createdAt ?? this.createdAt,
  );
  PendingSyncRow copyWithCompanion(PendingSyncRowsCompanion data) {
    return PendingSyncRow(
      id: data.id.present ? data.id.value : this.id,
      target: data.target.present ? data.target.value : this.target,
      payload: data.payload.present ? data.payload.value : this.payload,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PendingSyncRow(')
          ..write('id: $id, ')
          ..write('target: $target, ')
          ..write('payload: $payload, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, target, payload, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PendingSyncRow &&
          other.id == this.id &&
          other.target == this.target &&
          other.payload == this.payload &&
          other.createdAt == this.createdAt);
}

class PendingSyncRowsCompanion extends UpdateCompanion<PendingSyncRow> {
  final Value<int> id;
  final Value<String> target;
  final Value<String> payload;
  final Value<DateTime> createdAt;
  const PendingSyncRowsCompanion({
    this.id = const Value.absent(),
    this.target = const Value.absent(),
    this.payload = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  PendingSyncRowsCompanion.insert({
    this.id = const Value.absent(),
    required String target,
    required String payload,
    required DateTime createdAt,
  }) : target = Value(target),
       payload = Value(payload),
       createdAt = Value(createdAt);
  static Insertable<PendingSyncRow> custom({
    Expression<int>? id,
    Expression<String>? target,
    Expression<String>? payload,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (target != null) 'target': target,
      if (payload != null) 'payload': payload,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  PendingSyncRowsCompanion copyWith({
    Value<int>? id,
    Value<String>? target,
    Value<String>? payload,
    Value<DateTime>? createdAt,
  }) {
    return PendingSyncRowsCompanion(
      id: id ?? this.id,
      target: target ?? this.target,
      payload: payload ?? this.payload,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (target.present) {
      map['target'] = Variable<String>(target.value);
    }
    if (payload.present) {
      map['payload'] = Variable<String>(payload.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PendingSyncRowsCompanion(')
          ..write('id: $id, ')
          ..write('target: $target, ')
          ..write('payload: $payload, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $FacilitatorClassRowsTable extends FacilitatorClassRows
    with TableInfo<$FacilitatorClassRowsTable, FacilitatorClassRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FacilitatorClassRowsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _classIdMeta = const VerificationMeta(
    'classId',
  );
  @override
  late final GeneratedColumn<String> classId = GeneratedColumn<String>(
    'class_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _facilitatorIdMeta = const VerificationMeta(
    'facilitatorId',
  );
  @override
  late final GeneratedColumn<String> facilitatorId = GeneratedColumn<String>(
    'facilitator_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _payloadMeta = const VerificationMeta(
    'payload',
  );
  @override
  late final GeneratedColumn<String> payload = GeneratedColumn<String>(
    'payload',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    classId,
    facilitatorId,
    payload,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'facilitator_class_rows';
  @override
  VerificationContext validateIntegrity(
    Insertable<FacilitatorClassRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('class_id')) {
      context.handle(
        _classIdMeta,
        classId.isAcceptableOrUnknown(data['class_id']!, _classIdMeta),
      );
    } else if (isInserting) {
      context.missing(_classIdMeta);
    }
    if (data.containsKey('facilitator_id')) {
      context.handle(
        _facilitatorIdMeta,
        facilitatorId.isAcceptableOrUnknown(
          data['facilitator_id']!,
          _facilitatorIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_facilitatorIdMeta);
    }
    if (data.containsKey('payload')) {
      context.handle(
        _payloadMeta,
        payload.isAcceptableOrUnknown(data['payload']!, _payloadMeta),
      );
    } else if (isInserting) {
      context.missing(_payloadMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {classId};
  @override
  FacilitatorClassRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FacilitatorClassRow(
      classId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}class_id'],
      )!,
      facilitatorId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}facilitator_id'],
      )!,
      payload: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}payload'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $FacilitatorClassRowsTable createAlias(String alias) {
    return $FacilitatorClassRowsTable(attachedDatabase, alias);
  }
}

class FacilitatorClassRow extends DataClass
    implements Insertable<FacilitatorClassRow> {
  /// The stable identifier of the class.
  final String classId;

  /// The facilitator who owns the class.
  final String facilitatorId;

  /// The serialized domain model.
  final String payload;

  /// The moment this copy was written.
  final DateTime updatedAt;
  const FacilitatorClassRow({
    required this.classId,
    required this.facilitatorId,
    required this.payload,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['class_id'] = Variable<String>(classId);
    map['facilitator_id'] = Variable<String>(facilitatorId);
    map['payload'] = Variable<String>(payload);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  FacilitatorClassRowsCompanion toCompanion(bool nullToAbsent) {
    return FacilitatorClassRowsCompanion(
      classId: Value(classId),
      facilitatorId: Value(facilitatorId),
      payload: Value(payload),
      updatedAt: Value(updatedAt),
    );
  }

  factory FacilitatorClassRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FacilitatorClassRow(
      classId: serializer.fromJson<String>(json['classId']),
      facilitatorId: serializer.fromJson<String>(json['facilitatorId']),
      payload: serializer.fromJson<String>(json['payload']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'classId': serializer.toJson<String>(classId),
      'facilitatorId': serializer.toJson<String>(facilitatorId),
      'payload': serializer.toJson<String>(payload),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  FacilitatorClassRow copyWith({
    String? classId,
    String? facilitatorId,
    String? payload,
    DateTime? updatedAt,
  }) => FacilitatorClassRow(
    classId: classId ?? this.classId,
    facilitatorId: facilitatorId ?? this.facilitatorId,
    payload: payload ?? this.payload,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  FacilitatorClassRow copyWithCompanion(FacilitatorClassRowsCompanion data) {
    return FacilitatorClassRow(
      classId: data.classId.present ? data.classId.value : this.classId,
      facilitatorId: data.facilitatorId.present
          ? data.facilitatorId.value
          : this.facilitatorId,
      payload: data.payload.present ? data.payload.value : this.payload,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FacilitatorClassRow(')
          ..write('classId: $classId, ')
          ..write('facilitatorId: $facilitatorId, ')
          ..write('payload: $payload, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(classId, facilitatorId, payload, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FacilitatorClassRow &&
          other.classId == this.classId &&
          other.facilitatorId == this.facilitatorId &&
          other.payload == this.payload &&
          other.updatedAt == this.updatedAt);
}

class FacilitatorClassRowsCompanion
    extends UpdateCompanion<FacilitatorClassRow> {
  final Value<String> classId;
  final Value<String> facilitatorId;
  final Value<String> payload;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const FacilitatorClassRowsCompanion({
    this.classId = const Value.absent(),
    this.facilitatorId = const Value.absent(),
    this.payload = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  FacilitatorClassRowsCompanion.insert({
    required String classId,
    required String facilitatorId,
    required String payload,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : classId = Value(classId),
       facilitatorId = Value(facilitatorId),
       payload = Value(payload),
       updatedAt = Value(updatedAt);
  static Insertable<FacilitatorClassRow> custom({
    Expression<String>? classId,
    Expression<String>? facilitatorId,
    Expression<String>? payload,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (classId != null) 'class_id': classId,
      if (facilitatorId != null) 'facilitator_id': facilitatorId,
      if (payload != null) 'payload': payload,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  FacilitatorClassRowsCompanion copyWith({
    Value<String>? classId,
    Value<String>? facilitatorId,
    Value<String>? payload,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return FacilitatorClassRowsCompanion(
      classId: classId ?? this.classId,
      facilitatorId: facilitatorId ?? this.facilitatorId,
      payload: payload ?? this.payload,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (classId.present) {
      map['class_id'] = Variable<String>(classId.value);
    }
    if (facilitatorId.present) {
      map['facilitator_id'] = Variable<String>(facilitatorId.value);
    }
    if (payload.present) {
      map['payload'] = Variable<String>(payload.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FacilitatorClassRowsCompanion(')
          ..write('classId: $classId, ')
          ..write('facilitatorId: $facilitatorId, ')
          ..write('payload: $payload, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ModuleRowsTable extends ModuleRows
    with TableInfo<$ModuleRowsTable, ModuleRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ModuleRowsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _moduleIdMeta = const VerificationMeta(
    'moduleId',
  );
  @override
  late final GeneratedColumn<String> moduleId = GeneratedColumn<String>(
    'module_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _ownerIdMeta = const VerificationMeta(
    'ownerId',
  );
  @override
  late final GeneratedColumn<String> ownerId = GeneratedColumn<String>(
    'owner_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _payloadMeta = const VerificationMeta(
    'payload',
  );
  @override
  late final GeneratedColumn<String> payload = GeneratedColumn<String>(
    'payload',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [moduleId, ownerId, payload, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'module_rows';
  @override
  VerificationContext validateIntegrity(
    Insertable<ModuleRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('module_id')) {
      context.handle(
        _moduleIdMeta,
        moduleId.isAcceptableOrUnknown(data['module_id']!, _moduleIdMeta),
      );
    } else if (isInserting) {
      context.missing(_moduleIdMeta);
    }
    if (data.containsKey('owner_id')) {
      context.handle(
        _ownerIdMeta,
        ownerId.isAcceptableOrUnknown(data['owner_id']!, _ownerIdMeta),
      );
    } else if (isInserting) {
      context.missing(_ownerIdMeta);
    }
    if (data.containsKey('payload')) {
      context.handle(
        _payloadMeta,
        payload.isAcceptableOrUnknown(data['payload']!, _payloadMeta),
      );
    } else if (isInserting) {
      context.missing(_payloadMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {moduleId};
  @override
  ModuleRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ModuleRow(
      moduleId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}module_id'],
      )!,
      ownerId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}owner_id'],
      )!,
      payload: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}payload'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $ModuleRowsTable createAlias(String alias) {
    return $ModuleRowsTable(attachedDatabase, alias);
  }
}

class ModuleRow extends DataClass implements Insertable<ModuleRow> {
  /// The stable identifier of the module.
  final String moduleId;

  /// The facilitator who published the module.
  final String ownerId;

  /// The serialized domain model.
  final String payload;

  /// The moment this copy was written.
  final DateTime updatedAt;
  const ModuleRow({
    required this.moduleId,
    required this.ownerId,
    required this.payload,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['module_id'] = Variable<String>(moduleId);
    map['owner_id'] = Variable<String>(ownerId);
    map['payload'] = Variable<String>(payload);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  ModuleRowsCompanion toCompanion(bool nullToAbsent) {
    return ModuleRowsCompanion(
      moduleId: Value(moduleId),
      ownerId: Value(ownerId),
      payload: Value(payload),
      updatedAt: Value(updatedAt),
    );
  }

  factory ModuleRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ModuleRow(
      moduleId: serializer.fromJson<String>(json['moduleId']),
      ownerId: serializer.fromJson<String>(json['ownerId']),
      payload: serializer.fromJson<String>(json['payload']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'moduleId': serializer.toJson<String>(moduleId),
      'ownerId': serializer.toJson<String>(ownerId),
      'payload': serializer.toJson<String>(payload),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  ModuleRow copyWith({
    String? moduleId,
    String? ownerId,
    String? payload,
    DateTime? updatedAt,
  }) => ModuleRow(
    moduleId: moduleId ?? this.moduleId,
    ownerId: ownerId ?? this.ownerId,
    payload: payload ?? this.payload,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  ModuleRow copyWithCompanion(ModuleRowsCompanion data) {
    return ModuleRow(
      moduleId: data.moduleId.present ? data.moduleId.value : this.moduleId,
      ownerId: data.ownerId.present ? data.ownerId.value : this.ownerId,
      payload: data.payload.present ? data.payload.value : this.payload,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ModuleRow(')
          ..write('moduleId: $moduleId, ')
          ..write('ownerId: $ownerId, ')
          ..write('payload: $payload, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(moduleId, ownerId, payload, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ModuleRow &&
          other.moduleId == this.moduleId &&
          other.ownerId == this.ownerId &&
          other.payload == this.payload &&
          other.updatedAt == this.updatedAt);
}

class ModuleRowsCompanion extends UpdateCompanion<ModuleRow> {
  final Value<String> moduleId;
  final Value<String> ownerId;
  final Value<String> payload;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const ModuleRowsCompanion({
    this.moduleId = const Value.absent(),
    this.ownerId = const Value.absent(),
    this.payload = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ModuleRowsCompanion.insert({
    required String moduleId,
    required String ownerId,
    required String payload,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : moduleId = Value(moduleId),
       ownerId = Value(ownerId),
       payload = Value(payload),
       updatedAt = Value(updatedAt);
  static Insertable<ModuleRow> custom({
    Expression<String>? moduleId,
    Expression<String>? ownerId,
    Expression<String>? payload,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (moduleId != null) 'module_id': moduleId,
      if (ownerId != null) 'owner_id': ownerId,
      if (payload != null) 'payload': payload,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ModuleRowsCompanion copyWith({
    Value<String>? moduleId,
    Value<String>? ownerId,
    Value<String>? payload,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return ModuleRowsCompanion(
      moduleId: moduleId ?? this.moduleId,
      ownerId: ownerId ?? this.ownerId,
      payload: payload ?? this.payload,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (moduleId.present) {
      map['module_id'] = Variable<String>(moduleId.value);
    }
    if (ownerId.present) {
      map['owner_id'] = Variable<String>(ownerId.value);
    }
    if (payload.present) {
      map['payload'] = Variable<String>(payload.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ModuleRowsCompanion(')
          ..write('moduleId: $moduleId, ')
          ..write('ownerId: $ownerId, ')
          ..write('payload: $payload, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $CachedOpportunityRowsTable cachedOpportunityRows =
      $CachedOpportunityRowsTable(this);
  late final $UserProfileRowsTable userProfileRows = $UserProfileRowsTable(
    this,
  );
  late final $ProgressRowsTable progressRows = $ProgressRowsTable(this);
  late final $DailyProgressRowsTable dailyProgressRows =
      $DailyProgressRowsTable(this);
  late final $PendingSyncRowsTable pendingSyncRows = $PendingSyncRowsTable(
    this,
  );
  late final $FacilitatorClassRowsTable facilitatorClassRows =
      $FacilitatorClassRowsTable(this);
  late final $ModuleRowsTable moduleRows = $ModuleRowsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    cachedOpportunityRows,
    userProfileRows,
    progressRows,
    dailyProgressRows,
    pendingSyncRows,
    facilitatorClassRows,
    moduleRows,
  ];
}

typedef $$CachedOpportunityRowsTableCreateCompanionBuilder =
    CachedOpportunityRowsCompanion Function({
      required String id,
      required String scope,
      required String payload,
      required DateTime lastVerifiedAt,
      required DateTime cachedAt,
      Value<int> rowid,
    });
typedef $$CachedOpportunityRowsTableUpdateCompanionBuilder =
    CachedOpportunityRowsCompanion Function({
      Value<String> id,
      Value<String> scope,
      Value<String> payload,
      Value<DateTime> lastVerifiedAt,
      Value<DateTime> cachedAt,
      Value<int> rowid,
    });

class $$CachedOpportunityRowsTableFilterComposer
    extends Composer<_$AppDatabase, $CachedOpportunityRowsTable> {
  $$CachedOpportunityRowsTableFilterComposer({
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

  ColumnFilters<String> get scope => $composableBuilder(
    column: $table.scope,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get payload => $composableBuilder(
    column: $table.payload,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastVerifiedAt => $composableBuilder(
    column: $table.lastVerifiedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get cachedAt => $composableBuilder(
    column: $table.cachedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CachedOpportunityRowsTableOrderingComposer
    extends Composer<_$AppDatabase, $CachedOpportunityRowsTable> {
  $$CachedOpportunityRowsTableOrderingComposer({
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

  ColumnOrderings<String> get scope => $composableBuilder(
    column: $table.scope,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get payload => $composableBuilder(
    column: $table.payload,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastVerifiedAt => $composableBuilder(
    column: $table.lastVerifiedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get cachedAt => $composableBuilder(
    column: $table.cachedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CachedOpportunityRowsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CachedOpportunityRowsTable> {
  $$CachedOpportunityRowsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get scope =>
      $composableBuilder(column: $table.scope, builder: (column) => column);

  GeneratedColumn<String> get payload =>
      $composableBuilder(column: $table.payload, builder: (column) => column);

  GeneratedColumn<DateTime> get lastVerifiedAt => $composableBuilder(
    column: $table.lastVerifiedAt,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get cachedAt =>
      $composableBuilder(column: $table.cachedAt, builder: (column) => column);
}

class $$CachedOpportunityRowsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CachedOpportunityRowsTable,
          CachedOpportunityRow,
          $$CachedOpportunityRowsTableFilterComposer,
          $$CachedOpportunityRowsTableOrderingComposer,
          $$CachedOpportunityRowsTableAnnotationComposer,
          $$CachedOpportunityRowsTableCreateCompanionBuilder,
          $$CachedOpportunityRowsTableUpdateCompanionBuilder,
          (
            CachedOpportunityRow,
            BaseReferences<
              _$AppDatabase,
              $CachedOpportunityRowsTable,
              CachedOpportunityRow
            >,
          ),
          CachedOpportunityRow,
          PrefetchHooks Function()
        > {
  $$CachedOpportunityRowsTableTableManager(
    _$AppDatabase db,
    $CachedOpportunityRowsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CachedOpportunityRowsTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$CachedOpportunityRowsTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$CachedOpportunityRowsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> scope = const Value.absent(),
                Value<String> payload = const Value.absent(),
                Value<DateTime> lastVerifiedAt = const Value.absent(),
                Value<DateTime> cachedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CachedOpportunityRowsCompanion(
                id: id,
                scope: scope,
                payload: payload,
                lastVerifiedAt: lastVerifiedAt,
                cachedAt: cachedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String scope,
                required String payload,
                required DateTime lastVerifiedAt,
                required DateTime cachedAt,
                Value<int> rowid = const Value.absent(),
              }) => CachedOpportunityRowsCompanion.insert(
                id: id,
                scope: scope,
                payload: payload,
                lastVerifiedAt: lastVerifiedAt,
                cachedAt: cachedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CachedOpportunityRowsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CachedOpportunityRowsTable,
      CachedOpportunityRow,
      $$CachedOpportunityRowsTableFilterComposer,
      $$CachedOpportunityRowsTableOrderingComposer,
      $$CachedOpportunityRowsTableAnnotationComposer,
      $$CachedOpportunityRowsTableCreateCompanionBuilder,
      $$CachedOpportunityRowsTableUpdateCompanionBuilder,
      (
        CachedOpportunityRow,
        BaseReferences<
          _$AppDatabase,
          $CachedOpportunityRowsTable,
          CachedOpportunityRow
        >,
      ),
      CachedOpportunityRow,
      PrefetchHooks Function()
    >;
typedef $$UserProfileRowsTableCreateCompanionBuilder =
    UserProfileRowsCompanion Function({
      required String studentId,
      required String payload,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$UserProfileRowsTableUpdateCompanionBuilder =
    UserProfileRowsCompanion Function({
      Value<String> studentId,
      Value<String> payload,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

class $$UserProfileRowsTableFilterComposer
    extends Composer<_$AppDatabase, $UserProfileRowsTable> {
  $$UserProfileRowsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get studentId => $composableBuilder(
    column: $table.studentId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get payload => $composableBuilder(
    column: $table.payload,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$UserProfileRowsTableOrderingComposer
    extends Composer<_$AppDatabase, $UserProfileRowsTable> {
  $$UserProfileRowsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get studentId => $composableBuilder(
    column: $table.studentId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get payload => $composableBuilder(
    column: $table.payload,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$UserProfileRowsTableAnnotationComposer
    extends Composer<_$AppDatabase, $UserProfileRowsTable> {
  $$UserProfileRowsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get studentId =>
      $composableBuilder(column: $table.studentId, builder: (column) => column);

  GeneratedColumn<String> get payload =>
      $composableBuilder(column: $table.payload, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$UserProfileRowsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UserProfileRowsTable,
          UserProfileRow,
          $$UserProfileRowsTableFilterComposer,
          $$UserProfileRowsTableOrderingComposer,
          $$UserProfileRowsTableAnnotationComposer,
          $$UserProfileRowsTableCreateCompanionBuilder,
          $$UserProfileRowsTableUpdateCompanionBuilder,
          (
            UserProfileRow,
            BaseReferences<
              _$AppDatabase,
              $UserProfileRowsTable,
              UserProfileRow
            >,
          ),
          UserProfileRow,
          PrefetchHooks Function()
        > {
  $$UserProfileRowsTableTableManager(
    _$AppDatabase db,
    $UserProfileRowsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UserProfileRowsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UserProfileRowsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UserProfileRowsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> studentId = const Value.absent(),
                Value<String> payload = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UserProfileRowsCompanion(
                studentId: studentId,
                payload: payload,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String studentId,
                required String payload,
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => UserProfileRowsCompanion.insert(
                studentId: studentId,
                payload: payload,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$UserProfileRowsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UserProfileRowsTable,
      UserProfileRow,
      $$UserProfileRowsTableFilterComposer,
      $$UserProfileRowsTableOrderingComposer,
      $$UserProfileRowsTableAnnotationComposer,
      $$UserProfileRowsTableCreateCompanionBuilder,
      $$UserProfileRowsTableUpdateCompanionBuilder,
      (
        UserProfileRow,
        BaseReferences<_$AppDatabase, $UserProfileRowsTable, UserProfileRow>,
      ),
      UserProfileRow,
      PrefetchHooks Function()
    >;
typedef $$ProgressRowsTableCreateCompanionBuilder =
    ProgressRowsCompanion Function({
      required String studentId,
      required String payload,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$ProgressRowsTableUpdateCompanionBuilder =
    ProgressRowsCompanion Function({
      Value<String> studentId,
      Value<String> payload,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

class $$ProgressRowsTableFilterComposer
    extends Composer<_$AppDatabase, $ProgressRowsTable> {
  $$ProgressRowsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get studentId => $composableBuilder(
    column: $table.studentId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get payload => $composableBuilder(
    column: $table.payload,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ProgressRowsTableOrderingComposer
    extends Composer<_$AppDatabase, $ProgressRowsTable> {
  $$ProgressRowsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get studentId => $composableBuilder(
    column: $table.studentId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get payload => $composableBuilder(
    column: $table.payload,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ProgressRowsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProgressRowsTable> {
  $$ProgressRowsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get studentId =>
      $composableBuilder(column: $table.studentId, builder: (column) => column);

  GeneratedColumn<String> get payload =>
      $composableBuilder(column: $table.payload, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$ProgressRowsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ProgressRowsTable,
          ProgressRow,
          $$ProgressRowsTableFilterComposer,
          $$ProgressRowsTableOrderingComposer,
          $$ProgressRowsTableAnnotationComposer,
          $$ProgressRowsTableCreateCompanionBuilder,
          $$ProgressRowsTableUpdateCompanionBuilder,
          (
            ProgressRow,
            BaseReferences<_$AppDatabase, $ProgressRowsTable, ProgressRow>,
          ),
          ProgressRow,
          PrefetchHooks Function()
        > {
  $$ProgressRowsTableTableManager(_$AppDatabase db, $ProgressRowsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProgressRowsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProgressRowsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProgressRowsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> studentId = const Value.absent(),
                Value<String> payload = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProgressRowsCompanion(
                studentId: studentId,
                payload: payload,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String studentId,
                required String payload,
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => ProgressRowsCompanion.insert(
                studentId: studentId,
                payload: payload,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ProgressRowsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ProgressRowsTable,
      ProgressRow,
      $$ProgressRowsTableFilterComposer,
      $$ProgressRowsTableOrderingComposer,
      $$ProgressRowsTableAnnotationComposer,
      $$ProgressRowsTableCreateCompanionBuilder,
      $$ProgressRowsTableUpdateCompanionBuilder,
      (
        ProgressRow,
        BaseReferences<_$AppDatabase, $ProgressRowsTable, ProgressRow>,
      ),
      ProgressRow,
      PrefetchHooks Function()
    >;
typedef $$DailyProgressRowsTableCreateCompanionBuilder =
    DailyProgressRowsCompanion Function({
      Value<int> id,
      required String studentId,
      required String clipId,
      required String dateIso,
      Value<int> points,
      required DateTime completedAt,
    });
typedef $$DailyProgressRowsTableUpdateCompanionBuilder =
    DailyProgressRowsCompanion Function({
      Value<int> id,
      Value<String> studentId,
      Value<String> clipId,
      Value<String> dateIso,
      Value<int> points,
      Value<DateTime> completedAt,
    });

class $$DailyProgressRowsTableFilterComposer
    extends Composer<_$AppDatabase, $DailyProgressRowsTable> {
  $$DailyProgressRowsTableFilterComposer({
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

  ColumnFilters<String> get studentId => $composableBuilder(
    column: $table.studentId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get clipId => $composableBuilder(
    column: $table.clipId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get dateIso => $composableBuilder(
    column: $table.dateIso,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get points => $composableBuilder(
    column: $table.points,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$DailyProgressRowsTableOrderingComposer
    extends Composer<_$AppDatabase, $DailyProgressRowsTable> {
  $$DailyProgressRowsTableOrderingComposer({
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

  ColumnOrderings<String> get studentId => $composableBuilder(
    column: $table.studentId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get clipId => $composableBuilder(
    column: $table.clipId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get dateIso => $composableBuilder(
    column: $table.dateIso,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get points => $composableBuilder(
    column: $table.points,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$DailyProgressRowsTableAnnotationComposer
    extends Composer<_$AppDatabase, $DailyProgressRowsTable> {
  $$DailyProgressRowsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get studentId =>
      $composableBuilder(column: $table.studentId, builder: (column) => column);

  GeneratedColumn<String> get clipId =>
      $composableBuilder(column: $table.clipId, builder: (column) => column);

  GeneratedColumn<String> get dateIso =>
      $composableBuilder(column: $table.dateIso, builder: (column) => column);

  GeneratedColumn<int> get points =>
      $composableBuilder(column: $table.points, builder: (column) => column);

  GeneratedColumn<DateTime> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => column,
  );
}

class $$DailyProgressRowsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DailyProgressRowsTable,
          DailyProgressRow,
          $$DailyProgressRowsTableFilterComposer,
          $$DailyProgressRowsTableOrderingComposer,
          $$DailyProgressRowsTableAnnotationComposer,
          $$DailyProgressRowsTableCreateCompanionBuilder,
          $$DailyProgressRowsTableUpdateCompanionBuilder,
          (
            DailyProgressRow,
            BaseReferences<
              _$AppDatabase,
              $DailyProgressRowsTable,
              DailyProgressRow
            >,
          ),
          DailyProgressRow,
          PrefetchHooks Function()
        > {
  $$DailyProgressRowsTableTableManager(
    _$AppDatabase db,
    $DailyProgressRowsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DailyProgressRowsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DailyProgressRowsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DailyProgressRowsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> studentId = const Value.absent(),
                Value<String> clipId = const Value.absent(),
                Value<String> dateIso = const Value.absent(),
                Value<int> points = const Value.absent(),
                Value<DateTime> completedAt = const Value.absent(),
              }) => DailyProgressRowsCompanion(
                id: id,
                studentId: studentId,
                clipId: clipId,
                dateIso: dateIso,
                points: points,
                completedAt: completedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String studentId,
                required String clipId,
                required String dateIso,
                Value<int> points = const Value.absent(),
                required DateTime completedAt,
              }) => DailyProgressRowsCompanion.insert(
                id: id,
                studentId: studentId,
                clipId: clipId,
                dateIso: dateIso,
                points: points,
                completedAt: completedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$DailyProgressRowsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DailyProgressRowsTable,
      DailyProgressRow,
      $$DailyProgressRowsTableFilterComposer,
      $$DailyProgressRowsTableOrderingComposer,
      $$DailyProgressRowsTableAnnotationComposer,
      $$DailyProgressRowsTableCreateCompanionBuilder,
      $$DailyProgressRowsTableUpdateCompanionBuilder,
      (
        DailyProgressRow,
        BaseReferences<
          _$AppDatabase,
          $DailyProgressRowsTable,
          DailyProgressRow
        >,
      ),
      DailyProgressRow,
      PrefetchHooks Function()
    >;
typedef $$PendingSyncRowsTableCreateCompanionBuilder =
    PendingSyncRowsCompanion Function({
      Value<int> id,
      required String target,
      required String payload,
      required DateTime createdAt,
    });
typedef $$PendingSyncRowsTableUpdateCompanionBuilder =
    PendingSyncRowsCompanion Function({
      Value<int> id,
      Value<String> target,
      Value<String> payload,
      Value<DateTime> createdAt,
    });

class $$PendingSyncRowsTableFilterComposer
    extends Composer<_$AppDatabase, $PendingSyncRowsTable> {
  $$PendingSyncRowsTableFilterComposer({
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

  ColumnFilters<String> get target => $composableBuilder(
    column: $table.target,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get payload => $composableBuilder(
    column: $table.payload,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PendingSyncRowsTableOrderingComposer
    extends Composer<_$AppDatabase, $PendingSyncRowsTable> {
  $$PendingSyncRowsTableOrderingComposer({
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

  ColumnOrderings<String> get target => $composableBuilder(
    column: $table.target,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get payload => $composableBuilder(
    column: $table.payload,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PendingSyncRowsTableAnnotationComposer
    extends Composer<_$AppDatabase, $PendingSyncRowsTable> {
  $$PendingSyncRowsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get target =>
      $composableBuilder(column: $table.target, builder: (column) => column);

  GeneratedColumn<String> get payload =>
      $composableBuilder(column: $table.payload, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$PendingSyncRowsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PendingSyncRowsTable,
          PendingSyncRow,
          $$PendingSyncRowsTableFilterComposer,
          $$PendingSyncRowsTableOrderingComposer,
          $$PendingSyncRowsTableAnnotationComposer,
          $$PendingSyncRowsTableCreateCompanionBuilder,
          $$PendingSyncRowsTableUpdateCompanionBuilder,
          (
            PendingSyncRow,
            BaseReferences<
              _$AppDatabase,
              $PendingSyncRowsTable,
              PendingSyncRow
            >,
          ),
          PendingSyncRow,
          PrefetchHooks Function()
        > {
  $$PendingSyncRowsTableTableManager(
    _$AppDatabase db,
    $PendingSyncRowsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PendingSyncRowsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PendingSyncRowsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PendingSyncRowsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> target = const Value.absent(),
                Value<String> payload = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => PendingSyncRowsCompanion(
                id: id,
                target: target,
                payload: payload,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String target,
                required String payload,
                required DateTime createdAt,
              }) => PendingSyncRowsCompanion.insert(
                id: id,
                target: target,
                payload: payload,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PendingSyncRowsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PendingSyncRowsTable,
      PendingSyncRow,
      $$PendingSyncRowsTableFilterComposer,
      $$PendingSyncRowsTableOrderingComposer,
      $$PendingSyncRowsTableAnnotationComposer,
      $$PendingSyncRowsTableCreateCompanionBuilder,
      $$PendingSyncRowsTableUpdateCompanionBuilder,
      (
        PendingSyncRow,
        BaseReferences<_$AppDatabase, $PendingSyncRowsTable, PendingSyncRow>,
      ),
      PendingSyncRow,
      PrefetchHooks Function()
    >;
typedef $$FacilitatorClassRowsTableCreateCompanionBuilder =
    FacilitatorClassRowsCompanion Function({
      required String classId,
      required String facilitatorId,
      required String payload,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$FacilitatorClassRowsTableUpdateCompanionBuilder =
    FacilitatorClassRowsCompanion Function({
      Value<String> classId,
      Value<String> facilitatorId,
      Value<String> payload,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

class $$FacilitatorClassRowsTableFilterComposer
    extends Composer<_$AppDatabase, $FacilitatorClassRowsTable> {
  $$FacilitatorClassRowsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get classId => $composableBuilder(
    column: $table.classId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get facilitatorId => $composableBuilder(
    column: $table.facilitatorId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get payload => $composableBuilder(
    column: $table.payload,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$FacilitatorClassRowsTableOrderingComposer
    extends Composer<_$AppDatabase, $FacilitatorClassRowsTable> {
  $$FacilitatorClassRowsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get classId => $composableBuilder(
    column: $table.classId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get facilitatorId => $composableBuilder(
    column: $table.facilitatorId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get payload => $composableBuilder(
    column: $table.payload,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$FacilitatorClassRowsTableAnnotationComposer
    extends Composer<_$AppDatabase, $FacilitatorClassRowsTable> {
  $$FacilitatorClassRowsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get classId =>
      $composableBuilder(column: $table.classId, builder: (column) => column);

  GeneratedColumn<String> get facilitatorId => $composableBuilder(
    column: $table.facilitatorId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get payload =>
      $composableBuilder(column: $table.payload, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$FacilitatorClassRowsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $FacilitatorClassRowsTable,
          FacilitatorClassRow,
          $$FacilitatorClassRowsTableFilterComposer,
          $$FacilitatorClassRowsTableOrderingComposer,
          $$FacilitatorClassRowsTableAnnotationComposer,
          $$FacilitatorClassRowsTableCreateCompanionBuilder,
          $$FacilitatorClassRowsTableUpdateCompanionBuilder,
          (
            FacilitatorClassRow,
            BaseReferences<
              _$AppDatabase,
              $FacilitatorClassRowsTable,
              FacilitatorClassRow
            >,
          ),
          FacilitatorClassRow,
          PrefetchHooks Function()
        > {
  $$FacilitatorClassRowsTableTableManager(
    _$AppDatabase db,
    $FacilitatorClassRowsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FacilitatorClassRowsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FacilitatorClassRowsTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$FacilitatorClassRowsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> classId = const Value.absent(),
                Value<String> facilitatorId = const Value.absent(),
                Value<String> payload = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => FacilitatorClassRowsCompanion(
                classId: classId,
                facilitatorId: facilitatorId,
                payload: payload,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String classId,
                required String facilitatorId,
                required String payload,
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => FacilitatorClassRowsCompanion.insert(
                classId: classId,
                facilitatorId: facilitatorId,
                payload: payload,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$FacilitatorClassRowsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $FacilitatorClassRowsTable,
      FacilitatorClassRow,
      $$FacilitatorClassRowsTableFilterComposer,
      $$FacilitatorClassRowsTableOrderingComposer,
      $$FacilitatorClassRowsTableAnnotationComposer,
      $$FacilitatorClassRowsTableCreateCompanionBuilder,
      $$FacilitatorClassRowsTableUpdateCompanionBuilder,
      (
        FacilitatorClassRow,
        BaseReferences<
          _$AppDatabase,
          $FacilitatorClassRowsTable,
          FacilitatorClassRow
        >,
      ),
      FacilitatorClassRow,
      PrefetchHooks Function()
    >;
typedef $$ModuleRowsTableCreateCompanionBuilder =
    ModuleRowsCompanion Function({
      required String moduleId,
      required String ownerId,
      required String payload,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$ModuleRowsTableUpdateCompanionBuilder =
    ModuleRowsCompanion Function({
      Value<String> moduleId,
      Value<String> ownerId,
      Value<String> payload,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

class $$ModuleRowsTableFilterComposer
    extends Composer<_$AppDatabase, $ModuleRowsTable> {
  $$ModuleRowsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get moduleId => $composableBuilder(
    column: $table.moduleId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ownerId => $composableBuilder(
    column: $table.ownerId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get payload => $composableBuilder(
    column: $table.payload,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ModuleRowsTableOrderingComposer
    extends Composer<_$AppDatabase, $ModuleRowsTable> {
  $$ModuleRowsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get moduleId => $composableBuilder(
    column: $table.moduleId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ownerId => $composableBuilder(
    column: $table.ownerId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get payload => $composableBuilder(
    column: $table.payload,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ModuleRowsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ModuleRowsTable> {
  $$ModuleRowsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get moduleId =>
      $composableBuilder(column: $table.moduleId, builder: (column) => column);

  GeneratedColumn<String> get ownerId =>
      $composableBuilder(column: $table.ownerId, builder: (column) => column);

  GeneratedColumn<String> get payload =>
      $composableBuilder(column: $table.payload, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$ModuleRowsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ModuleRowsTable,
          ModuleRow,
          $$ModuleRowsTableFilterComposer,
          $$ModuleRowsTableOrderingComposer,
          $$ModuleRowsTableAnnotationComposer,
          $$ModuleRowsTableCreateCompanionBuilder,
          $$ModuleRowsTableUpdateCompanionBuilder,
          (
            ModuleRow,
            BaseReferences<_$AppDatabase, $ModuleRowsTable, ModuleRow>,
          ),
          ModuleRow,
          PrefetchHooks Function()
        > {
  $$ModuleRowsTableTableManager(_$AppDatabase db, $ModuleRowsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ModuleRowsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ModuleRowsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ModuleRowsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> moduleId = const Value.absent(),
                Value<String> ownerId = const Value.absent(),
                Value<String> payload = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ModuleRowsCompanion(
                moduleId: moduleId,
                ownerId: ownerId,
                payload: payload,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String moduleId,
                required String ownerId,
                required String payload,
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => ModuleRowsCompanion.insert(
                moduleId: moduleId,
                ownerId: ownerId,
                payload: payload,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ModuleRowsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ModuleRowsTable,
      ModuleRow,
      $$ModuleRowsTableFilterComposer,
      $$ModuleRowsTableOrderingComposer,
      $$ModuleRowsTableAnnotationComposer,
      $$ModuleRowsTableCreateCompanionBuilder,
      $$ModuleRowsTableUpdateCompanionBuilder,
      (ModuleRow, BaseReferences<_$AppDatabase, $ModuleRowsTable, ModuleRow>),
      ModuleRow,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$CachedOpportunityRowsTableTableManager get cachedOpportunityRows =>
      $$CachedOpportunityRowsTableTableManager(_db, _db.cachedOpportunityRows);
  $$UserProfileRowsTableTableManager get userProfileRows =>
      $$UserProfileRowsTableTableManager(_db, _db.userProfileRows);
  $$ProgressRowsTableTableManager get progressRows =>
      $$ProgressRowsTableTableManager(_db, _db.progressRows);
  $$DailyProgressRowsTableTableManager get dailyProgressRows =>
      $$DailyProgressRowsTableTableManager(_db, _db.dailyProgressRows);
  $$PendingSyncRowsTableTableManager get pendingSyncRows =>
      $$PendingSyncRowsTableTableManager(_db, _db.pendingSyncRows);
  $$FacilitatorClassRowsTableTableManager get facilitatorClassRows =>
      $$FacilitatorClassRowsTableTableManager(_db, _db.facilitatorClassRows);
  $$ModuleRowsTableTableManager get moduleRows =>
      $$ModuleRowsTableTableManager(_db, _db.moduleRows);
}
