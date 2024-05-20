void main() {
  int x = 5;
  for (int i = 1; i < 5; i++) {
    int value = 4;
    print(i);
    int temp = i;
    for (var j = 1; j < i; j++) {
      temp = value + temp;
      print(temp);
    }
    print("");
  }
}
