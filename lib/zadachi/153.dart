import 'dart:io';
import 'dart:math';

List<List<dynamic>> read() {
  File myFile = File("input.txt");
  List<String> content = myFile.readAsLinesSync();
  return content
      .map((e) => e.split(' ').map((num) => int.tryParse(num) ?? num).toList())
      .toList();
}

void main() {
  Set<String> base = {};
  final input = read();
  for (int i = 1; i <= input[0][0]; i++) {
    List<String> element = (input[i][0] as String).split('@');

    String unique = domainWorker(element[1]);
    if (element[0].isNotEmpty) {
      unique += loginWorker(element[0]);
    }
    base.add(unique);
  }
  print(base.length);
}

String loginWorker(String login) {
  login = login.replaceAll('.', '');
  final index = login.indexOf('-');
  return index == -1 ? login : login.substring(0, index);
}

String domainWorker(String domain) {
  final domainlist = domain.split('.');
  return domainlist.sublist(0, domainlist.length - 1).join();
}
