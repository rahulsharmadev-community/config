import 'package:logger/logger.dart';
import '../config.dart';

enum LogType {
  verbose,
  debug,
  info,
  warning,
  error,
  wtf,
  nothing,
}

void printLog(Object? message,
    {bool isTime = false,
    bool printEmojis = false,
    LogType logType = LogType.verbose}) {
  final Logger logger = Logger(
    printer: PrettyPrinter(
        methodCount: 0, // number of method calls to be displayed
        printEmojis: printEmojis,
        lineLength: 1200,
        printTime: isTime // Should each log print contain a timestamp
        ),
  );
  if (Config.isDebugMode) {
    logger.log(Level.values[logType.index], '$message');
  }
}
