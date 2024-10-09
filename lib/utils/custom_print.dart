import 'package:logger/logger.dart';

var logger = Logger(
    printer: PrettyPrinter(
  colors: true,
  printEmojis: true,
  dateTimeFormat: DateTimeFormat.dateAndTime,
));
