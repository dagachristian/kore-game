import 'package:logging/logging.dart' show Level, Logger;

import './config/index.dart' show config;

final logger = Logger('system');

const _ANSI_RED = '\u001B[31m';
const _ANSI_YELLOW = '\u001B[33m';
const _ANSI_RESET = '\u001B[0m';

String _colorLines(String multiline, String ansiColor, [String containing]) {
  return multiline.split('\n')
    .map((line) {
      return containing == null || line.contains(containing)
        ? '${ansiColor}${line}${_ANSI_RESET}' // No longer clickable.
        : line;
    })
    .join('\n');
}

void initLogger() {
  // ALL | FINEST |FINER | FINE | CONFIG | INFO | WARNING | SEVERE | SHOUT | OFF
  Logger.root.level = config.loggerLevel;
  print('Logger Level: ${Logger.root.level}');

  Logger.root.onRecord.listen((record) {
    String lineColor = '';
    if (record.level.value >= Level.SEVERE.value) {
      lineColor = _ANSI_RED;
    } else if (record.level == Level.WARNING) {
      lineColor = _ANSI_YELLOW;
    }

    // ignore: lines_longer_than_80_chars
    String msg = '${lineColor}${record.level.name}: ${record.message}${_ANSI_RESET}';
    if (record.error != null) {
      final errorMsg = _colorLines(
        '${record.error.runtimeType}: ${record.error.toString()}',
        lineColor
      );
      msg += '\n${errorMsg}';
      if (record.stackTrace != null) {
        final frames = _colorLines(
          record.stackTrace.toString(),
          lineColor,
          'package:kore_mobile'
        );
        msg += '\n${frames}';
      }
    }
    
    print(msg);
  });
}

// TODO: error example.  Remove this once we have some usage in the code.
// try {
//   throw Error();
// }
// on io.StdoutException catch(e, stack) {
//   logger.severe('AD: this is an exception', e, stack);
// }