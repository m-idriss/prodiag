import 'package:logger/logger.dart';

final logger = Logger(
    printer: PrettyPrinter(
  methodCount: 0,
  errorMethodCount: 5,
  lineLength: 80,
  colors: false,
  printEmojis: true,
  printTime: true,
));

void info(String message, {Map<String, dynamic> data = const {}}) =>
    logger.i("[Info] [$message] [$data]");

void warn(String message, {Map<String, dynamic> data = const {}}) =>
    logger.w("[Warning] [$message] [$data]");

void error(String message, {Map<String, dynamic> data = const {}}) =>
    logger.e("[Error] [$message] [$data]");
