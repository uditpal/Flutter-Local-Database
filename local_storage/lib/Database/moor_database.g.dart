// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moor_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Profile extends DataClass implements Insertable<Profile> {
  final int id;
  final String name;
  final DateTime dob;
  final String gender;
  final String profession;
  final String email;
  final int phone;
  final String location;
  final String aboutMe;
  final String personalityType;
  final String tags;
  final int age;
  Profile(
      {@required this.id,
      @required this.name,
      this.dob,
      @required this.gender,
      @required this.profession,
      @required this.email,
      @required this.phone,
      @required this.location,
      @required this.aboutMe,
      @required this.personalityType,
      @required this.tags,
      @required this.age});
  factory Profile.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return Profile(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      dob: dateTimeType.mapFromDatabaseResponse(data['${effectivePrefix}dob']),
      gender:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}gender']),
      profession: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}profession']),
      email:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}email']),
      phone: intType.mapFromDatabaseResponse(data['${effectivePrefix}phone']),
      location: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}location']),
      aboutMe: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}about_me']),
      personalityType: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}personality_type']),
      tags: stringType.mapFromDatabaseResponse(data['${effectivePrefix}tags']),
      age: intType.mapFromDatabaseResponse(data['${effectivePrefix}age']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || dob != null) {
      map['dob'] = Variable<DateTime>(dob);
    }
    if (!nullToAbsent || gender != null) {
      map['gender'] = Variable<String>(gender);
    }
    if (!nullToAbsent || profession != null) {
      map['profession'] = Variable<String>(profession);
    }
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    if (!nullToAbsent || phone != null) {
      map['phone'] = Variable<int>(phone);
    }
    if (!nullToAbsent || location != null) {
      map['location'] = Variable<String>(location);
    }
    if (!nullToAbsent || aboutMe != null) {
      map['about_me'] = Variable<String>(aboutMe);
    }
    if (!nullToAbsent || personalityType != null) {
      map['personality_type'] = Variable<String>(personalityType);
    }
    if (!nullToAbsent || tags != null) {
      map['tags'] = Variable<String>(tags);
    }
    if (!nullToAbsent || age != null) {
      map['age'] = Variable<int>(age);
    }
    return map;
  }

  ProfilesCompanion toCompanion(bool nullToAbsent) {
    return ProfilesCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      dob: dob == null && nullToAbsent ? const Value.absent() : Value(dob),
      gender:
          gender == null && nullToAbsent ? const Value.absent() : Value(gender),
      profession: profession == null && nullToAbsent
          ? const Value.absent()
          : Value(profession),
      email:
          email == null && nullToAbsent ? const Value.absent() : Value(email),
      phone:
          phone == null && nullToAbsent ? const Value.absent() : Value(phone),
      location: location == null && nullToAbsent
          ? const Value.absent()
          : Value(location),
      aboutMe: aboutMe == null && nullToAbsent
          ? const Value.absent()
          : Value(aboutMe),
      personalityType: personalityType == null && nullToAbsent
          ? const Value.absent()
          : Value(personalityType),
      tags: tags == null && nullToAbsent ? const Value.absent() : Value(tags),
      age: age == null && nullToAbsent ? const Value.absent() : Value(age),
    );
  }

  factory Profile.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Profile(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      dob: serializer.fromJson<DateTime>(json['dob']),
      gender: serializer.fromJson<String>(json['gender']),
      profession: serializer.fromJson<String>(json['profession']),
      email: serializer.fromJson<String>(json['email']),
      phone: serializer.fromJson<int>(json['phone']),
      location: serializer.fromJson<String>(json['location']),
      aboutMe: serializer.fromJson<String>(json['aboutMe']),
      personalityType: serializer.fromJson<String>(json['personalityType']),
      tags: serializer.fromJson<String>(json['tags']),
      age: serializer.fromJson<int>(json['age']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'dob': serializer.toJson<DateTime>(dob),
      'gender': serializer.toJson<String>(gender),
      'profession': serializer.toJson<String>(profession),
      'email': serializer.toJson<String>(email),
      'phone': serializer.toJson<int>(phone),
      'location': serializer.toJson<String>(location),
      'aboutMe': serializer.toJson<String>(aboutMe),
      'personalityType': serializer.toJson<String>(personalityType),
      'tags': serializer.toJson<String>(tags),
      'age': serializer.toJson<int>(age),
    };
  }

  Profile copyWith(
          {int id,
          String name,
          DateTime dob,
          String gender,
          String profession,
          String email,
          int phone,
          String location,
          String aboutMe,
          String personalityType,
          String tags,
          int age}) =>
      Profile(
        id: id ?? this.id,
        name: name ?? this.name,
        dob: dob ?? this.dob,
        gender: gender ?? this.gender,
        profession: profession ?? this.profession,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        location: location ?? this.location,
        aboutMe: aboutMe ?? this.aboutMe,
        personalityType: personalityType ?? this.personalityType,
        tags: tags ?? this.tags,
        age: age ?? this.age,
      );
  @override
  String toString() {
    return (StringBuffer('Profile(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('dob: $dob, ')
          ..write('gender: $gender, ')
          ..write('profession: $profession, ')
          ..write('email: $email, ')
          ..write('phone: $phone, ')
          ..write('location: $location, ')
          ..write('aboutMe: $aboutMe, ')
          ..write('personalityType: $personalityType, ')
          ..write('tags: $tags, ')
          ..write('age: $age')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          name.hashCode,
          $mrjc(
              dob.hashCode,
              $mrjc(
                  gender.hashCode,
                  $mrjc(
                      profession.hashCode,
                      $mrjc(
                          email.hashCode,
                          $mrjc(
                              phone.hashCode,
                              $mrjc(
                                  location.hashCode,
                                  $mrjc(
                                      aboutMe.hashCode,
                                      $mrjc(
                                          personalityType.hashCode,
                                          $mrjc(tags.hashCode,
                                              age.hashCode))))))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Profile &&
          other.id == this.id &&
          other.name == this.name &&
          other.dob == this.dob &&
          other.gender == this.gender &&
          other.profession == this.profession &&
          other.email == this.email &&
          other.phone == this.phone &&
          other.location == this.location &&
          other.aboutMe == this.aboutMe &&
          other.personalityType == this.personalityType &&
          other.tags == this.tags &&
          other.age == this.age);
}

class ProfilesCompanion extends UpdateCompanion<Profile> {
  final Value<int> id;
  final Value<String> name;
  final Value<DateTime> dob;
  final Value<String> gender;
  final Value<String> profession;
  final Value<String> email;
  final Value<int> phone;
  final Value<String> location;
  final Value<String> aboutMe;
  final Value<String> personalityType;
  final Value<String> tags;
  final Value<int> age;
  const ProfilesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.dob = const Value.absent(),
    this.gender = const Value.absent(),
    this.profession = const Value.absent(),
    this.email = const Value.absent(),
    this.phone = const Value.absent(),
    this.location = const Value.absent(),
    this.aboutMe = const Value.absent(),
    this.personalityType = const Value.absent(),
    this.tags = const Value.absent(),
    this.age = const Value.absent(),
  });
  ProfilesCompanion.insert({
    this.id = const Value.absent(),
    @required String name,
    this.dob = const Value.absent(),
    @required String gender,
    @required String profession,
    @required String email,
    @required int phone,
    @required String location,
    @required String aboutMe,
    @required String personalityType,
    @required String tags,
    @required int age,
  })  : name = Value(name),
        gender = Value(gender),
        profession = Value(profession),
        email = Value(email),
        phone = Value(phone),
        location = Value(location),
        aboutMe = Value(aboutMe),
        personalityType = Value(personalityType),
        tags = Value(tags),
        age = Value(age);
  static Insertable<Profile> custom({
    Expression<int> id,
    Expression<String> name,
    Expression<DateTime> dob,
    Expression<String> gender,
    Expression<String> profession,
    Expression<String> email,
    Expression<int> phone,
    Expression<String> location,
    Expression<String> aboutMe,
    Expression<String> personalityType,
    Expression<String> tags,
    Expression<int> age,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (dob != null) 'dob': dob,
      if (gender != null) 'gender': gender,
      if (profession != null) 'profession': profession,
      if (email != null) 'email': email,
      if (phone != null) 'phone': phone,
      if (location != null) 'location': location,
      if (aboutMe != null) 'about_me': aboutMe,
      if (personalityType != null) 'personality_type': personalityType,
      if (tags != null) 'tags': tags,
      if (age != null) 'age': age,
    });
  }

  ProfilesCompanion copyWith(
      {Value<int> id,
      Value<String> name,
      Value<DateTime> dob,
      Value<String> gender,
      Value<String> profession,
      Value<String> email,
      Value<int> phone,
      Value<String> location,
      Value<String> aboutMe,
      Value<String> personalityType,
      Value<String> tags,
      Value<int> age}) {
    return ProfilesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      dob: dob ?? this.dob,
      gender: gender ?? this.gender,
      profession: profession ?? this.profession,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      location: location ?? this.location,
      aboutMe: aboutMe ?? this.aboutMe,
      personalityType: personalityType ?? this.personalityType,
      tags: tags ?? this.tags,
      age: age ?? this.age,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (dob.present) {
      map['dob'] = Variable<DateTime>(dob.value);
    }
    if (gender.present) {
      map['gender'] = Variable<String>(gender.value);
    }
    if (profession.present) {
      map['profession'] = Variable<String>(profession.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (phone.present) {
      map['phone'] = Variable<int>(phone.value);
    }
    if (location.present) {
      map['location'] = Variable<String>(location.value);
    }
    if (aboutMe.present) {
      map['about_me'] = Variable<String>(aboutMe.value);
    }
    if (personalityType.present) {
      map['personality_type'] = Variable<String>(personalityType.value);
    }
    if (tags.present) {
      map['tags'] = Variable<String>(tags.value);
    }
    if (age.present) {
      map['age'] = Variable<int>(age.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProfilesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('dob: $dob, ')
          ..write('gender: $gender, ')
          ..write('profession: $profession, ')
          ..write('email: $email, ')
          ..write('phone: $phone, ')
          ..write('location: $location, ')
          ..write('aboutMe: $aboutMe, ')
          ..write('personalityType: $personalityType, ')
          ..write('tags: $tags, ')
          ..write('age: $age')
          ..write(')'))
        .toString();
  }
}

class $ProfilesTable extends Profiles with TableInfo<$ProfilesTable, Profile> {
  final GeneratedDatabase _db;
  final String _alias;
  $ProfilesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn(
      'name',
      $tableName,
      false,
    );
  }

  final VerificationMeta _dobMeta = const VerificationMeta('dob');
  GeneratedDateTimeColumn _dob;
  @override
  GeneratedDateTimeColumn get dob => _dob ??= _constructDob();
  GeneratedDateTimeColumn _constructDob() {
    return GeneratedDateTimeColumn(
      'dob',
      $tableName,
      true,
    );
  }

  final VerificationMeta _genderMeta = const VerificationMeta('gender');
  GeneratedTextColumn _gender;
  @override
  GeneratedTextColumn get gender => _gender ??= _constructGender();
  GeneratedTextColumn _constructGender() {
    return GeneratedTextColumn(
      'gender',
      $tableName,
      false,
    );
  }

  final VerificationMeta _professionMeta = const VerificationMeta('profession');
  GeneratedTextColumn _profession;
  @override
  GeneratedTextColumn get profession => _profession ??= _constructProfession();
  GeneratedTextColumn _constructProfession() {
    return GeneratedTextColumn(
      'profession',
      $tableName,
      false,
    );
  }

  final VerificationMeta _emailMeta = const VerificationMeta('email');
  GeneratedTextColumn _email;
  @override
  GeneratedTextColumn get email => _email ??= _constructEmail();
  GeneratedTextColumn _constructEmail() {
    return GeneratedTextColumn(
      'email',
      $tableName,
      false,
    );
  }

  final VerificationMeta _phoneMeta = const VerificationMeta('phone');
  GeneratedIntColumn _phone;
  @override
  GeneratedIntColumn get phone => _phone ??= _constructPhone();
  GeneratedIntColumn _constructPhone() {
    return GeneratedIntColumn(
      'phone',
      $tableName,
      false,
    );
  }

  final VerificationMeta _locationMeta = const VerificationMeta('location');
  GeneratedTextColumn _location;
  @override
  GeneratedTextColumn get location => _location ??= _constructLocation();
  GeneratedTextColumn _constructLocation() {
    return GeneratedTextColumn(
      'location',
      $tableName,
      false,
    );
  }

  final VerificationMeta _aboutMeMeta = const VerificationMeta('aboutMe');
  GeneratedTextColumn _aboutMe;
  @override
  GeneratedTextColumn get aboutMe => _aboutMe ??= _constructAboutMe();
  GeneratedTextColumn _constructAboutMe() {
    return GeneratedTextColumn(
      'about_me',
      $tableName,
      false,
    );
  }

  final VerificationMeta _personalityTypeMeta =
      const VerificationMeta('personalityType');
  GeneratedTextColumn _personalityType;
  @override
  GeneratedTextColumn get personalityType =>
      _personalityType ??= _constructPersonalityType();
  GeneratedTextColumn _constructPersonalityType() {
    return GeneratedTextColumn(
      'personality_type',
      $tableName,
      false,
    );
  }

  final VerificationMeta _tagsMeta = const VerificationMeta('tags');
  GeneratedTextColumn _tags;
  @override
  GeneratedTextColumn get tags => _tags ??= _constructTags();
  GeneratedTextColumn _constructTags() {
    return GeneratedTextColumn(
      'tags',
      $tableName,
      false,
    );
  }

  final VerificationMeta _ageMeta = const VerificationMeta('age');
  GeneratedIntColumn _age;
  @override
  GeneratedIntColumn get age => _age ??= _constructAge();
  GeneratedIntColumn _constructAge() {
    return GeneratedIntColumn(
      'age',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        dob,
        gender,
        profession,
        email,
        phone,
        location,
        aboutMe,
        personalityType,
        tags,
        age
      ];
  @override
  $ProfilesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'profiles';
  @override
  final String actualTableName = 'profiles';
  @override
  VerificationContext validateIntegrity(Insertable<Profile> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('dob')) {
      context.handle(
          _dobMeta, dob.isAcceptableOrUnknown(data['dob'], _dobMeta));
    }
    if (data.containsKey('gender')) {
      context.handle(_genderMeta,
          gender.isAcceptableOrUnknown(data['gender'], _genderMeta));
    } else if (isInserting) {
      context.missing(_genderMeta);
    }
    if (data.containsKey('profession')) {
      context.handle(
          _professionMeta,
          profession.isAcceptableOrUnknown(
              data['profession'], _professionMeta));
    } else if (isInserting) {
      context.missing(_professionMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email'], _emailMeta));
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('phone')) {
      context.handle(
          _phoneMeta, phone.isAcceptableOrUnknown(data['phone'], _phoneMeta));
    } else if (isInserting) {
      context.missing(_phoneMeta);
    }
    if (data.containsKey('location')) {
      context.handle(_locationMeta,
          location.isAcceptableOrUnknown(data['location'], _locationMeta));
    } else if (isInserting) {
      context.missing(_locationMeta);
    }
    if (data.containsKey('about_me')) {
      context.handle(_aboutMeMeta,
          aboutMe.isAcceptableOrUnknown(data['about_me'], _aboutMeMeta));
    } else if (isInserting) {
      context.missing(_aboutMeMeta);
    }
    if (data.containsKey('personality_type')) {
      context.handle(
          _personalityTypeMeta,
          personalityType.isAcceptableOrUnknown(
              data['personality_type'], _personalityTypeMeta));
    } else if (isInserting) {
      context.missing(_personalityTypeMeta);
    }
    if (data.containsKey('tags')) {
      context.handle(
          _tagsMeta, tags.isAcceptableOrUnknown(data['tags'], _tagsMeta));
    } else if (isInserting) {
      context.missing(_tagsMeta);
    }
    if (data.containsKey('age')) {
      context.handle(
          _ageMeta, age.isAcceptableOrUnknown(data['age'], _ageMeta));
    } else if (isInserting) {
      context.missing(_ageMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Profile map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Profile.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $ProfilesTable createAlias(String alias) {
    return $ProfilesTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $ProfilesTable _profiles;
  $ProfilesTable get profiles => _profiles ??= $ProfilesTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [profiles];
}
