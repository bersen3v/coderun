import 'dart:io';
import 'dart:math';

List<List<int>> read() {
  File myFile = File("input.txt");
  List<String> content = myFile.readAsLinesSync();
  return content
      .map((e) => e.split(' ').map((num) => int.parse(num)).toList())
      .toList();
}

List<List<int>> read2() {
  File myFile = File("input.txt");
  List<String> content = myFile.readAsLinesSync();
  return content
      .map((e) => e.split(' ').map((num) => int.parse(num)).toList())
      .toList();
}

void main() {
  List<List<int>> content = read();
  List<int> dospehi = content[1];

  List<int> plus = [];
  List<int> minus = [];

  for (int dospeh in dospehi) {
    if (dospeh >= 0) {
      plus.add(dospeh);
    } else {
      minus.add(dospeh);
    }
  }

  if (minus.length == 0) {
    print(plus.reduce(min));
  } else if (minus.length % 2 == 0) {
    print(minus.reduce(min));
  } else {
    print(minus.reduce(max));
  }
}
