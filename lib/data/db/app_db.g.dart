// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_db.dart';

// ignore_for_file: type=lint
class $UsersTable extends Users with TableInfo<$UsersTable, User> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsersTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _usernameMeta = const VerificationMeta(
    'username',
  );
  @override
  late final GeneratedColumn<String> username = GeneratedColumn<String>(
    'username',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
    'email',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _passwordMeta = const VerificationMeta(
    'password',
  );
  @override
  late final GeneratedColumn<String> password = GeneratedColumn<String>(
    'password',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _roleMeta = const VerificationMeta('role');
  @override
  late final GeneratedColumn<String> role = GeneratedColumn<String>(
    'role',
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
  static const VerificationMeta _lastnameMeta = const VerificationMeta(
    'lastname',
  );
  @override
  late final GeneratedColumn<String> lastname = GeneratedColumn<String>(
    'lastname',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
    'phone',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
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
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    username,
    email,
    password,
    role,
    name,
    lastname,
    phone,
    createdAt,
    deletedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'users';
  @override
  VerificationContext validateIntegrity(
    Insertable<User> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('username')) {
      context.handle(
        _usernameMeta,
        username.isAcceptableOrUnknown(data['username']!, _usernameMeta),
      );
    } else if (isInserting) {
      context.missing(_usernameMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
        _emailMeta,
        email.isAcceptableOrUnknown(data['email']!, _emailMeta),
      );
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('password')) {
      context.handle(
        _passwordMeta,
        password.isAcceptableOrUnknown(data['password']!, _passwordMeta),
      );
    } else if (isInserting) {
      context.missing(_passwordMeta);
    }
    if (data.containsKey('role')) {
      context.handle(
        _roleMeta,
        role.isAcceptableOrUnknown(data['role']!, _roleMeta),
      );
    } else if (isInserting) {
      context.missing(_roleMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('lastname')) {
      context.handle(
        _lastnameMeta,
        lastname.isAcceptableOrUnknown(data['lastname']!, _lastnameMeta),
      );
    } else if (isInserting) {
      context.missing(_lastnameMeta);
    }
    if (data.containsKey('phone')) {
      context.handle(
        _phoneMeta,
        phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {username},
    {email},
  ];
  @override
  User map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return User(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      username: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}username'],
      )!,
      email: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}email'],
      )!,
      password: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}password'],
      )!,
      role: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}role'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      lastname: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}lastname'],
      )!,
      phone: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}phone'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
    );
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(attachedDatabase, alias);
  }
}

