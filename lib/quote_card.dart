import 'package:flutter/material.dart';
import 'quote.dart';

// custom widget class for Quote Card
class QuoteCard extends StatelessWidget {

  final Quote quote;
  final VoidCallback delete; // this is how to fire the delete function defined in main.dart
  const QuoteCard({super.key, required this.quote, required this.delete});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              quote.text,
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.grey[800],
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 10.0),
            Text(
              quote.author,
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 1.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end, // Aligns the content to the right
              children: [
                TextButton.icon(
                  onPressed: delete,
                  label: const Text('remove'),
                  icon: const Icon(Icons.delete, size: 16),
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.black, // Text color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
