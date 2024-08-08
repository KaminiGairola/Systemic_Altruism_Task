import 'package:flutter/material.dart';

class AdvancedSettingsScreen extends StatefulWidget {
  @override
  _AdvancedSettingsScreenState createState() => _AdvancedSettingsScreenState();
}

class _AdvancedSettingsScreenState extends State<AdvancedSettingsScreen> {
  String _playbackSpeed = '1.0';
  String _audioQuality = 'High';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Advanced Settings', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.deepPurpleAccent,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purple.shade100, Colors.purple.shade300],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Playback Settings',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            SizedBox(height: 20.0),
            _buildSettingTile(
              title: 'Playback Speed',
              subtitle: 'Adjust the playback speed of audio',
              value: _playbackSpeed,
              items: [
                DropdownMenuItem(child: Text('0.5x'), value: '0.5'),
                DropdownMenuItem(child: Text('1.0x'), value: '1.0'),
                DropdownMenuItem(child: Text('1.5x'), value: '1.5'),
                DropdownMenuItem(child: Text('2.0x'), value: '2.0'),
              ],
              onChanged: (value) {
                setState(() {
                  _playbackSpeed = value!;
                });
              },
            ),
            SizedBox(height: 20.0),
            _buildSettingTile(
              title: 'Audio Quality',
              subtitle: 'Select audio quality',
              value: _audioQuality,
              items: [
                DropdownMenuItem(child: Text('High'), value: 'High'),
                DropdownMenuItem(child: Text('Medium'), value: 'Medium'),
                DropdownMenuItem(child: Text('Low'), value: 'Low'),
              ],
              onChanged: (value) {
                setState(() {
                  _audioQuality = value!;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingTile({
    required String title,
    required String subtitle,
    required String value,
    required List<DropdownMenuItem<String>> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: DropdownButton<String>(
          value: value,
          underline: SizedBox(),
          icon: Icon(Icons.arrow_drop_down),
          items: items,
          onChanged: onChanged,
        ),
      ),
    );
  }
}
