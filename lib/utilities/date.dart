import 'package:jiffy/jiffy.dart';

dateFormatter(data) {
  var dayDiff = Jiffy.parse(data)
      .diff(Jiffy.parse(DateTime.timestamp().toString()), unit: Unit.day);

  if (dayDiff.abs() >= 10) {
    return Jiffy.parse(data).yMMMMdjm;
  }

  return Jiffy.parse(data).fromNow();
}

// Jiffy.parse(note[index].timestamp).yMMMMdjm
