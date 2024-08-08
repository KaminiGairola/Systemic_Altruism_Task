import 'package:flutter/material.dart';

class FaqsScreen extends StatelessWidget {
  final List<Map<String, String>> faqs = [
    {
      'question': 'How do I use this app?',
      'answer': 'Simply browse the memes and tap on any meme to play the sound.'
    },
    {
      'question': 'Can I share memes with others?',
      'answer': 'Yes, you can share memes by tapping the share button on the detailed screen.'
    },
    {
      'question': 'How do I change playback speed?',
      'answer': 'You can change the playback speed in the advanced settings section.'
    },
    // Add more FAQs as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FAQs', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.deepPurpleAccent,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purple.shade50, Colors.purple.shade200],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: faqs.length,
          itemBuilder: (context, index) {
            final faq = faqs[index];
            return Container(
              margin: EdgeInsets.symmetric(vertical: 8.0),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.orangeAccent, Colors.pinkAccent],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 6.0,
                    color: Colors.black.withOpacity(0.5),
                    offset: Offset(2.0, 2.0),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Card(
                  margin: EdgeInsets.all(0.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  elevation: 0,
                  child: ExpansionTile(
                    title: Text(
                      faq['question']!,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    children: [
                      Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(faq['answer']!),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
