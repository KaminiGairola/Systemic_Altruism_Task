import 'package:flutter/material.dart';

class RatingScreen extends StatefulWidget {
  @override
  _RatingScreenState createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  double _rating = 0.0;

  void _submitRating() {
    // Here you can send the rating to your server or handle it as needed
    print('Rating submitted: $_rating');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Thank you for your rating!')),
    );
  }

  Widget _buildStar(int index) {
    if (index < _rating) {
      return Icon(Icons.star, color: Colors.amber, size: 48.0);
    } else {
      return Icon(Icons.star_border, color: Colors.amber, size: 48.0);
    }
  }

  Widget _buildRatingBar() {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      elevation: 5.0,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(5, (index) {
            return IconButton(
              icon: _buildStar(index),
              onPressed: () {
                setState(() {
                  _rating = index + 1.0;
                });
              },
            );
          }),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rate Us', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.deepPurpleAccent,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple.shade50, Colors.deepPurple.shade200],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Please rate our app',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurpleAccent,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20.0),
                _buildRatingBar(),
                SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: _submitRating,
                  child: Text('Submit', style: TextStyle(fontSize: 18.0,color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.deepPurpleAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 12.0),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
