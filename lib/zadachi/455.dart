import 'dart:io';

List<List<int>> read() {
  File myFile = File("input.txt");
  List<String> content = myFile.readAsLinesSync();
  return content
      .map((e) => e.split(' ').map((num) => int.parse(num)).toList())
      .toList();
}

void main() {
  List<List<int>> file = read();
  int summa = file[1].reduce((value, element) => value + element);
  print(100 ~/ summa);
}