class User extends DataClass implements Insertable<User> {
  final int id;
  final String username;
  final String email;
  final String password;
  final String role;
  final String name;
  final String lastname;
  final String? phone;
  final DateTime createdAt;
  final DateTime? deletedAt;
  const User({
    required this.id,
    required this.username,
    required this.email,
    required this.password,
    required this.role,
    required this.name,
    required this.lastname,
    this.phone,
    required this.createdAt,
    this.deletedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['username'] = Variable<String>(username);
    map['email'] = Variable<String>(email);
    map['password'] = Variable<String>(password);
    map['role'] = Variable<String>(role);
    map['name'] = Variable<String>(name);
    map['lastname'] = Variable<String>(lastname);
    if (!nullToAbsent || phone != null) {
      map['phone'] = Variable<String>(phone);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      id: Value(id),
      username: Value(username),
      email: Value(email),
      password: Value(password),
      role: Value(role),
      name: Value(name),
      lastname: Value(lastname),
      phone: phone == null && nullToAbsent
          ? const Value.absent()
          : Value(phone),
      createdAt: Value(createdAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory User.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return User(
      id: serializer.fromJson<int>(json['id']),
      username: serializer.fromJson<String>(json['username']),
      email: serializer.fromJson<String>(json['email']),
      password: serializer.fromJson<String>(json['password']),
      role: serializer.fromJson<String>(json['role']),
      name: serializer.fromJson<String>(json['name']),
      lastname: serializer.fromJson<String>(json['lastname']),
      phone: serializer.fromJson<String?>(json['phone']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'username': serializer.toJson<String>(username),
      'email': serializer.toJson<String>(email),
      'password': serializer.toJson<String>(password),
      'role': serializer.toJson<String>(role),
      'name': serializer.toJson<String>(name),
      'lastname': serializer.toJson<String>(lastname),
      'phone': serializer.toJson<String?>(phone),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
    };
  }

  User copyWith({
    int? id,
    String? username,
    String? email,
    String? password,
    String? role,
    String? name,
    String? lastname,
    Value<String?> phone = const Value.absent(),
    DateTime? createdAt,
    Value<DateTime?> deletedAt = const Value.absent(),
  }) => User(
    id: id ?? this.id,
    username: username ?? this.username,
    email: email ?? this.email,
    password: password ?? this.password,
    role: role ?? this.role,
    name: name ?? this.name,
    lastname: lastname ?? this.lastname,
    phone: phone.present ? phone.value : this.phone,
    createdAt: createdAt ?? this.createdAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
  );
  User copyWithCompanion(UsersCompanion data) {
    return User(
      id: data.id.present ? data.id.value : this.id,
      username: data.username.present ? data.username.value : this.username,
      email: data.email.present ? data.email.value : this.email,
      password: data.password.present ? data.password.value : this.password,
      role: data.role.present ? data.role.value : this.role,
      name: data.name.present ? data.name.value : this.name,
      lastname: data.lastname.present ? data.lastname.value : this.lastname,
      phone: data.phone.present ? data.phone.value : this.phone,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('User(')
          ..write('id: $id, ')
          ..write('username: $username, ')
          ..write('email: $email, ')
          ..write('password: $password, ')
          ..write('role: $role, ')
          ..write('name: $name, ')
          ..write('lastname: $lastname, ')
          ..write('phone: $phone, ')
          ..write('createdAt: $createdAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    username,
    email,
    password,
    role,
    name,
    lastname,
    phone,
    createdAt,
    deletedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          other.id == this.id &&
          other.username == this.username &&
          other.email == this.email &&
          other.password == this.password &&
          other.role == this.role &&
          other.name == this.name &&
          other.lastname == this.lastname &&
          other.phone == this.phone &&
          other.createdAt == this.createdAt &&
          other.deletedAt == this.deletedAt);
}

class UsersCompanion extends UpdateCompanion<User> {
  final Value<int> id;
  final Value<String> username;
  final Value<String> email;
  final Value<String> password;
  final Value<String> role;
  final Value<String> name;
  final Value<String> lastname;
  final Value<String?> phone;
  final Value<DateTime> createdAt;
  final Value<DateTime?> deletedAt;
  const UsersCompanion({
    this.id = const Value.absent(),
    this.username = const Value.absent(),
    this.email = const Value.absent(),
    this.password = const Value.absent(),
    this.role = const Value.absent(),
    this.name = const Value.absent(),
    this.lastname = const Value.absent(),
    this.phone = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
  });
  UsersCompanion.insert({
    this.id = const Value.absent(),
    required String username,
    required String email,
    required String password,
    required String role,
    required String name,
    required String lastname,
    this.phone = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
  }) : username = Value(username),
       email = Value(email),
       password = Value(password),
       role = Value(role),
       name = Value(name),
       lastname = Value(lastname);
  static Insertable<User> custom({
    Expression<int>? id,
    Expression<String>? username,
    Expression<String>? email,
    Expression<String>? password,
    Expression<String>? role,
    Expression<String>? name,
    Expression<String>? lastname,
    Expression<String>? phone,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? deletedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (username != null) 'username': username,
      if (email != null) 'email': email,
      if (password != null) 'password': password,
      if (role != null) 'role': role,
      if (name != null) 'name': name,
      if (lastname != null) 'lastname': lastname,
      if (phone != null) 'phone': phone,
      if (createdAt != null) 'created_at': createdAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
    });
  }

  UsersCompanion copyWith({
    Value<int>? id,
    Value<String>? username,
    Value<String>? email,
    Value<String>? password,
    Value<String>? role,
    Value<String>? name,
    Value<String>? lastname,
    Value<String?>? phone,
    Value<DateTime>? createdAt,
    Value<DateTime?>? deletedAt,
  }) {
    return UsersCompanion(
      id: id ?? this.id,
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
      role: role ?? this.role,
      name: name ?? this.name,
      lastname: lastname ?? this.lastname,
      phone: phone ?? this.phone,
      createdAt: createdAt ?? this.createdAt,
      deletedAt: deletedAt ?? this.deletedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (username.present) {
      map['username'] = Variable<String>(username.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (password.present) {
      map['password'] = Variable<String>(password.value);
    }
    if (role.present) {
      map['role'] = Variable<String>(role.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (lastname.present) {
      map['lastname'] = Variable<String>(lastname.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersCompanion(')
          ..write('id: $id, ')
          ..write('username: $username, ')
          ..write('email: $email, ')
          ..write('password: $password, ')
          ..write('role: $role, ')
          ..write('name: $name, ')
          ..write('lastname: $lastname, ')
          ..write('phone: $phone, ')
          ..write('createdAt: $createdAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }
}

class $ClassesTable extends Classes with TableInfo<$ClassesTable, ClassesData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ClassesTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _teacherUserIdMeta = const VerificationMeta(
    'teacherUserId',
  );
  @override
  late final GeneratedColumn<int> teacherUserId = GeneratedColumn<int>(
    'teacher_user_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES users (id)',
    ),
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
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _capacityMeta = const VerificationMeta(
    'capacity',
  );
  @override
  late final GeneratedColumn<int> capacity = GeneratedColumn<int>(
    'capacity',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _enrollmentOpenMeta = const VerificationMeta(
    'enrollmentOpen',
  );
  @override
  late final GeneratedColumn<bool> enrollmentOpen = GeneratedColumn<bool>(
    'enrollment_open',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("enrollment_open" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _startDateMeta = const VerificationMeta(
    'startDate',
  );
  @override
  late final GeneratedColumn<DateTime> startDate = GeneratedColumn<DateTime>(
    'start_date',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _endDateMeta = const VerificationMeta(
    'endDate',
  );
  @override
  late final GeneratedColumn<DateTime> endDate = GeneratedColumn<DateTime>(
    'end_date',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
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
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _deletedAtMeta = const VerificationMeta(
    'deletedAt',
  );
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
    'deleted_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    teacherUserId,
    name,
    description,
    capacity,
    enrollmentOpen,
    startDate,
    endDate,
    createdAt,
    deletedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'classes';
  @override
  VerificationContext validateIntegrity(
    Insertable<ClassesData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('teacher_user_id')) {
      context.handle(
        _teacherUserIdMeta,
        teacherUserId.isAcceptableOrUnknown(
          data['teacher_user_id']!,
          _teacherUserIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_teacherUserIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('capacity')) {
      context.handle(
        _capacityMeta,
        capacity.isAcceptableOrUnknown(data['capacity']!, _capacityMeta),
      );
    } else if (isInserting) {
      context.missing(_capacityMeta);
    }
    if (data.containsKey('enrollment_open')) {
      context.handle(
        _enrollmentOpenMeta,
        enrollmentOpen.isAcceptableOrUnknown(
          data['enrollment_open']!,
          _enrollmentOpenMeta,
        ),
      );
    }
    if (data.containsKey('start_date')) {
      context.handle(
        _startDateMeta,
        startDate.isAcceptableOrUnknown(data['start_date']!, _startDateMeta),
      );
    }
    if (data.containsKey('end_date')) {
      context.handle(
        _endDateMeta,
        endDate.isAcceptableOrUnknown(data['end_date']!, _endDateMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('deleted_at')) {
      context.handle(
        _deletedAtMeta,
        deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ClassesData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ClassesData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      teacherUserId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}teacher_user_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      capacity: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}capacity'],
      )!,
      enrollmentOpen: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}enrollment_open'],
      )!,
      startDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}start_date'],
      ),
      endDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}end_date'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      deletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deleted_at'],
      ),
    );
  }

  @override
  $ClassesTable createAlias(String alias) {
    return $ClassesTable(attachedDatabase, alias);
  }
}

class ClassesData extends DataClass implements Insertable<ClassesData> {
  final int id;
  final int teacherUserId;
  final String name;
  final String? description;
  final int capacity;
  final bool enrollmentOpen;
  final DateTime? startDate;
  final DateTime? endDate;
  final DateTime createdAt;
  final DateTime? deletedAt;
  const ClassesData({
    required this.id,
    required this.teacherUserId,
    required this.name,
    this.description,
    required this.capacity,
    required this.enrollmentOpen,
    this.startDate,
    this.endDate,
    required this.createdAt,
    this.deletedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['teacher_user_id'] = Variable<int>(teacherUserId);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['capacity'] = Variable<int>(capacity);
    map['enrollment_open'] = Variable<bool>(enrollmentOpen);
    if (!nullToAbsent || startDate != null) {
      map['start_date'] = Variable<DateTime>(startDate);
    }
    if (!nullToAbsent || endDate != null) {
      map['end_date'] = Variable<DateTime>(endDate);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    return map;
  }

  ClassesCompanion toCompanion(bool nullToAbsent) {
    return ClassesCompanion(
      id: Value(id),
      teacherUserId: Value(teacherUserId),
      name: Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      capacity: Value(capacity),
      enrollmentOpen: Value(enrollmentOpen),
      startDate: startDate == null && nullToAbsent
          ? const Value.absent()
          : Value(startDate),
      endDate: endDate == null && nullToAbsent
          ? const Value.absent()
          : Value(endDate),
      createdAt: Value(createdAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory ClassesData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ClassesData(
      id: serializer.fromJson<int>(json['id']),
      teacherUserId: serializer.fromJson<int>(json['teacherUserId']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
      capacity: serializer.fromJson<int>(json['capacity']),
      enrollmentOpen: serializer.fromJson<bool>(json['enrollmentOpen']),
      startDate: serializer.fromJson<DateTime?>(json['startDate']),
      endDate: serializer.fromJson<DateTime?>(json['endDate']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'teacherUserId': serializer.toJson<int>(teacherUserId),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
      'capacity': serializer.toJson<int>(capacity),
      'enrollmentOpen': serializer.toJson<bool>(enrollmentOpen),
      'startDate': serializer.toJson<DateTime?>(startDate),
      'endDate': serializer.toJson<DateTime?>(endDate),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
    };
  }

  ClassesData copyWith({
    int? id,
    int? teacherUserId,
    String? name,
    Value<String?> description = const Value.absent(),
    int? capacity,
    bool? enrollmentOpen,
    Value<DateTime?> startDate = const Value.absent(),
    Value<DateTime?> endDate = const Value.absent(),
    DateTime? createdAt,
    Value<DateTime?> deletedAt = const Value.absent(),
  }) => ClassesData(
    id: id ?? this.id,
    teacherUserId: teacherUserId ?? this.teacherUserId,
    name: name ?? this.name,
    description: description.present ? description.value : this.description,
    capacity: capacity ?? this.capacity,
    enrollmentOpen: enrollmentOpen ?? this.enrollmentOpen,
    startDate: startDate.present ? startDate.value : this.startDate,
    endDate: endDate.present ? endDate.value : this.endDate,
    createdAt: createdAt ?? this.createdAt,
    deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
  );
  ClassesData copyWithCompanion(ClassesCompanion data) {
    return ClassesData(
      id: data.id.present ? data.id.value : this.id,
      teacherUserId: data.teacherUserId.present
          ? data.teacherUserId.value
          : this.teacherUserId,
      name: data.name.present ? data.name.value : this.name,
      description: data.description.present
          ? data.description.value
          : this.description,
      capacity: data.capacity.present ? data.capacity.value : this.capacity,
      enrollmentOpen: data.enrollmentOpen.present
          ? data.enrollmentOpen.value
          : this.enrollmentOpen,
      startDate: data.startDate.present ? data.startDate.value : this.startDate,
      endDate: data.endDate.present ? data.endDate.value : this.endDate,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ClassesData(')
          ..write('id: $id, ')
          ..write('teacherUserId: $teacherUserId, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('capacity: $capacity, ')
          ..write('enrollmentOpen: $enrollmentOpen, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('createdAt: $createdAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    teacherUserId,
    name,
    description,
    capacity,
    enrollmentOpen,
    startDate,
    endDate,
    createdAt,
    deletedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ClassesData &&
          other.id == this.id &&
          other.teacherUserId == this.teacherUserId &&
          other.name == this.name &&
          other.description == this.description &&
          other.capacity == this.capacity &&
          other.enrollmentOpen == this.enrollmentOpen &&
          other.startDate == this.startDate &&
          other.endDate == this.endDate &&
          other.createdAt == this.createdAt &&
          other.deletedAt == this.deletedAt);
}

class ClassesCompanion extends UpdateCompanion<ClassesData> {
  final Value<int> id;
  final Value<int> teacherUserId;
  final Value<String> name;
  final Value<String?> description;
  final Value<int> capacity;
  final Value<bool> enrollmentOpen;
  final Value<DateTime?> startDate;
  final Value<DateTime?> endDate;
  final Value<DateTime> createdAt;
  final Value<DateTime?> deletedAt;
  const ClassesCompanion({
    this.id = const Value.absent(),
    this.teacherUserId = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.capacity = const Value.absent(),
    this.enrollmentOpen = const Value.absent(),
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
  });
  ClassesCompanion.insert({
    this.id = const Value.absent(),
    required int teacherUserId,
    required String name,
    this.description = const Value.absent(),
    required int capacity,
    this.enrollmentOpen = const Value.absent(),
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
  }) : teacherUserId = Value(teacherUserId),
       name = Value(name),
       capacity = Value(capacity);
  static Insertable<ClassesData> custom({
    Expression<int>? id,
    Expression<int>? teacherUserId,
    Expression<String>? name,
    Expression<String>? description,
    Expression<int>? capacity,
    Expression<bool>? enrollmentOpen,
    Expression<DateTime>? startDate,
    Expression<DateTime>? endDate,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? deletedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (teacherUserId != null) 'teacher_user_id': teacherUserId,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (capacity != null) 'capacity': capacity,
      if (enrollmentOpen != null) 'enrollment_open': enrollmentOpen,
      if (startDate != null) 'start_date': startDate,
      if (endDate != null) 'end_date': endDate,
      if (createdAt != null) 'created_at': createdAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
    });
  }

  ClassesCompanion copyWith({
    Value<int>? id,
    Value<int>? teacherUserId,
    Value<String>? name,
    Value<String?>? description,
    Value<int>? capacity,
    Value<bool>? enrollmentOpen,
    Value<DateTime?>? startDate,
    Value<DateTime?>? endDate,
    Value<DateTime>? createdAt,
    Value<DateTime?>? deletedAt,
  }) {
    return ClassesCompanion(
      id: id ?? this.id,
      teacherUserId: teacherUserId ?? this.teacherUserId,
      name: name ?? this.name,
      description: description ?? this.description,
      capacity: capacity ?? this.capacity,
      enrollmentOpen: enrollmentOpen ?? this.enrollmentOpen,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      createdAt: createdAt ?? this.createdAt,
      deletedAt: deletedAt ?? this.deletedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (teacherUserId.present) {
      map['teacher_user_id'] = Variable<int>(teacherUserId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (capacity.present) {
      map['capacity'] = Variable<int>(capacity.value);
    }
    if (enrollmentOpen.present) {
      map['enrollment_open'] = Variable<bool>(enrollmentOpen.value);
    }
    if (startDate.present) {
      map['start_date'] = Variable<DateTime>(startDate.value);
    }
    if (endDate.present) {
      map['end_date'] = Variable<DateTime>(endDate.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ClassesCompanion(')
          ..write('id: $id, ')
          ..write('teacherUserId: $teacherUserId, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('capacity: $capacity, ')
          ..write('enrollmentOpen: $enrollmentOpen, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('createdAt: $createdAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }
}

class $EnrollmentsTable extends Enrollments
    with TableInfo<$EnrollmentsTable, Enrollment> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EnrollmentsTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _studentUserIdMeta = const VerificationMeta(
    'studentUserId',
  );
  @override
  late final GeneratedColumn<int> studentUserId = GeneratedColumn<int>(
    'student_user_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES users (id)',
    ),
  );
  static const VerificationMeta _classIdMeta = const VerificationMeta(
    'classId',
  );
  @override
  late final GeneratedColumn<int> classId = GeneratedColumn<int>(
    'class_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES classes (id)',
    ),
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
  static const VerificationMeta _enrolledAtMeta = const VerificationMeta(
    'enrolledAt',
  );
  @override
  late final GeneratedColumn<DateTime> enrolledAt = GeneratedColumn<DateTime>(
    'enrolled_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _droppedAtMeta = const VerificationMeta(
    'droppedAt',
  );
  @override
  late final GeneratedColumn<DateTime> droppedAt = GeneratedColumn<DateTime>(
    'dropped_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
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
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    studentUserId,
    classId,
    status,
    enrolledAt,
    droppedAt,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'enrollments';
  @override
  VerificationContext validateIntegrity(
    Insertable<Enrollment> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('student_user_id')) {
      context.handle(
        _studentUserIdMeta,
        studentUserId.isAcceptableOrUnknown(
          data['student_user_id']!,
          _studentUserIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_studentUserIdMeta);
    }
    if (data.containsKey('class_id')) {
      context.handle(
        _classIdMeta,
        classId.isAcceptableOrUnknown(data['class_id']!, _classIdMeta),
      );
    } else if (isInserting) {
      context.missing(_classIdMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('enrolled_at')) {
      context.handle(
        _enrolledAtMeta,
        enrolledAt.isAcceptableOrUnknown(data['enrolled_at']!, _enrolledAtMeta),
      );
    }
    if (data.containsKey('dropped_at')) {
      context.handle(
        _droppedAtMeta,
        droppedAt.isAcceptableOrUnknown(data['dropped_at']!, _droppedAtMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {studentUserId, classId},
  ];
  @override
  Enrollment map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Enrollment(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      studentUserId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}student_user_id'],
      )!,
      classId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}class_id'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      enrolledAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}enrolled_at'],
      ),
      droppedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}dropped_at'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $EnrollmentsTable createAlias(String alias) {
    return $EnrollmentsTable(attachedDatabase, alias);
  }
}

class Enrollment extends DataClass implements Insertable<Enrollment> {
  final int id;
  final int studentUserId;
  final int classId;
  final String status;
  final DateTime? enrolledAt;
  final DateTime? droppedAt;
  final DateTime createdAt;
  const Enrollment({
    required this.id,
    required this.studentUserId,
    required this.classId,
    required this.status,
    this.enrolledAt,
    this.droppedAt,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['student_user_id'] = Variable<int>(studentUserId);
    map['class_id'] = Variable<int>(classId);
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || enrolledAt != null) {
      map['enrolled_at'] = Variable<DateTime>(enrolledAt);
    }
    if (!nullToAbsent || droppedAt != null) {
      map['dropped_at'] = Variable<DateTime>(droppedAt);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  EnrollmentsCompanion toCompanion(bool nullToAbsent) {
    return EnrollmentsCompanion(
      id: Value(id),
      studentUserId: Value(studentUserId),
      classId: Value(classId),
      status: Value(status),
      enrolledAt: enrolledAt == null && nullToAbsent
          ? const Value.absent()
          : Value(enrolledAt),
      droppedAt: droppedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(droppedAt),
      createdAt: Value(createdAt),
    );
  }

  factory Enrollment.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Enrollment(
      id: serializer.fromJson<int>(json['id']),
      studentUserId: serializer.fromJson<int>(json['studentUserId']),
      classId: serializer.fromJson<int>(json['classId']),
      status: serializer.fromJson<String>(json['status']),
      enrolledAt: serializer.fromJson<DateTime?>(json['enrolledAt']),
      droppedAt: serializer.fromJson<DateTime?>(json['droppedAt']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'studentUserId': serializer.toJson<int>(studentUserId),
      'classId': serializer.toJson<int>(classId),
      'status': serializer.toJson<String>(status),
      'enrolledAt': serializer.toJson<DateTime?>(enrolledAt),
      'droppedAt': serializer.toJson<DateTime?>(droppedAt),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  Enrollment copyWith({
    int? id,
    int? studentUserId,
    int? classId,
    String? status,
    Value<DateTime?> enrolledAt = const Value.absent(),
    Value<DateTime?> droppedAt = const Value.absent(),
    DateTime? createdAt,
  }) => Enrollment(
    id: id ?? this.id,
    studentUserId: studentUserId ?? this.studentUserId,
    classId: classId ?? this.classId,
    status: status ?? this.status,
    enrolledAt: enrolledAt.present ? enrolledAt.value : this.enrolledAt,
    droppedAt: droppedAt.present ? droppedAt.value : this.droppedAt,
    createdAt: createdAt ?? this.createdAt,
  );
  Enrollment copyWithCompanion(EnrollmentsCompanion data) {
    return Enrollment(
      id: data.id.present ? data.id.value : this.id,
      studentUserId: data.studentUserId.present
          ? data.studentUserId.value
          : this.studentUserId,
      classId: data.classId.present ? data.classId.value : this.classId,
      status: data.status.present ? data.status.value : this.status,
      enrolledAt: data.enrolledAt.present
          ? data.enrolledAt.value
          : this.enrolledAt,
      droppedAt: data.droppedAt.present ? data.droppedAt.value : this.droppedAt,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Enrollment(')
          ..write('id: $id, ')
          ..write('studentUserId: $studentUserId, ')
          ..write('classId: $classId, ')
          ..write('status: $status, ')
          ..write('enrolledAt: $enrolledAt, ')
          ..write('droppedAt: $droppedAt, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    studentUserId,
    classId,
    status,
    enrolledAt,
    droppedAt,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Enrollment &&
          other.id == this.id &&
          other.studentUserId == this.studentUserId &&
          other.classId == this.classId &&
          other.status == this.status &&
          other.enrolledAt == this.enrolledAt &&
          other.droppedAt == this.droppedAt &&
          other.createdAt == this.createdAt);
}

class EnrollmentsCompanion extends UpdateCompanion<Enrollment> {
  final Value<int> id;
  final Value<int> studentUserId;
  final Value<int> classId;
  final Value<String> status;
  final Value<DateTime?> enrolledAt;
  final Value<DateTime?> droppedAt;
  final Value<DateTime> createdAt;
  const EnrollmentsCompanion({
    this.id = const Value.absent(),
    this.studentUserId = const Value.absent(),
    this.classId = const Value.absent(),
    this.status = const Value.absent(),
    this.enrolledAt = const Value.absent(),
    this.droppedAt = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  EnrollmentsCompanion.insert({
    this.id = const Value.absent(),
    required int studentUserId,
    required int classId,
    required String status,
    this.enrolledAt = const Value.absent(),
    this.droppedAt = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : studentUserId = Value(studentUserId),
       classId = Value(classId),
       status = Value(status);
  static Insertable<Enrollment> custom({
    Expression<int>? id,
    Expression<int>? studentUserId,
    Expression<int>? classId,
    Expression<String>? status,
    Expression<DateTime>? enrolledAt,
    Expression<DateTime>? droppedAt,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (studentUserId != null) 'student_user_id': studentUserId,
      if (classId != null) 'class_id': classId,
      if (status != null) 'status': status,
      if (enrolledAt != null) 'enrolled_at': enrolledAt,
      if (droppedAt != null) 'dropped_at': droppedAt,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  EnrollmentsCompanion copyWith({
    Value<int>? id,
    Value<int>? studentUserId,
    Value<int>? classId,
    Value<String>? status,
    Value<DateTime?>? enrolledAt,
    Value<DateTime?>? droppedAt,
    Value<DateTime>? createdAt,
  }) {
    return EnrollmentsCompanion(
      id: id ?? this.id,
      studentUserId: studentUserId ?? this.studentUserId,
      classId: classId ?? this.classId,
      status: status ?? this.status,
      enrolledAt: enrolledAt ?? this.enrolledAt,
      droppedAt: droppedAt ?? this.droppedAt,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (studentUserId.present) {
      map['student_user_id'] = Variable<int>(studentUserId.value);
    }
    if (classId.present) {
      map['class_id'] = Variable<int>(classId.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (enrolledAt.present) {
      map['enrolled_at'] = Variable<DateTime>(enrolledAt.value);
    }
    if (droppedAt.present) {
      map['dropped_at'] = Variable<DateTime>(droppedAt.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EnrollmentsCompanion(')
          ..write('id: $id, ')
          ..write('studentUserId: $studentUserId, ')
          ..write('classId: $classId, ')
          ..write('status: $status, ')
          ..write('enrolledAt: $enrolledAt, ')
          ..write('droppedAt: $droppedAt, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $ClassSessionsTable extends ClassSessions
    with TableInfo<$ClassSessionsTable, ClassSession> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ClassSessionsTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _classIdMeta = const VerificationMeta(
    'classId',
  );
  @override
  late final GeneratedColumn<int> classId = GeneratedColumn<int>(
    'class_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES classes (id)',
    ),
  );
  static const VerificationMeta _sessionAtMeta = const VerificationMeta(
    'sessionAt',
  );
  @override
  late final GeneratedColumn<DateTime> sessionAt = GeneratedColumn<DateTime>(
    'session_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
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
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [id, classId, sessionAt, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'class_sessions';
  @override
  VerificationContext validateIntegrity(
    Insertable<ClassSession> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('class_id')) {
      context.handle(
        _classIdMeta,
        classId.isAcceptableOrUnknown(data['class_id']!, _classIdMeta),
      );
    } else if (isInserting) {
      context.missing(_classIdMeta);
    }
    if (data.containsKey('session_at')) {
      context.handle(
        _sessionAtMeta,
        sessionAt.isAcceptableOrUnknown(data['session_at']!, _sessionAtMeta),
      );
    } else if (isInserting) {
      context.missing(_sessionAtMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {classId, sessionAt},
  ];
  @override
  ClassSession map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ClassSession(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      classId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}class_id'],
      )!,
      sessionAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}session_at'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $ClassSessionsTable createAlias(String alias) {
    return $ClassSessionsTable(attachedDatabase, alias);
  }
}

class ClassSession extends DataClass implements Insertable<ClassSession> {
  final int id;
  final int classId;
  final DateTime sessionAt;
  final DateTime createdAt;
  const ClassSession({
    required this.id,
    required this.classId,
    required this.sessionAt,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['class_id'] = Variable<int>(classId);
    map['session_at'] = Variable<DateTime>(sessionAt);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  ClassSessionsCompanion toCompanion(bool nullToAbsent) {
    return ClassSessionsCompanion(
      id: Value(id),
      classId: Value(classId),
      sessionAt: Value(sessionAt),
      createdAt: Value(createdAt),
    );
  }

  factory ClassSession.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ClassSession(
      id: serializer.fromJson<int>(json['id']),
      classId: serializer.fromJson<int>(json['classId']),
      sessionAt: serializer.fromJson<DateTime>(json['sessionAt']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'classId': serializer.toJson<int>(classId),
      'sessionAt': serializer.toJson<DateTime>(sessionAt),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  ClassSession copyWith({
    int? id,
    int? classId,
    DateTime? sessionAt,
    DateTime? createdAt,
  }) => ClassSession(
    id: id ?? this.id,
    classId: classId ?? this.classId,
    sessionAt: sessionAt ?? this.sessionAt,
    createdAt: createdAt ?? this.createdAt,
  );
  ClassSession copyWithCompanion(ClassSessionsCompanion data) {
    return ClassSession(
      id: data.id.present ? data.id.value : this.id,
      classId: data.classId.present ? data.classId.value : this.classId,
      sessionAt: data.sessionAt.present ? data.sessionAt.value : this.sessionAt,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ClassSession(')
          ..write('id: $id, ')
          ..write('classId: $classId, ')
          ..write('sessionAt: $sessionAt, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, classId, sessionAt, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ClassSession &&
          other.id == this.id &&
          other.classId == this.classId &&
          other.sessionAt == this.sessionAt &&
          other.createdAt == this.createdAt);
}

class ClassSessionsCompanion extends UpdateCompanion<ClassSession> {
  final Value<int> id;
  final Value<int> classId;
  final Value<DateTime> sessionAt;
  final Value<DateTime> createdAt;
  const ClassSessionsCompanion({
    this.id = const Value.absent(),
    this.classId = const Value.absent(),
    this.sessionAt = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  ClassSessionsCompanion.insert({
    this.id = const Value.absent(),
    required int classId,
    required DateTime sessionAt,
    this.createdAt = const Value.absent(),
  }) : classId = Value(classId),
       sessionAt = Value(sessionAt);
  static Insertable<ClassSession> custom({
    Expression<int>? id,
    Expression<int>? classId,
    Expression<DateTime>? sessionAt,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (classId != null) 'class_id': classId,
      if (sessionAt != null) 'session_at': sessionAt,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  ClassSessionsCompanion copyWith({
    Value<int>? id,
    Value<int>? classId,
    Value<DateTime>? sessionAt,
    Value<DateTime>? createdAt,
  }) {
    return ClassSessionsCompanion(
      id: id ?? this.id,
      classId: classId ?? this.classId,
      sessionAt: sessionAt ?? this.sessionAt,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (classId.present) {
      map['class_id'] = Variable<int>(classId.value);
    }
    if (sessionAt.present) {
      map['session_at'] = Variable<DateTime>(sessionAt.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ClassSessionsCompanion(')
          ..write('id: $id, ')
          ..write('classId: $classId, ')
          ..write('sessionAt: $sessionAt, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $AttendanceTable extends Attendance
    with TableInfo<$AttendanceTable, AttendanceData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AttendanceTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _enrollmentIdMeta = const VerificationMeta(
    'enrollmentId',
  );
  @override
  late final GeneratedColumn<int> enrollmentId = GeneratedColumn<int>(
    'enrollment_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES enrollments (id)',
    ),
  );
  static const VerificationMeta _sessionIdMeta = const VerificationMeta(
    'sessionId',
  );
  @override
  late final GeneratedColumn<int> sessionId = GeneratedColumn<int>(
    'session_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES class_sessions (id)',
    ),
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
  static const VerificationMeta _checkInAtMeta = const VerificationMeta(
    'checkInAt',
  );
  @override
  late final GeneratedColumn<DateTime> checkInAt = GeneratedColumn<DateTime>(
    'check_in_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
    'note',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
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
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    enrollmentId,
    sessionId,
    status,
    checkInAt,
    note,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'attendance';
  @override
  VerificationContext validateIntegrity(
    Insertable<AttendanceData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('enrollment_id')) {
      context.handle(
        _enrollmentIdMeta,
        enrollmentId.isAcceptableOrUnknown(
          data['enrollment_id']!,
          _enrollmentIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_enrollmentIdMeta);
    }
    if (data.containsKey('session_id')) {
      context.handle(
        _sessionIdMeta,
        sessionId.isAcceptableOrUnknown(data['session_id']!, _sessionIdMeta),
      );
    } else if (isInserting) {
      context.missing(_sessionIdMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('check_in_at')) {
      context.handle(
        _checkInAtMeta,
        checkInAt.isAcceptableOrUnknown(data['check_in_at']!, _checkInAtMeta),
      );
    }
    if (data.containsKey('note')) {
      context.handle(
        _noteMeta,
        note.isAcceptableOrUnknown(data['note']!, _noteMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {enrollmentId, sessionId},
  ];
  @override
  AttendanceData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AttendanceData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      enrollmentId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}enrollment_id'],
      )!,
      sessionId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}session_id'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      checkInAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}check_in_at'],
      ),
      note: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}note'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $AttendanceTable createAlias(String alias) {
    return $AttendanceTable(attachedDatabase, alias);
  }
}

class AttendanceData extends DataClass implements Insertable<AttendanceData> {
  final int id;
  final int enrollmentId;
  final int sessionId;
  final String status;
  final DateTime? checkInAt;
  final String? note;
  final DateTime createdAt;
  const AttendanceData({
    required this.id,
    required this.enrollmentId,
    required this.sessionId,
    required this.status,
    this.checkInAt,
    this.note,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['enrollment_id'] = Variable<int>(enrollmentId);
    map['session_id'] = Variable<int>(sessionId);
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || checkInAt != null) {
      map['check_in_at'] = Variable<DateTime>(checkInAt);
    }
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  AttendanceCompanion toCompanion(bool nullToAbsent) {
    return AttendanceCompanion(
      id: Value(id),
      enrollmentId: Value(enrollmentId),
      sessionId: Value(sessionId),
      status: Value(status),
      checkInAt: checkInAt == null && nullToAbsent
          ? const Value.absent()
          : Value(checkInAt),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
      createdAt: Value(createdAt),
    );
  }

  factory AttendanceData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AttendanceData(
      id: serializer.fromJson<int>(json['id']),
      enrollmentId: serializer.fromJson<int>(json['enrollmentId']),
      sessionId: serializer.fromJson<int>(json['sessionId']),
      status: serializer.fromJson<String>(json['status']),
      checkInAt: serializer.fromJson<DateTime?>(json['checkInAt']),
      note: serializer.fromJson<String?>(json['note']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'enrollmentId': serializer.toJson<int>(enrollmentId),
      'sessionId': serializer.toJson<int>(sessionId),
      'status': serializer.toJson<String>(status),
      'checkInAt': serializer.toJson<DateTime?>(checkInAt),
      'note': serializer.toJson<String?>(note),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  AttendanceData copyWith({
    int? id,
    int? enrollmentId,
    int? sessionId,
    String? status,
    Value<DateTime?> checkInAt = const Value.absent(),
    Value<String?> note = const Value.absent(),
    DateTime? createdAt,
  }) => AttendanceData(
    id: id ?? this.id,
    enrollmentId: enrollmentId ?? this.enrollmentId,
    sessionId: sessionId ?? this.sessionId,
    status: status ?? this.status,
    checkInAt: checkInAt.present ? checkInAt.value : this.checkInAt,
    note: note.present ? note.value : this.note,
    createdAt: createdAt ?? this.createdAt,
  );
  AttendanceData copyWithCompanion(AttendanceCompanion data) {
    return AttendanceData(
      id: data.id.present ? data.id.value : this.id,
      enrollmentId: data.enrollmentId.present
          ? data.enrollmentId.value
          : this.enrollmentId,
      sessionId: data.sessionId.present ? data.sessionId.value : this.sessionId,
      status: data.status.present ? data.status.value : this.status,
      checkInAt: data.checkInAt.present ? data.checkInAt.value : this.checkInAt,
      note: data.note.present ? data.note.value : this.note,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AttendanceData(')
          ..write('id: $id, ')
          ..write('enrollmentId: $enrollmentId, ')
          ..write('sessionId: $sessionId, ')
          ..write('status: $status, ')
          ..write('checkInAt: $checkInAt, ')
          ..write('note: $note, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    enrollmentId,
    sessionId,
    status,
    checkInAt,
    note,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AttendanceData &&
          other.id == this.id &&
          other.enrollmentId == this.enrollmentId &&
          other.sessionId == this.sessionId &&
          other.status == this.status &&
          other.checkInAt == this.checkInAt &&
          other.note == this.note &&
          other.createdAt == this.createdAt);
}

class AttendanceCompanion extends UpdateCompanion<AttendanceData> {
  final Value<int> id;
  final Value<int> enrollmentId;
  final Value<int> sessionId;
  final Value<String> status;
  final Value<DateTime?> checkInAt;
  final Value<String?> note;
  final Value<DateTime> createdAt;
  const AttendanceCompanion({
    this.id = const Value.absent(),
    this.enrollmentId = const Value.absent(),
    this.sessionId = const Value.absent(),
    this.status = const Value.absent(),
    this.checkInAt = const Value.absent(),
    this.note = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  AttendanceCompanion.insert({
    this.id = const Value.absent(),
    required int enrollmentId,
    required int sessionId,
    required String status,
    this.checkInAt = const Value.absent(),
    this.note = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : enrollmentId = Value(enrollmentId),
       sessionId = Value(sessionId),
       status = Value(status);
  static Insertable<AttendanceData> custom({
    Expression<int>? id,
    Expression<int>? enrollmentId,
    Expression<int>? sessionId,
    Expression<String>? status,
    Expression<DateTime>? checkInAt,
    Expression<String>? note,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (enrollmentId != null) 'enrollment_id': enrollmentId,
      if (sessionId != null) 'session_id': sessionId,
      if (status != null) 'status': status,
      if (checkInAt != null) 'check_in_at': checkInAt,
      if (note != null) 'note': note,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  AttendanceCompanion copyWith({
    Value<int>? id,
    Value<int>? enrollmentId,
    Value<int>? sessionId,
    Value<String>? status,
    Value<DateTime?>? checkInAt,
    Value<String?>? note,
    Value<DateTime>? createdAt,
  }) {
    return AttendanceCompanion(
      id: id ?? this.id,
      enrollmentId: enrollmentId ?? this.enrollmentId,
      sessionId: sessionId ?? this.sessionId,
      status: status ?? this.status,
      checkInAt: checkInAt ?? this.checkInAt,
      note: note ?? this.note,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (enrollmentId.present) {
      map['enrollment_id'] = Variable<int>(enrollmentId.value);
    }
    if (sessionId.present) {
      map['session_id'] = Variable<int>(sessionId.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (checkInAt.present) {
      map['check_in_at'] = Variable<DateTime>(checkInAt.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AttendanceCompanion(')
          ..write('id: $id, ')
          ..write('enrollmentId: $enrollmentId, ')
          ..write('sessionId: $sessionId, ')
          ..write('status: $status, ')
          ..write('checkInAt: $checkInAt, ')
          ..write('note: $note, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDb extends GeneratedDatabase {
  _$AppDb(QueryExecutor e) : super(e);
  $AppDbManager get managers => $AppDbManager(this);
  late final $UsersTable users = $UsersTable(this);
  late final $ClassesTable classes = $ClassesTable(this);
  late final $EnrollmentsTable enrollments = $EnrollmentsTable(this);
  late final $ClassSessionsTable classSessions = $ClassSessionsTable(this);
  late final $AttendanceTable attendance = $AttendanceTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    users,
    classes,
    enrollments,
    classSessions,
    attendance,
  ];
}

typedef $$UsersTableCreateCompanionBuilder =
    UsersCompanion Function({
      Value<int> id,
      required String username,
      required String email,
      required String password,
      required String role,
      required String name,
      required String lastname,
      Value<String?> phone,
      Value<DateTime> createdAt,
      Value<DateTime?> deletedAt,
    });
typedef $$UsersTableUpdateCompanionBuilder =
    UsersCompanion Function({
      Value<int> id,
      Value<String> username,
      Value<String> email,
      Value<String> password,
      Value<String> role,
      Value<String> name,
      Value<String> lastname,
      Value<String?> phone,
      Value<DateTime> createdAt,
      Value<DateTime?> deletedAt,
    });

final class $$UsersTableReferences
    extends BaseReferences<_$AppDb, $UsersTable, User> {
  $$UsersTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$ClassesTable, List<ClassesData>>
  _classesRefsTable(_$AppDb db) => MultiTypedResultKey.fromTable(
    db.classes,
    aliasName: $_aliasNameGenerator(db.users.id, db.classes.teacherUserId),
  );

  $$ClassesTableProcessedTableManager get classesRefs {
    final manager = $$ClassesTableTableManager(
      $_db,
      $_db.classes,
    ).filter((f) => f.teacherUserId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_classesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$EnrollmentsTable, List<Enrollment>>
  _enrollmentsRefsTable(_$AppDb db) => MultiTypedResultKey.fromTable(
    db.enrollments,
    aliasName: $_aliasNameGenerator(db.users.id, db.enrollments.studentUserId),
  );

  $$EnrollmentsTableProcessedTableManager get enrollmentsRefs {
    final manager = $$EnrollmentsTableTableManager(
      $_db,
      $_db.enrollments,
    ).filter((f) => f.studentUserId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_enrollmentsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$UsersTableFilterComposer extends Composer<_$AppDb, $UsersTable> {
  $$UsersTableFilterComposer({
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

  ColumnFilters<String> get username => $composableBuilder(
    column: $table.username,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get password => $composableBuilder(
    column: $table.password,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get role => $composableBuilder(
    column: $table.role,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lastname => $composableBuilder(
    column: $table.lastname,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> classesRefs(
    Expression<bool> Function($$ClassesTableFilterComposer f) f,
  ) {
    final $$ClassesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.classes,
      getReferencedColumn: (t) => t.teacherUserId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ClassesTableFilterComposer(
            $db: $db,
            $table: $db.classes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> enrollmentsRefs(
    Expression<bool> Function($$EnrollmentsTableFilterComposer f) f,
  ) {
    final $$EnrollmentsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.enrollments,
      getReferencedColumn: (t) => t.studentUserId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EnrollmentsTableFilterComposer(
            $db: $db,
            $table: $db.enrollments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$UsersTableOrderingComposer extends Composer<_$AppDb, $UsersTable> {
  $$UsersTableOrderingComposer({
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

  ColumnOrderings<String> get username => $composableBuilder(
    column: $table.username,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get password => $composableBuilder(
    column: $table.password,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get role => $composableBuilder(
    column: $table.role,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lastname => $composableBuilder(
    column: $table.lastname,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$UsersTableAnnotationComposer extends Composer<_$AppDb, $UsersTable> {
  $$UsersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get username =>
      $composableBuilder(column: $table.username, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get password =>
      $composableBuilder(column: $table.password, builder: (column) => column);

  GeneratedColumn<String> get role =>
      $composableBuilder(column: $table.role, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get lastname =>
      $composableBuilder(column: $table.lastname, builder: (column) => column);

  GeneratedColumn<String> get phone =>
      $composableBuilder(column: $table.phone, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  Expression<T> classesRefs<T extends Object>(
    Expression<T> Function($$ClassesTableAnnotationComposer a) f,
  ) {
    final $$ClassesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.classes,
      getReferencedColumn: (t) => t.teacherUserId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ClassesTableAnnotationComposer(
            $db: $db,
            $table: $db.classes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> enrollmentsRefs<T extends Object>(
    Expression<T> Function($$EnrollmentsTableAnnotationComposer a) f,
  ) {
    final $$EnrollmentsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.enrollments,
      getReferencedColumn: (t) => t.studentUserId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EnrollmentsTableAnnotationComposer(
            $db: $db,
            $table: $db.enrollments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$UsersTableTableManager
    extends
        RootTableManager<
          _$AppDb,
          $UsersTable,
          User,
          $$UsersTableFilterComposer,
          $$UsersTableOrderingComposer,
          $$UsersTableAnnotationComposer,
          $$UsersTableCreateCompanionBuilder,
          $$UsersTableUpdateCompanionBuilder,
          (User, $$UsersTableReferences),
          User,
          PrefetchHooks Function({bool classesRefs, bool enrollmentsRefs})
        > {
  $$UsersTableTableManager(_$AppDb db, $UsersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UsersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UsersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UsersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> username = const Value.absent(),
                Value<String> email = const Value.absent(),
                Value<String> password = const Value.absent(),
                Value<String> role = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> lastname = const Value.absent(),
                Value<String?> phone = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
              }) => UsersCompanion(
                id: id,
                username: username,
                email: email,
                password: password,
                role: role,
                name: name,
                lastname: lastname,
                phone: phone,
                createdAt: createdAt,
                deletedAt: deletedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String username,
                required String email,
                required String password,
                required String role,
                required String name,
                required String lastname,
                Value<String?> phone = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
              }) => UsersCompanion.insert(
                id: id,
                username: username,
                email: email,
                password: password,
                role: role,
                name: name,
                lastname: lastname,
                phone: phone,
                createdAt: createdAt,
                deletedAt: deletedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$UsersTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback:
              ({classesRefs = false, enrollmentsRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (classesRefs) db.classes,
                    if (enrollmentsRefs) db.enrollments,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (classesRefs)
                        await $_getPrefetchedData<
                          User,
                          $UsersTable,
                          ClassesData
                        >(
                          currentTable: table,
                          referencedTable: $$UsersTableReferences
                              ._classesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UsersTableReferences(db, table, p0).classesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.teacherUserId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (enrollmentsRefs)
                        await $_getPrefetchedData<
                          User,
                          $UsersTable,
                          Enrollment
                        >(
                          currentTable: table,
                          referencedTable: $$UsersTableReferences
                              ._enrollmentsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UsersTableReferences(
                                db,
                                table,
                                p0,
                              ).enrollmentsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.studentUserId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$UsersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDb,
      $UsersTable,
      User,
      $$UsersTableFilterComposer,
      $$UsersTableOrderingComposer,
      $$UsersTableAnnotationComposer,
      $$UsersTableCreateCompanionBuilder,
      $$UsersTableUpdateCompanionBuilder,
      (User, $$UsersTableReferences),
      User,
      PrefetchHooks Function({bool classesRefs, bool enrollmentsRefs})
    >;
typedef $$ClassesTableCreateCompanionBuilder =
    ClassesCompanion Function({
      Value<int> id,
      required int teacherUserId,
      required String name,
      Value<String?> description,
      required int capacity,
      Value<bool> enrollmentOpen,
      Value<DateTime?> startDate,
      Value<DateTime?> endDate,
      Value<DateTime> createdAt,
      Value<DateTime?> deletedAt,
    });
typedef $$ClassesTableUpdateCompanionBuilder =
    ClassesCompanion Function({
      Value<int> id,
      Value<int> teacherUserId,
      Value<String> name,
      Value<String?> description,
      Value<int> capacity,
      Value<bool> enrollmentOpen,
      Value<DateTime?> startDate,
      Value<DateTime?> endDate,
      Value<DateTime> createdAt,
      Value<DateTime?> deletedAt,
    });

final class $$ClassesTableReferences
    extends BaseReferences<_$AppDb, $ClassesTable, ClassesData> {
  $$ClassesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $UsersTable _teacherUserIdTable(_$AppDb db) => db.users.createAlias(
    $_aliasNameGenerator(db.classes.teacherUserId, db.users.id),
  );

  $$UsersTableProcessedTableManager get teacherUserId {
    final $_column = $_itemColumn<int>('teacher_user_id')!;

    final manager = $$UsersTableTableManager(
      $_db,
      $_db.users,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_teacherUserIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$EnrollmentsTable, List<Enrollment>>
  _enrollmentsRefsTable(_$AppDb db) => MultiTypedResultKey.fromTable(
    db.enrollments,
    aliasName: $_aliasNameGenerator(db.classes.id, db.enrollments.classId),
  );

  $$EnrollmentsTableProcessedTableManager get enrollmentsRefs {
    final manager = $$EnrollmentsTableTableManager(
      $_db,
      $_db.enrollments,
    ).filter((f) => f.classId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_enrollmentsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$ClassSessionsTable, List<ClassSession>>
  _classSessionsRefsTable(_$AppDb db) => MultiTypedResultKey.fromTable(
    db.classSessions,
    aliasName: $_aliasNameGenerator(db.classes.id, db.classSessions.classId),
  );

  $$ClassSessionsTableProcessedTableManager get classSessionsRefs {
    final manager = $$ClassSessionsTableTableManager(
      $_db,
      $_db.classSessions,
    ).filter((f) => f.classId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_classSessionsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ClassesTableFilterComposer extends Composer<_$AppDb, $ClassesTable> {
  $$ClassesTableFilterComposer({
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

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get capacity => $composableBuilder(
    column: $table.capacity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get enrollmentOpen => $composableBuilder(
    column: $table.enrollmentOpen,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get startDate => $composableBuilder(
    column: $table.startDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get endDate => $composableBuilder(
    column: $table.endDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$UsersTableFilterComposer get teacherUserId {
    final $$UsersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.teacherUserId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableFilterComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> enrollmentsRefs(
    Expression<bool> Function($$EnrollmentsTableFilterComposer f) f,
  ) {
    final $$EnrollmentsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.enrollments,
      getReferencedColumn: (t) => t.classId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EnrollmentsTableFilterComposer(
            $db: $db,
            $table: $db.enrollments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> classSessionsRefs(
    Expression<bool> Function($$ClassSessionsTableFilterComposer f) f,
  ) {
    final $$ClassSessionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.classSessions,
      getReferencedColumn: (t) => t.classId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ClassSessionsTableFilterComposer(
            $db: $db,
            $table: $db.classSessions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ClassesTableOrderingComposer extends Composer<_$AppDb, $ClassesTable> {
  $$ClassesTableOrderingComposer({
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

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get capacity => $composableBuilder(
    column: $table.capacity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get enrollmentOpen => $composableBuilder(
    column: $table.enrollmentOpen,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get startDate => $composableBuilder(
    column: $table.startDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get endDate => $composableBuilder(
    column: $table.endDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
    column: $table.deletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$UsersTableOrderingComposer get teacherUserId {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.teacherUserId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableOrderingComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ClassesTableAnnotationComposer
    extends Composer<_$AppDb, $ClassesTable> {
  $$ClassesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<int> get capacity =>
      $composableBuilder(column: $table.capacity, builder: (column) => column);

  GeneratedColumn<bool> get enrollmentOpen => $composableBuilder(
    column: $table.enrollmentOpen,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get startDate =>
      $composableBuilder(column: $table.startDate, builder: (column) => column);

  GeneratedColumn<DateTime> get endDate =>
      $composableBuilder(column: $table.endDate, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  $$UsersTableAnnotationComposer get teacherUserId {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.teacherUserId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableAnnotationComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> enrollmentsRefs<T extends Object>(
    Expression<T> Function($$EnrollmentsTableAnnotationComposer a) f,
  ) {
    final $$EnrollmentsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.enrollments,
      getReferencedColumn: (t) => t.classId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EnrollmentsTableAnnotationComposer(
            $db: $db,
            $table: $db.enrollments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> classSessionsRefs<T extends Object>(
    Expression<T> Function($$ClassSessionsTableAnnotationComposer a) f,
  ) {
    final $$ClassSessionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.classSessions,
      getReferencedColumn: (t) => t.classId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ClassSessionsTableAnnotationComposer(
            $db: $db,
            $table: $db.classSessions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ClassesTableTableManager
    extends
        RootTableManager<
          _$AppDb,
          $ClassesTable,
          ClassesData,
          $$ClassesTableFilterComposer,
          $$ClassesTableOrderingComposer,
          $$ClassesTableAnnotationComposer,
          $$ClassesTableCreateCompanionBuilder,
          $$ClassesTableUpdateCompanionBuilder,
          (ClassesData, $$ClassesTableReferences),
          ClassesData,
          PrefetchHooks Function({
            bool teacherUserId,
            bool enrollmentsRefs,
            bool classSessionsRefs,
          })
        > {
  $$ClassesTableTableManager(_$AppDb db, $ClassesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ClassesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ClassesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ClassesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> teacherUserId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<int> capacity = const Value.absent(),
                Value<bool> enrollmentOpen = const Value.absent(),
                Value<DateTime?> startDate = const Value.absent(),
                Value<DateTime?> endDate = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
              }) => ClassesCompanion(
                id: id,
                teacherUserId: teacherUserId,
                name: name,
                description: description,
                capacity: capacity,
                enrollmentOpen: enrollmentOpen,
                startDate: startDate,
                endDate: endDate,
                createdAt: createdAt,
                deletedAt: deletedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int teacherUserId,
                required String name,
                Value<String?> description = const Value.absent(),
                required int capacity,
                Value<bool> enrollmentOpen = const Value.absent(),
                Value<DateTime?> startDate = const Value.absent(),
                Value<DateTime?> endDate = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime?> deletedAt = const Value.absent(),
              }) => ClassesCompanion.insert(
                id: id,
                teacherUserId: teacherUserId,
                name: name,
                description: description,
                capacity: capacity,
                enrollmentOpen: enrollmentOpen,
                startDate: startDate,
                endDate: endDate,
                createdAt: createdAt,
                deletedAt: deletedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ClassesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                teacherUserId = false,
                enrollmentsRefs = false,
                classSessionsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (enrollmentsRefs) db.enrollments,
                    if (classSessionsRefs) db.classSessions,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (teacherUserId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.teacherUserId,
                                    referencedTable: $$ClassesTableReferences
                                        ._teacherUserIdTable(db),
                                    referencedColumn: $$ClassesTableReferences
                                        ._teacherUserIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (enrollmentsRefs)
                        await $_getPrefetchedData<
                          ClassesData,
                          $ClassesTable,
                          Enrollment
                        >(
                          currentTable: table,
                          referencedTable: $$ClassesTableReferences
                              ._enrollmentsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ClassesTableReferences(
                                db,
                                table,
                                p0,
                              ).enrollmentsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.classId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (classSessionsRefs)
                        await $_getPrefetchedData<
                          ClassesData,
                          $ClassesTable,
                          ClassSession
                        >(
                          currentTable: table,
                          referencedTable: $$ClassesTableReferences
                              ._classSessionsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ClassesTableReferences(
                                db,
                                table,
                                p0,
                              ).classSessionsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.classId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$ClassesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDb,
      $ClassesTable,
      ClassesData,
      $$ClassesTableFilterComposer,
      $$ClassesTableOrderingComposer,
      $$ClassesTableAnnotationComposer,
      $$ClassesTableCreateCompanionBuilder,
      $$ClassesTableUpdateCompanionBuilder,
      (ClassesData, $$ClassesTableReferences),
      ClassesData,
      PrefetchHooks Function({
        bool teacherUserId,
        bool enrollmentsRefs,
        bool classSessionsRefs,
      })
    >;
typedef $$EnrollmentsTableCreateCompanionBuilder =
    EnrollmentsCompanion Function({
      Value<int> id,
      required int studentUserId,
      required int classId,
      required String status,
      Value<DateTime?> enrolledAt,
      Value<DateTime?> droppedAt,
      Value<DateTime> createdAt,
    });
typedef $$EnrollmentsTableUpdateCompanionBuilder =
    EnrollmentsCompanion Function({
      Value<int> id,
      Value<int> studentUserId,
      Value<int> classId,
      Value<String> status,
      Value<DateTime?> enrolledAt,
      Value<DateTime?> droppedAt,
      Value<DateTime> createdAt,
    });

final class $$EnrollmentsTableReferences
    extends BaseReferences<_$AppDb, $EnrollmentsTable, Enrollment> {
  $$EnrollmentsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $UsersTable _studentUserIdTable(_$AppDb db) => db.users.createAlias(
    $_aliasNameGenerator(db.enrollments.studentUserId, db.users.id),
  );

  $$UsersTableProcessedTableManager get studentUserId {
    final $_column = $_itemColumn<int>('student_user_id')!;

    final manager = $$UsersTableTableManager(
      $_db,
      $_db.users,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_studentUserIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $ClassesTable _classIdTable(_$AppDb db) => db.classes.createAlias(
    $_aliasNameGenerator(db.enrollments.classId, db.classes.id),
  );

  $$ClassesTableProcessedTableManager get classId {
    final $_column = $_itemColumn<int>('class_id')!;

    final manager = $$ClassesTableTableManager(
      $_db,
      $_db.classes,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_classIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$AttendanceTable, List<AttendanceData>>
  _attendanceRefsTable(_$AppDb db) => MultiTypedResultKey.fromTable(
    db.attendance,
    aliasName: $_aliasNameGenerator(
      db.enrollments.id,
      db.attendance.enrollmentId,
    ),
  );

  $$AttendanceTableProcessedTableManager get attendanceRefs {
    final manager = $$AttendanceTableTableManager(
      $_db,
      $_db.attendance,
    ).filter((f) => f.enrollmentId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_attendanceRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$EnrollmentsTableFilterComposer
    extends Composer<_$AppDb, $EnrollmentsTable> {
  $$EnrollmentsTableFilterComposer({
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

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get enrolledAt => $composableBuilder(
    column: $table.enrolledAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get droppedAt => $composableBuilder(
    column: $table.droppedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$UsersTableFilterComposer get studentUserId {
    final $$UsersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.studentUserId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableFilterComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ClassesTableFilterComposer get classId {
    final $$ClassesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.classId,
      referencedTable: $db.classes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ClassesTableFilterComposer(
            $db: $db,
            $table: $db.classes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> attendanceRefs(
    Expression<bool> Function($$AttendanceTableFilterComposer f) f,
  ) {
    final $$AttendanceTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.attendance,
      getReferencedColumn: (t) => t.enrollmentId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AttendanceTableFilterComposer(
            $db: $db,
            $table: $db.attendance,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$EnrollmentsTableOrderingComposer
    extends Composer<_$AppDb, $EnrollmentsTable> {
  $$EnrollmentsTableOrderingComposer({
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

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get enrolledAt => $composableBuilder(
    column: $table.enrolledAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get droppedAt => $composableBuilder(
    column: $table.droppedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$UsersTableOrderingComposer get studentUserId {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.studentUserId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableOrderingComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ClassesTableOrderingComposer get classId {
    final $$ClassesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.classId,
      referencedTable: $db.classes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ClassesTableOrderingComposer(
            $db: $db,
            $table: $db.classes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$EnrollmentsTableAnnotationComposer
    extends Composer<_$AppDb, $EnrollmentsTable> {
  $$EnrollmentsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<DateTime> get enrolledAt => $composableBuilder(
    column: $table.enrolledAt,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get droppedAt =>
      $composableBuilder(column: $table.droppedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$UsersTableAnnotationComposer get studentUserId {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.studentUserId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableAnnotationComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ClassesTableAnnotationComposer get classId {
    final $$ClassesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.classId,
      referencedTable: $db.classes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ClassesTableAnnotationComposer(
            $db: $db,
            $table: $db.classes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> attendanceRefs<T extends Object>(
    Expression<T> Function($$AttendanceTableAnnotationComposer a) f,
  ) {
    final $$AttendanceTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.attendance,
      getReferencedColumn: (t) => t.enrollmentId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AttendanceTableAnnotationComposer(
            $db: $db,
            $table: $db.attendance,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$EnrollmentsTableTableManager
    extends
        RootTableManager<
          _$AppDb,
          $EnrollmentsTable,
          Enrollment,
          $$EnrollmentsTableFilterComposer,
          $$EnrollmentsTableOrderingComposer,
          $$EnrollmentsTableAnnotationComposer,
          $$EnrollmentsTableCreateCompanionBuilder,
          $$EnrollmentsTableUpdateCompanionBuilder,
          (Enrollment, $$EnrollmentsTableReferences),
          Enrollment,
          PrefetchHooks Function({
            bool studentUserId,
            bool classId,
            bool attendanceRefs,
          })
        > {
  $$EnrollmentsTableTableManager(_$AppDb db, $EnrollmentsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$EnrollmentsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$EnrollmentsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$EnrollmentsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> studentUserId = const Value.absent(),
                Value<int> classId = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<DateTime?> enrolledAt = const Value.absent(),
                Value<DateTime?> droppedAt = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => EnrollmentsCompanion(
                id: id,
                studentUserId: studentUserId,
                classId: classId,
                status: status,
                enrolledAt: enrolledAt,
                droppedAt: droppedAt,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int studentUserId,
                required int classId,
                required String status,
                Value<DateTime?> enrolledAt = const Value.absent(),
                Value<DateTime?> droppedAt = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => EnrollmentsCompanion.insert(
                id: id,
                studentUserId: studentUserId,
                classId: classId,
                status: status,
                enrolledAt: enrolledAt,
                droppedAt: droppedAt,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$EnrollmentsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                studentUserId = false,
                classId = false,
                attendanceRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [if (attendanceRefs) db.attendance],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (studentUserId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.studentUserId,
                                    referencedTable:
                                        $$EnrollmentsTableReferences
                                            ._studentUserIdTable(db),
                                    referencedColumn:
                                        $$EnrollmentsTableReferences
                                            ._studentUserIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (classId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.classId,
                                    referencedTable:
                                        $$EnrollmentsTableReferences
                                            ._classIdTable(db),
                                    referencedColumn:
                                        $$EnrollmentsTableReferences
                                            ._classIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (attendanceRefs)
                        await $_getPrefetchedData<
                          Enrollment,
                          $EnrollmentsTable,
                          AttendanceData
                        >(
                          currentTable: table,
                          referencedTable: $$EnrollmentsTableReferences
                              ._attendanceRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$EnrollmentsTableReferences(
                                db,
                                table,
                                p0,
                              ).attendanceRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.enrollmentId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$EnrollmentsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDb,
      $EnrollmentsTable,
      Enrollment,
      $$EnrollmentsTableFilterComposer,
      $$EnrollmentsTableOrderingComposer,
      $$EnrollmentsTableAnnotationComposer,
      $$EnrollmentsTableCreateCompanionBuilder,
      $$EnrollmentsTableUpdateCompanionBuilder,
      (Enrollment, $$EnrollmentsTableReferences),
      Enrollment,
      PrefetchHooks Function({
        bool studentUserId,
        bool classId,
        bool attendanceRefs,
      })
    >;
typedef $$ClassSessionsTableCreateCompanionBuilder =
    ClassSessionsCompanion Function({
      Value<int> id,
      required int classId,
      required DateTime sessionAt,
      Value<DateTime> createdAt,
    });
typedef $$ClassSessionsTableUpdateCompanionBuilder =
    ClassSessionsCompanion Function({
      Value<int> id,
      Value<int> classId,
      Value<DateTime> sessionAt,
      Value<DateTime> createdAt,
    });

final class $$ClassSessionsTableReferences
    extends BaseReferences<_$AppDb, $ClassSessionsTable, ClassSession> {
  $$ClassSessionsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $ClassesTable _classIdTable(_$AppDb db) => db.classes.createAlias(
    $_aliasNameGenerator(db.classSessions.classId, db.classes.id),
  );

  $$ClassesTableProcessedTableManager get classId {
    final $_column = $_itemColumn<int>('class_id')!;

    final manager = $$ClassesTableTableManager(
      $_db,
      $_db.classes,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_classIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$AttendanceTable, List<AttendanceData>>
  _attendanceRefsTable(_$AppDb db) => MultiTypedResultKey.fromTable(
    db.attendance,
    aliasName: $_aliasNameGenerator(
      db.classSessions.id,
      db.attendance.sessionId,
    ),
  );

  $$AttendanceTableProcessedTableManager get attendanceRefs {
    final manager = $$AttendanceTableTableManager(
      $_db,
      $_db.attendance,
    ).filter((f) => f.sessionId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_attendanceRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ClassSessionsTableFilterComposer
    extends Composer<_$AppDb, $ClassSessionsTable> {
  $$ClassSessionsTableFilterComposer({
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

  ColumnFilters<DateTime> get sessionAt => $composableBuilder(
    column: $table.sessionAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$ClassesTableFilterComposer get classId {
    final $$ClassesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.classId,
      referencedTable: $db.classes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ClassesTableFilterComposer(
            $db: $db,
            $table: $db.classes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> attendanceRefs(
    Expression<bool> Function($$AttendanceTableFilterComposer f) f,
  ) {
    final $$AttendanceTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.attendance,
      getReferencedColumn: (t) => t.sessionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AttendanceTableFilterComposer(
            $db: $db,
            $table: $db.attendance,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ClassSessionsTableOrderingComposer
    extends Composer<_$AppDb, $ClassSessionsTable> {
  $$ClassSessionsTableOrderingComposer({
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

  ColumnOrderings<DateTime> get sessionAt => $composableBuilder(
    column: $table.sessionAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$ClassesTableOrderingComposer get classId {
    final $$ClassesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.classId,
      referencedTable: $db.classes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ClassesTableOrderingComposer(
            $db: $db,
            $table: $db.classes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ClassSessionsTableAnnotationComposer
    extends Composer<_$AppDb, $ClassSessionsTable> {
  $$ClassSessionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get sessionAt =>
      $composableBuilder(column: $table.sessionAt, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$ClassesTableAnnotationComposer get classId {
    final $$ClassesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.classId,
      referencedTable: $db.classes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ClassesTableAnnotationComposer(
            $db: $db,
            $table: $db.classes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> attendanceRefs<T extends Object>(
    Expression<T> Function($$AttendanceTableAnnotationComposer a) f,
  ) {
    final $$AttendanceTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.attendance,
      getReferencedColumn: (t) => t.sessionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AttendanceTableAnnotationComposer(
            $db: $db,
            $table: $db.attendance,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ClassSessionsTableTableManager
    extends
        RootTableManager<
          _$AppDb,
          $ClassSessionsTable,
          ClassSession,
          $$ClassSessionsTableFilterComposer,
          $$ClassSessionsTableOrderingComposer,
          $$ClassSessionsTableAnnotationComposer,
          $$ClassSessionsTableCreateCompanionBuilder,
          $$ClassSessionsTableUpdateCompanionBuilder,
          (ClassSession, $$ClassSessionsTableReferences),
          ClassSession,
          PrefetchHooks Function({bool classId, bool attendanceRefs})
        > {
  $$ClassSessionsTableTableManager(_$AppDb db, $ClassSessionsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ClassSessionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ClassSessionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ClassSessionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> classId = const Value.absent(),
                Value<DateTime> sessionAt = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => ClassSessionsCompanion(
                id: id,
                classId: classId,
                sessionAt: sessionAt,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int classId,
                required DateTime sessionAt,
                Value<DateTime> createdAt = const Value.absent(),
              }) => ClassSessionsCompanion.insert(
                id: id,
                classId: classId,
                sessionAt: sessionAt,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ClassSessionsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({classId = false, attendanceRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (attendanceRefs) db.attendance],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (classId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.classId,
                                referencedTable: $$ClassSessionsTableReferences
                                    ._classIdTable(db),
                                referencedColumn: $$ClassSessionsTableReferences
                                    ._classIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (attendanceRefs)
                    await $_getPrefetchedData<
                      ClassSession,
                      $ClassSessionsTable,
                      AttendanceData
                    >(
                      currentTable: table,
                      referencedTable: $$ClassSessionsTableReferences
                          ._attendanceRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$ClassSessionsTableReferences(
                            db,
                            table,
                            p0,
                          ).attendanceRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.sessionId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$ClassSessionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDb,
      $ClassSessionsTable,
      ClassSession,
      $$ClassSessionsTableFilterComposer,
      $$ClassSessionsTableOrderingComposer,
      $$ClassSessionsTableAnnotationComposer,
      $$ClassSessionsTableCreateCompanionBuilder,
      $$ClassSessionsTableUpdateCompanionBuilder,
      (ClassSession, $$ClassSessionsTableReferences),
      ClassSession,
      PrefetchHooks Function({bool classId, bool attendanceRefs})
    >;
typedef $$AttendanceTableCreateCompanionBuilder =
    AttendanceCompanion Function({
      Value<int> id,
      required int enrollmentId,
      required int sessionId,
      required String status,
      Value<DateTime?> checkInAt,
      Value<String?> note,
      Value<DateTime> createdAt,
    });
typedef $$AttendanceTableUpdateCompanionBuilder =
    AttendanceCompanion Function({
      Value<int> id,
      Value<int> enrollmentId,
      Value<int> sessionId,
      Value<String> status,
      Value<DateTime?> checkInAt,
      Value<String?> note,
      Value<DateTime> createdAt,
    });

final class $$AttendanceTableReferences
    extends BaseReferences<_$AppDb, $AttendanceTable, AttendanceData> {
  $$AttendanceTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $EnrollmentsTable _enrollmentIdTable(_$AppDb db) =>
      db.enrollments.createAlias(
        $_aliasNameGenerator(db.attendance.enrollmentId, db.enrollments.id),
      );

  $$EnrollmentsTableProcessedTableManager get enrollmentId {
    final $_column = $_itemColumn<int>('enrollment_id')!;

    final manager = $$EnrollmentsTableTableManager(
      $_db,
      $_db.enrollments,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_enrollmentIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $ClassSessionsTable _sessionIdTable(_$AppDb db) =>
      db.classSessions.createAlias(
        $_aliasNameGenerator(db.attendance.sessionId, db.classSessions.id),
      );

  $$ClassSessionsTableProcessedTableManager get sessionId {
    final $_column = $_itemColumn<int>('session_id')!;

    final manager = $$ClassSessionsTableTableManager(
      $_db,
      $_db.classSessions,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_sessionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$AttendanceTableFilterComposer
    extends Composer<_$AppDb, $AttendanceTable> {
  $$AttendanceTableFilterComposer({
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

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get checkInAt => $composableBuilder(
    column: $table.checkInAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$EnrollmentsTableFilterComposer get enrollmentId {
    final $$EnrollmentsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.enrollmentId,
      referencedTable: $db.enrollments,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EnrollmentsTableFilterComposer(
            $db: $db,
            $table: $db.enrollments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ClassSessionsTableFilterComposer get sessionId {
    final $$ClassSessionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sessionId,
      referencedTable: $db.classSessions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ClassSessionsTableFilterComposer(
            $db: $db,
            $table: $db.classSessions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AttendanceTableOrderingComposer
    extends Composer<_$AppDb, $AttendanceTable> {
  $$AttendanceTableOrderingComposer({
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

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get checkInAt => $composableBuilder(
    column: $table.checkInAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$EnrollmentsTableOrderingComposer get enrollmentId {
    final $$EnrollmentsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.enrollmentId,
      referencedTable: $db.enrollments,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EnrollmentsTableOrderingComposer(
            $db: $db,
            $table: $db.enrollments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ClassSessionsTableOrderingComposer get sessionId {
    final $$ClassSessionsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sessionId,
      referencedTable: $db.classSessions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ClassSessionsTableOrderingComposer(
            $db: $db,
            $table: $db.classSessions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AttendanceTableAnnotationComposer
    extends Composer<_$AppDb, $AttendanceTable> {
  $$AttendanceTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<DateTime> get checkInAt =>
      $composableBuilder(column: $table.checkInAt, builder: (column) => column);

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$EnrollmentsTableAnnotationComposer get enrollmentId {
    final $$EnrollmentsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.enrollmentId,
      referencedTable: $db.enrollments,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EnrollmentsTableAnnotationComposer(
            $db: $db,
            $table: $db.enrollments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ClassSessionsTableAnnotationComposer get sessionId {
    final $$ClassSessionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sessionId,
      referencedTable: $db.classSessions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ClassSessionsTableAnnotationComposer(
            $db: $db,
            $table: $db.classSessions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AttendanceTableTableManager
    extends
        RootTableManager<
          _$AppDb,
          $AttendanceTable,
          AttendanceData,
          $$AttendanceTableFilterComposer,
          $$AttendanceTableOrderingComposer,
          $$AttendanceTableAnnotationComposer,
          $$AttendanceTableCreateCompanionBuilder,
          $$AttendanceTableUpdateCompanionBuilder,
          (AttendanceData, $$AttendanceTableReferences),
          AttendanceData,
          PrefetchHooks Function({bool enrollmentId, bool sessionId})
        > {
  $$AttendanceTableTableManager(_$AppDb db, $AttendanceTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AttendanceTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AttendanceTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AttendanceTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> enrollmentId = const Value.absent(),
                Value<int> sessionId = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<DateTime?> checkInAt = const Value.absent(),
                Value<String?> note = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => AttendanceCompanion(
                id: id,
                enrollmentId: enrollmentId,
                sessionId: sessionId,
                status: status,
                checkInAt: checkInAt,
                note: note,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int enrollmentId,
                required int sessionId,
                required String status,
                Value<DateTime?> checkInAt = const Value.absent(),
                Value<String?> note = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => AttendanceCompanion.insert(
                id: id,
                enrollmentId: enrollmentId,
                sessionId: sessionId,
                status: status,
                checkInAt: checkInAt,
                note: note,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$AttendanceTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({enrollmentId = false, sessionId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (enrollmentId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.enrollmentId,
                                referencedTable: $$AttendanceTableReferences
                                    ._enrollmentIdTable(db),
                                referencedColumn: $$AttendanceTableReferences
                                    ._enrollmentIdTable(db)
                                    .id,
                              )
                              as T;
                    }
                    if (sessionId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.sessionId,
                                referencedTable: $$AttendanceTableReferences
                                    ._sessionIdTable(db),
                                referencedColumn: $$AttendanceTableReferences
                                    ._sessionIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$AttendanceTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDb,
      $AttendanceTable,
      AttendanceData,
      $$AttendanceTableFilterComposer,
      $$AttendanceTableOrderingComposer,
      $$AttendanceTableAnnotationComposer,
      $$AttendanceTableCreateCompanionBuilder,
      $$AttendanceTableUpdateCompanionBuilder,
      (AttendanceData, $$AttendanceTableReferences),
      AttendanceData,
      PrefetchHooks Function({bool enrollmentId, bool sessionId})
    >;

class $AppDbManager {
  final _$AppDb _db;
  $AppDbManager(this._db);
  $$UsersTableTableManager get users =>
      $$UsersTableTableManager(_db, _db.users);
  $$ClassesTableTableManager get classes =>
      $$ClassesTableTableManager(_db, _db.classes);
  $$EnrollmentsTableTableManager get enrollments =>
      $$EnrollmentsTableTableManager(_db, _db.enrollments);
  $$ClassSessionsTableTableManager get classSessions =>
      $$ClassSessionsTableTableManager(_db, _db.classSessions);
  $$AttendanceTableTableManager get attendance =>
      $$AttendanceTableTableManager(_db, _db.attendance);
}
