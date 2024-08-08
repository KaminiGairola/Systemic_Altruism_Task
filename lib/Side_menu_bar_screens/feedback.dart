import 'package:flutter/material.dart';

class FeedbackScreen extends StatefulWidget {
  @override
  _FeedbackScreenState createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  final _formKey = GlobalKey<FormState>();
  final _feedbackController = TextEditingController();

  @override
  void dispose() {
    _feedbackController.dispose();
    super.dispose();
  }

  void _submitFeedback() {
    if (_formKey.currentState!.validate()) {
      // Here you can send the feedback to your server or handle it as needed
      print('Feedback submitted: ${_feedbackController.text}');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Thank you for your feedback!')),
      );
      _feedbackController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feedback', style: TextStyle(fontWeight: FontWeight.bold)),
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
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            elevation: 5.0,
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(
                      'We value your feedback!',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurpleAccent,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                      controller: _feedbackController,
                      decoration: InputDecoration(
                        labelText: 'Enter your feedback',
                        labelStyle: TextStyle(color: Colors.deepPurpleAccent),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepPurpleAccent, width: 2.0),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      maxLines: 5,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your feedback';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20.0),
                    ElevatedButton(
                      onPressed: _submitFeedback,
                      child: Text('Submit',style: TextStyle(color: Colors.white),),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.deepPurpleAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
