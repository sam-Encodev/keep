import 'package:hive_flutter/adapters.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HiveState extends Notifier {
  var box;

  @override
  build() {
    box = Hive.box('keep').get('key', defaultValue: "");
    return box;
  }

  void write() {
    box = Hive.box('keep').put('key', '');
  }

  void delete() {
    box = Hive.box('keep').delete('key');
  }

  void update(value) {
    box = Hive.box('keep').put('key', value);
  }
}

final hiveProvider = NotifierProvider(() {
  return HiveState();
});
