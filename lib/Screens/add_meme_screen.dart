import 'package:flutter/material.dart';

class AddMemeScreen extends StatefulWidget {
  final Function(Map<String, String>) onMemeAdded;
  final Function(String) onMemeDeleted;

  const AddMemeScreen({
    super.key,
    required this.onMemeAdded,
    required this.onMemeDeleted,
  });

  @override
  _AddMemeScreenState createState() => _AddMemeScreenState();
}

class _AddMemeScreenState extends State<AddMemeScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _imageUrlController = TextEditingController();
  final _audioUrlController = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final newMeme = {
        'name': _nameController.text,
        'image': _imageUrlController.text,
        'audio': _audioUrlController.text,
      };

      widget.onMemeAdded(newMeme);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Meme',style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w700,
          color: Colors.white,
          shadows: [
            Shadow(
              blurRadius: 6.0,
              color: Colors.black.withOpacity(0.5),
              offset: Offset(2.0, 2.0),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.orangeAccent, Colors.pinkAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Meme Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a name for the meme';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: _imageUrlController,
                  decoration: InputDecoration(
                    labelText: 'Image URL',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter an image URL';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: _audioUrlController,
                  decoration: InputDecoration(
                    labelText: 'Audio URL',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter an audio URL';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 24.0),
                ElevatedButton(
                  onPressed: _submitForm,
                  child: Text('Add Meme',style: TextStyle(color: Colors.white),),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.redAccent,
                    padding: EdgeInsets.symmetric(vertical: 15.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
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
