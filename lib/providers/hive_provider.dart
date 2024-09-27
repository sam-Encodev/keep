import 'package:hive_flutter/adapters.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HiveState extends Notifier {
  var box;

  @override
  build() {
    box = Hive.box('keep').get('onBoard', defaultValue: "initialize");
    return box;
  }

  void write() {
    box = Hive.box('keep').put('onBoard', '');
    box;
  }

  void delete() {
    box = Hive.box('keep').delete('onBoard');
    box;
  }

  void update(value) {
    box = Hive.box('keep').put('onBoard', value);
    box;
  }
}

final hiveProvider = NotifierProvider(() {
  return HiveState();
});
