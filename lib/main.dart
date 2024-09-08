import 'package:flutter/material.dart';
import 'quote.dart';
import 'quote_card.dart';

void main() {
  runApp(const MaterialApp(
    home: QuoteList(),
  ));
}

class QuoteList extends StatefulWidget {
  const QuoteList({super.key});

  @override
  State<QuoteList> createState() => _QuoteListState();
}

class _QuoteListState extends State<QuoteList> {

  // List type; set to Quote instead of String
  final List<Quote> originalQuotes = [
    Quote(text: 'Be yourself, Everyone else is already taken.', author: 'Oscar Wilde'),
    Quote(text: 'I have nothing to declare except my genius.', author: 'Oscar Wilde'),
    Quote(text: 'The truth is rarely pure and never simple.', author: 'Oscar Wilde'),
    Quote(text: 'If you want something done right, do it yourself.', author: 'Charles-Guillaume Étienne'),
    Quote(text: 'The way to get started is to quit talking and begin doing.', author: 'Walt Disney'),
    Quote(text: 'The only limit to our realization of tomorrow is our doubts of today.', author: 'Franklin D. Roosevelt'),
    Quote(text: 'Life is 10% what happens to us and 90% how we react to it.', author: 'Charles R. Swindoll'),
    Quote(text: 'The purpose of our lives is to be happy.', author: 'Dalai Lama'),
    Quote(text: 'Success usually comes to those who are too busy to be looking for it.', author: 'Henry David Thoreau'),
    Quote(text: 'Don’t be afraid to give up the good to go for the great.', author: 'John D. Rockefeller'),
    Quote(text: 'Your time is limited, so don’t waste it living someone else’s life.', author: 'Steve Jobs'),
    Quote(text: 'If life were predictable it would cease to be life, and be without flavor.', author: 'Eleanor Roosevelt'),
    Quote(text: 'In the end, we will remember not the words of our enemies, but the silence of our friends.', author: 'Martin Luther King Jr.'),
    Quote(text: 'The only impossible journey is the one you never begin.', author: 'Tony Robbins'),
    Quote(text: 'In the middle of difficulty lies opportunity.', author: 'Albert Einstein')
  ];

  // Current quotes list
  List<Quote> quotes = [];

  @override
  void initState() {
    super.initState();
    quotes = List.from(originalQuotes);
  }

  void _reloadQuotes() {
    setState(() {
      quotes = List.from(originalQuotes);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(120.0), // Custom height for AppBar
        child: AppBar(
          backgroundColor: Colors.green[200],
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Awesome Quotes',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                ),
              ),
              const SizedBox(height: 15.0), // Space between title and button
              TextButton.icon(
                onPressed: _reloadQuotes,
                label: const Text('Reload Quotes'),
                icon: const Icon(Icons.refresh, size: 16),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.green[100], // Background color
                  foregroundColor: Colors.black, // Text color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
            ],
          ),
          toolbarHeight: 150.0, // Adjust height as needed
          elevation: 0, // Optional: Remove shadow if not needed
        ),
      ),

      body: ListView( // to
        // allow scrolling in overflow case
        children: <Widget>[
          Column(
            children: quotes.map((quote) => QuoteCard(
                quote: quote,
                delete: () {
                  setState(() {
                    quotes.remove(quote);
                  });
                }
            )).toList(),
          ),
        ],
      ),
    );
  }
}