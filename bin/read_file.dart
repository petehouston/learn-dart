import 'dart:io';
import 'dart:convert';
import 'dart:async';

void main()
{
  readFileSync();

  readFileAsync(); // Notice the output of this method is async-ed

  readFileByLines();

  readFileStream();
}

/**
 * Read file synchronously
 */
void readFileSync() {
  print('--- READ FILE SYNC ---');
  String contents = new File('./assets/user.json').readAsStringSync();
  print(contents);
}

/**
 * Read file asynchronously
 */
void readFileAsync() {
  print('--- READ FILE ASYNC ---');
  new File('./assets/user.json').readAsString().then((c) => print(c));
}

/**
 * Read file by lines
 */
void readFileByLines() {
  print('--- READ FILE BY LINES ---');
  File file = new File('./assets/user.json');

  // async
  file.readAsLines().then((lines) =>
    lines.forEach((l) => print(l))
  );

  // sync
  List<String> lines = file.readAsLinesSync();
  lines.forEach((l) => print(l));
}

/**
 * Read file as stream
 */
void readFileStream() {
  print('--- READ FILE STREAM ---');
  Stream<List<int>> stream = new File('./assets/user.json').openRead();
  StringBuffer buffer = new StringBuffer();
  stream
    .transform(utf8.decoder)
    .transform(LineSplitter())
    .listen((data) {
      print("Received: $data");
      buffer.write(data);
    },
    onDone: () => print(buffer.toString()),
    onError: (e) => print(e));
}