import 'package:hive_flutter/adapters.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HiveState extends Notifier {
  // ignore: prefer_typing_uninitialized_variables
  var box;
  @override
  build() {
    return Hive.box('keep').get('onBoard', defaultValue: "");
  }

  void delete() {
    box = Hive.box('keep').delete('onBoard');
  }

  void update(value) {
    box = Hive.box('keep').put('onBoard', value);
  }
}

final hiveProvider = NotifierProvider(() {
  return HiveState();
});
