import 'dart:async';
import 'package:moor_flutter/moor_flutter.dart';

part 'moor_database.g.dart';

class Profiles extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  DateTimeColumn get dob => dateTime().nullable()();
  TextColumn get gender => text()();
  TextColumn get profession => text()();
  TextColumn get email => text()();
  IntColumn get phone => integer()();
  TextColumn get location => text()();
  TextColumn get aboutMe => text()();
  TextColumn get personalityType => text()();
  TextColumn get tags => text()();
  IntColumn get age => integer()();
}

@UseMoor(tables: [Profiles])
class AppDatabase extends _$AppDatabase {
  AppDatabase()
      : super(FlutterQueryExecutor.inDatabaseFolder(
            path: 'db.sqlite', logStatements: true));
  @override
  int get schemaVersion => 1;

  Future<List<Profile>> getAllProfiles() => select(profiles).get();
  Stream<List<Profile>> watchAllProfiles() => select(profiles).watch();
  Future insertProfile(Profile profile) => into(profiles).insert(profile);
  Future updateProfile(Profile profile) => update(profiles).replace(profile);
  Future deleteProfile(Profile profile) => delete(profiles).delete(profile);
}
