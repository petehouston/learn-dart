import 'dart:io';
import 'dart:convert';

void main() {
  downloadTextFileAndPrint();

  downloadTextFileAndSave();

  downloadBinaryFile();

  downloadFileUsingStreamPipe();
}

void downloadTextFileAndPrint() {
  HttpClient client = new HttpClient();
  client.getUrl(Uri.parse("https://fluttermaster.com/"))
      .then((HttpClientRequest request) {
        return request.close();
      })
          .then((HttpClientResponse response) {
        response.transform(utf8.decoder).listen((contents) => print(contents));
      });
}

void downloadTextFileAndSave() {
  HttpClient client = new HttpClient();
  var _downloadData = StringBuffer();
  var fileSave = new File('./index.html');
  client.getUrl(Uri.parse("https://fluttermaster.com/"))
      .then((HttpClientRequest request) {
        return request.close();
      })
      .then((HttpClientResponse response) {
        response.transform(utf8.decoder).listen((d) => _downloadData.write(d),
            onDone: () {
              fileSave.writeAsString(_downloadData.toString());
            }
        );
      });
}

void downloadBinaryFile() {
  HttpClient client = new HttpClient();
  var _downloadData = List<int>();
  var fileSave = new File('./logo.png');
  client.getUrl(Uri.parse("https://fluttermaster.com/wp-content/uploads/2018/08/fluttermaster.com-logo-web-header.png"))
      .then((HttpClientRequest request) {
        return request.close();
      })
      .then((HttpClientResponse response) {
        response.listen((d) => _downloadData.addAll(d),
            onDone: () {
              fileSave.writeAsBytes(_downloadData);
            }
        );
      });
}

void downloadFileUsingStreamPipe() {
  HttpClient client = new HttpClient();
  client.getUrl(Uri.parse("https://fluttermaster.com/wp-content/uploads/2018/08/fluttermaster.com-logo-web-header.png"))
      .then((HttpClientRequest request) {
        return request.close();
      })
      .then((HttpClientResponse response) {
        response.pipe(new File('./logo_pipe.png').openWrite());
      });
}