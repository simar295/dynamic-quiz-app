class questionclass {
  final String text;
  final List<String> answers;

  questionclass(this.text, this.answers);

  List<String> getshuffledanswers() {
    //made copy of original list and used shuffle method
    final shuffledlist = List.of(answers);
    shuffledlist.shuffle();
    return shuffledlist;
  }
}
