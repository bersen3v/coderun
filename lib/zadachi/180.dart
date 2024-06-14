import 'dart:io';

List<List<dynamic>> read() {
  File myFile = File("input.txt");
  List<String> content = myFile.readAsLinesSync();
  return content
      .map((e) => e.split(' ').map((num) => int.tryParse(num) ?? num).toList())
      .toList();
}

void main() {
  List<List<dynamic>> list = read();
  List<String> words = (list[1][0] as String).split('');

  int max = list[2][0];
  String maxword = words[0];
  for (int i = 1; i < list[0][0]; i++) {
    int newres = list[2][i] - list[2][i - 1];
    if (newres >= max) {
      max = newres;
      maxword = words[i];
    }
  }

  print(maxword);
}
