import 'dart:io';

List<List<dynamic>> read() {
  File myFile = File("input.txt");
  List<String> content = myFile.readAsLinesSync();
  return content
      .map((e) => e.split(' ').map((element) => element.toLowerCase()).toList())
      .toList();
}

void main() {
  List<List<dynamic>> input = read();
  int count = int.parse(input[0][0]);
  int filter = int.parse(input[0][1]);
  List<List<String>> pages = input.skip(1).toList() as List<List<String>>;
  List<String> answer = [];

  for (int i = 0; i < count * 2; i += 2) {
    int gooseCount = pages[i + 1].where((word) => word == 'goose').length;
    if (gooseCount >= filter) {
      String name = pages[i].join(' ');
      answer.add(name);
    }
  }
  answer.sort();
  print(answer.length);
  answer.forEach(print);
}
