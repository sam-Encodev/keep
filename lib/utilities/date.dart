import 'package:jiffy/jiffy.dart';

var timestamp = DateTime.timestamp().toString();

dateFormatter(data) {
  var dayDiff = Jiffy.parse(data)
      .diff(Jiffy.parse(timestamp), unit: Unit.day);

  if (dayDiff.abs() >= 10) {
    return Jiffy.parse(data).yMMMMdjm;
  }

  return Jiffy.parse(data).fromNow();
}

// Jiffy.parse(note[index].timestamp).yMMMMdjm
