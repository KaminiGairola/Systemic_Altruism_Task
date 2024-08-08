import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class DetailedScreen extends StatefulWidget {
  final Map<String, String> item;

  const DetailedScreen({super.key, required this.item});

  @override
  _DetailedScreenState createState() => _DetailedScreenState();
}

class _DetailedScreenState extends State<DetailedScreen> with SingleTickerProviderStateMixin {
  late final AudioPlayer player;
  bool isPlaying = false;
  bool isFavorited = false;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    player = AudioPlayer();
    player.onPlayerStateChanged.listen((PlayerState state) {
      setState(() {
        isPlaying = state == PlayerState.playing;
      });
    });

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    )..repeat(reverse: true);
  }

  void _toggleFavorite() {
    setState(() {
      isFavorited = !isFavorited;
    });
  }

  void _shareContent() {
    Share.share(
      'Check out this meme: ${widget.item['name']}! ${widget.item['image']}',
      subject: 'Meme Share',
    );
  }

  void _reportContent() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Report Content'),
        content: Text('Are you sure you want to report this content?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              // Implement reporting functionality here
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Content reported successfully')),
              );
            },
            child: Text('Yes'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('No'),
          ),
        ],
      ),
    );
  }

  void _showOptionsMenu() {
    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(
        MediaQuery.of(context).size.width - 100, // Position from the right
        80.0, // Position from the top
        0.0,
        0.0,
      ),
      items: [
        PopupMenuItem(
          child: ListTile(
            leading: Icon(Icons.share),
            title: Text('Share'),
            onTap: () {
              Navigator.pop(context); // Close the menu
              _shareContent();
            },
          ),
        ),
        PopupMenuItem(
          child: ListTile(
            leading: Icon(Icons.report_problem),
            title: Text('Report'),
            onTap: () {
              Navigator.pop(context); // Close the menu
              _reportContent();
            },
          ),
        ),
        // Add more options here if needed
      ],
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(widget.item['name']!, style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,color: Colors.white)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: Colors.white,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.orangeAccent, Colors.pinkAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                blurRadius: 6.0,
                color: Colors.black.withOpacity(0.5),
                offset: Offset(2.0, 2.0),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert, color: Colors.white),
            onPressed: _showOptionsMenu,
          ),
        ],
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.network(
              widget.item['image']!,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Center(
                child: Icon(Icons.error, color: Colors.red),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black.withOpacity(0.6), Colors.transparent],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                stops: [0, 0.5],
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Center(
                child: ScaleTransition(
                  scale: Tween(begin: 1.0, end: 1.1).animate(CurvedAnimation(
                    parent: _animationController,
                    curve: Curves.easeInOut,
                  )),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.amber, Colors.orange, Colors.pink],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: IconButton(
                      icon: Icon(
                        isPlaying ? Icons.pause_circle_filled : Icons.play_circle_filled,
                        size: 80.0,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        if (isPlaying) {
                          player.pause();
                        } else {
                          player.play(AssetSource(widget.item['audio']!));
                        }
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
