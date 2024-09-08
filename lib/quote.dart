class Quote {
  String text;
  String author;

  // method 2: new
  Quote({required this.text, required this.author});

  // method1
  // Quote({String text, String author}){
  //   this.text = text;
  //   this.author = author;
  // }
}

// Quote my_quote = Quote(author: 'oscar wilde', text: 'this is the quote');