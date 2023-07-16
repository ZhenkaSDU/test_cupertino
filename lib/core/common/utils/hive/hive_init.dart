import 'package:hive/hive.dart';

initHiveAdapters() {}

initHiveBoxes() async {
  await Hive.openBox("tokens");

  await Hive.openBox("id");

  await Hive.openBox("refresh");

  await Hive.openBox("access");

  await Hive.openBox("profileUuid");
}
