import 'package:flutter/material.dart';
import '../Side_menu_bar_screens/advanced_settings.dart';
import '../Side_menu_bar_screens/faq.dart';
import '../Side_menu_bar_screens/feedback.dart';
import '../Side_menu_bar_screens/ratings.dart';
import 'detailed_screen.dart';
import 'add_meme_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  final List<Map<String, String>> allMemes = [
    {
      'image': 'https://media.tenor.com/8088grr8698AAAAM/minions-despicableme.gif',
      'audio': 'sounds/999-social-credit-siren.mp3',
      'name': '999 Social Credit Siren'
    },
    {
      'image':
          'https://i.pinimg.com/originals/77/20/6e/77206e385c863a5bc4e15df43e877817.gif',
      'audio': 'sounds/a-rat.mp3',
      'name': 'A Rat'
    },
    {
      'image':
          'https://media.tenor.com/cp84L59DBGMAAAAM/aaaaaaa.gif',
      'audio': 'sounds/aaaaaaaa-online-audio-converter_r9waVUO.mp3',
      'name': 'AAAAAAAAAAAAAAAAAAA'
    },
    {
      'image': 'https://media.tenor.com/zdO3lzqAQ4QAAAAM/john-cena-entrance.gif',
      'audio': 'sounds/and-his-name-is-john-cena-1_1.mp3',
      'name': 'And His Name Is John Cena'
    },
    {
      'image':
          'https://media.tenor.com/HNBWa_wyADYAAAAM/emoji-emoji-disintegrating.gif',
      'audio': 'sounds/auughhh.mp3',
      'name': 'Auughhh'
    },
    {
      'image':
          'https://media.tenor.com/ISfg1epIVZ0AAAAM/funny-smile.gif',
      'audio': 'sounds/baby_laugh.mp3',
      'name': 'Baby Laughing'
    },
    {
      'image':
          'https://media1.tenor.com/m/3j255wlMTcwAAAAC/chin-dabak-tam-tam-chota-bheem-gif-chota-bheem-meme.gif',
      'audio': 'sounds/chin-tapak-dum-dum.mp3',
      'name': 'Chin Tapak'
    },
    {
      'image': 'https://media1.tenor.com/m/pfd3ov2DcoMAAAAd/coffin-dance-dancing-pallbearers.gif',
      'audio': 'sounds/coffin_dance.mp3',
      'name': 'Coffin Dance'
    },
    {
      'image':
          'https://i.pinimg.com/736x/a5/cb/15/a5cb15dfd7e8682a953477bc4d4e07ff.jpg',
      'audio': 'sounds/comedy_sms_tonewapspell.mp3',
      'name': 'Comedy SMS'
    },
    {
      'image':
          'https://us-tuna-sounds-images.voicemod.net/84b1020b-fd17-45fb-b5ef-79de78f1bd71-1670168581804.jpg',
      'audio': 'sounds/daequan-come-here-boy-sound-effect.mp3',
      'name': 'Daequan'
    },
    {
      'image':
          'https://media.tenor.com/WHcbLJOEr2AAAAAj/triangle.gif',
      'audio': 'sounds/danger_alaram.mp3',
      'name': 'Danger Alarm'
    },
    {
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSIQGMZ5nGAMbV2BHXwWtqKJ93ydrzhTGpDCaCudLQhdiQpLypbyXlQoadiUMlqnXCfzRs',
      'audio': 'sounds/do-eeeweweewet.mp3',
      'name': 'Dooeeeweweewet'
    },
    {
      'image': 'https://media.tenor.com/zv5CqAGYFwYAAAAM/penguins-of-madagascar-rico.gif',
      'audio': 'sounds/dun_dun.mp3',
      'name': 'Dun Dun Dun'
    },
    {
      'image':
          'https://i.pinimg.com/originals/44/3b/2c/443b2cad1d319f9deec47e0a951703cf.gif',
      'audio': 'sounds/sound_1.mp3',
      'name': 'Eagle'
    },
    {
      'image':
          'https://i.pinimg.com/736x/fa/74/3d/fa743dc0941f2de87615416458c74cdb.jpg',
      'audio': 'sounds/emotional-damage-meme.mp3',
      'name': 'Emotional Damage'
    },
    {
      'image':
          'https://media.tenor.com/pwfOFSuqAMAAAAAM/cat-error.gif',
      'audio': 'sounds/error.mp3',
      'name': 'Error'
    },
    {
      'image':
          'https://24.media.tumblr.com/tumblr_lou7voQdP41r0ojhto1_500.gif',
      'audio': 'sounds/fail_sound.mp3',
      'name': 'Fail Sound'
    },
    {
      'image': 'https://media.tenor.com/nD0ooDylEw0AAAAM/bear-farting.gif',
      'audio': 'sounds/fart.mp3',
      'name': 'Fart'
    },
    {
      'image':
          'https://gifdb.com/images/high/animated-pepe-the-frog-kekw-reaction-meme-rbuhcz6c5i53vjtk.gif',
      'audio': 'sounds/frog.mp3',
      'name': 'Frog Laughing'
    },
    {
      'image': 'https://media.tenor.com/BLOZw5VmYA8AAAAM/brain.gif',
      'audio': 'sounds/galaxy_brain.mp3',
      'name': 'Galaxy Brain'
    },
    {
      'image':
          'https://media.tenor.com/Pr00EX97RAkAAAAM/gorgeous-funny-guy.gif',
      'audio': 'sounds/goofy-ahh-car-horn-200870.mp3',
      'name': 'Goofy'
    },
    {
      'image':
          'https://media1.tenor.com/m/grK7jtRobfMAAAAC/grand-theft-auto-carl-johnson.gif',
      'audio': 'sounds/gta-san-andreas-ah-shit-here-we-go-again_BWv0Gvc.mp3',
      'name': 'GTA'
    },
    {
      'image': 'https://media.tenor.com/kZDhfDomd98AAAAM/gun-jensen-ackles.gif',
      'audio': 'sounds/gunload-101soundboards.mp3',
      'name': 'Gunload'
    },
    {
      'image':
          'https://media.tenor.com/mjomtbOidvIAAAAM/screaming-screaming-man.gif',
      'audio': 'sounds/guy-yelling-among-us-sound-effect.mp3',
      'name': 'Guy Yelling'
    },
    {
      'image': 'https://media.tenor.com/LjCBqxySvecAAAAM/huh-rabbit.gif',
      'audio': 'sounds/huh.mp3',
      'name': 'Huhhhh'
    },
    {
      'image':
          'https://media.tenor.com/vk9up-ad1RcAAAAM/mama-mo-ikemen-horse.gif',
      'audio': 'sounds/insta_thud.mp3',
      'name': 'Insta Thudd'
    },
    {
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTKcQsBNwFftkAHOwQjmPPCtG-zgzzRc49nRQ&s',
      'audio': 'sounds/isnt-that-amazing-meme-sfx-172488.mp3',
      'name': 'Isnt that amazing'
    },
    {
      'image':
          'https://i.pinimg.com/originals/0f/17/e3/0f17e320fec4c7699f4f575c0e9eb81d.gif',
      'audio': 'sounds/its-in-the-game_TyOFKRF.mp3',
      'name': 'Its in the game'
    },
    {
      'image':
          'https://media.tenor.com/9hjq_ikvGNQAAAAM/hololive-kiryu-coco.gif',
      'audio': 'sounds/kiryu-coco-astronomia.mp3',
      'name': 'Kiryu Coco Astronomia'
    },
    {
      'image':
          'https://media.tenor.com/DeuFwQQX4FEAAAAM/loud-yelling.gif',
      'audio': 'sounds/loud-version_7n1qEm2.mp3',
      'name': 'Loud'
    },
    {
      'image': 'https://media.tenor.com/-t1oo-r1fp0AAAAM/duck-quack.gif',
      'audio': 'sounds/mac-quack.mp3',
      'name': 'Quack'
    },
    {
      'image':
          'https://media.tenor.com/amalpDTpMyQAAAAj/boy-cute.gif',
      'audio': 'sounds/meme.mp3',
      'name': 'Memme'
    },
    {
      'image':
          'https://media.tenor.com/7jzcecotWUIAAAAM/shocking-thambi-ramaiah.gif',
      'audio': 'sounds/my-movie-6_0RlWMvM.mp3',
      'name': 'My movie'
    },
    {
      'image':
          'https://gifdb.com/images/high/nagato-screaming-nani-uhxusl5378976ifu.gif',
      'audio': 'sounds/nani_full.mp3',
      'name': 'Nani Full'
    },
    {
      'image':
          'https://media.tenor.com/Q8BhzPnoQ5wAAAAM/omg-oh-my-god.gif',
      'audio': 'sounds/oh-my-god-meme.mp3',
      'name': 'Oh My God'
    },
    {
      'image':
          'https://gifdb.com/images/high/crying-baby-oh-no-8pbdtj73767avg6z.gif',
      'audio': 'sounds/oh_no.mp3',
      'name': 'Oh Nooooo'
    },
    {
      'image': 'https://media.tenor.com/fhmkaqT8wUoAAAAM/sleeping-beauty-bye.gif',
      'audio': 'sounds/run.mp3',
      'name': 'Run'
    },
    {
      'image': 'https://media.tenor.com/qFOocnb-G0YAAAAM/sad-upset.gif',
      'audio': 'sounds/sad_violon.mp3',
      'name': 'Sad Violon'
    },
    {
      'image':
          'https://media1.tenor.com/m/gCcqbYEvHowAAAAd/grinch-smile-grin.gif',
      'audio': 'sounds/scheming-weasel-faster-1-mp3cutn-mp3cut.mp3',
      'name': 'Scheming'
    },
    {
      'image':
          'https://i.gifer.com/22B.gif',
      'audio': 'sounds/scream.mp3',
      'name': 'Scream'
    },
    {
      'image':
          'https://i.pinimg.com/originals/a6/3a/ed/a63aed1c27b1f2c337d3899f7b2fa8fa.gif',
      'audio': 'sounds/shocked.mp3',
      'name': 'Shocked'
    },
    {
      'image':
          'https://media.tenor.com/rBbnGuWVaKQAAAAM/snoring-donald-duck.gif',
      'audio': 'sounds/snore-mimimimimimi.mp3',
      'name': 'Snore'
    },
    {
      'image':
          'https://ih1.redbubble.net/image.4669424528.1148/raf,360x360,075,t,fafafa:ca443f4786.jpg',
      'audio': 'sounds/sus-meme-sound-181271.mp3',
      'name': 'Sus Meme'
    },
    {
      'image':
          'https://media1.tenor.com/m/Jvd2yVUP4CgAAAAC/the-rock-think.gif',
      'audio': 'sounds/the-rock-meme.mp3',
      'name': 'The Rock'
    },
    {
      'image': 'https://media.tenor.com/43LAxBSfGMoAAAAM/baby-reaction-toddler.gif',
      'audio': 'sounds/tmp_z5b93np.mp3',
      'name': 'TMP'
    },
    {
      'image':
          'https://media.tenor.com/EStKzR-A3hsAAAAM/cat-scared-cat-reaction.gif',
      'audio': 'sounds/tmpbxydyrz3.mp3',
      'name': 'TMPB'
    },
    {
      'image':
          'https://media.tenor.com/2qxxQIwolLMAAAAM/chad.gif',
      'audio': 'sounds/tmpgj3wv0ae.mp3',
      'name': 'TMPG'
    },
    {
      'image': 'https://www.reactiongifs.com/r/wthell.gif',
      'audio': 'sounds/what-the-hell-meme-sound-effect.mp3',
      'name': 'What the hell'
    },
    {
      'image':
          'https://media.tenor.com/Is9Xevwt_E8AAAAM/checking-couple.gif',
      'audio': 'sounds/what_da_doing.mp3',
      'name': 'What Da Doing'
    },
    {
      'image':
          'https://substackcdn.com/image/fetch/f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fbucketeer-e05bbc84-baa3-437e-9518-adb32be77984.s3.amazonaws.com%2Fpublic%2Fimages%2Fb94bc422-eff5-4024-912b-b0b505dadb25_330x250.gif',
      'audio': 'sounds/women.mp3',
      'name': 'Women'
    },
    {
      'image': 'https://media.tenor.com/It6WN9CY4HMAAAAM/wow-oh-my-god.gif',
      'audio': 'sounds/wow.mp3',
      'name': 'Wowww'
    },
    {
      'image':
          'https://i.ytimg.com/vi/QP3My70rPZ4/hq720.jpg?sqp=-oaymwEXCK4FEIIDSFryq4qpAwkIARUAAIhCGAE=&rs=AOn4CLCEJeiF3UjLqUjWG3Q6NMCJF30evg',
      'audio': 'sounds/yt1s_NSjFWNC.mp3',
      'name': 'YT'
    },
  ];
  List<Map<String, String>> recentPlayedMemes = [];
  List<Map<String, String>> favoriteMemes = [];
  List<Map<String, String>> userCreatedMemes = [];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _markAsPlayed(Map<String, String> meme) {
    setState(() {
      if (!recentPlayedMemes.contains(meme)) {
        recentPlayedMemes.add(meme);
      }
    });
  }

  void _toggleFavorite(Map<String, String> meme) {
    setState(() {
      if (favoriteMemes.contains(meme)) {
        favoriteMemes.remove(meme);
      } else {
        favoriteMemes.add(meme);
      }
    });
  }

  void _deleteMeme(Map<String, String> meme) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Delete Meme'),
        content: Text('Are you sure you want to delete this meme?'),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                userCreatedMemes.remove(meme);
              });
              Navigator.of(context).pop();
            },
            child: Text('Delete'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Cancel'),
          ),
        ],
      ),
    );
  }

  void _createMeme() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddMemeScreen(
          onMemeAdded: (newMeme) {
            setState(() {
              userCreatedMemes.add(newMeme);
            });
          },
          onMemeDeleted: (meme) {
            setState(() {
              userCreatedMemes.remove(meme);
            });
          },
        ),
      ),
    );
  }

  List<Map<String, String>> get _currentList {
    switch (_selectedIndex) {
      case 1:
        return recentPlayedMemes;
      case 2:
        return favoriteMemes;
      case 3:
        return userCreatedMemes;
      case 0:
      default:
        return allMemes;
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isEmpty = _currentList.isEmpty;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sound of Meme',
          style: TextStyle(
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
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu, size: 30, color: Colors.white),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 250,
              child: Image.network(
                'https://play-lh.googleusercontent.com/ZEEUSYvNMQ6qveAhUUesAXjdQLniiC7O_69sBYE78qJVI-qKxf2ffT2nFWl4wyD3UsI',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 10.0),
            ListTile(
              leading: Icon(Icons.settings, size: 28),
              title: Text('Advanced Settings'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AdvancedSettingsScreen(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.question_answer, size: 28),
              title: Text('FAQs'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FaqsScreen(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.feedback, size: 28),
              title: Text('Feedback'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FeedbackScreen(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.star_rate, size: 28),
              title: Text('Rate Us'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RatingScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: isEmpty && _selectedIndex == 1
          ? Center(
        child: Text(
          'No recent played memes',
          style: TextStyle(fontSize: 18, color: Colors.grey[600]),
        ),
      )
          : isEmpty && _selectedIndex == 2
          ? Center(
        child: Text(
          'No favorite memes',
          style: TextStyle(fontSize: 18, color: Colors.grey[600]),
        ),
      )
          : isEmpty && _selectedIndex == 3
          ? Center(
        child: ElevatedButton(
          onPressed: _createMeme,
          child: Icon(Icons.add, size: 60),
          style: ElevatedButton.styleFrom(
            shape: CircleBorder(),
            padding: EdgeInsets.all(20),
            primary: Colors.orangeAccent, // Button color
          ),
        ),
      )
          : ListView.builder(
        padding: EdgeInsets.all(10.0),
        itemCount: _currentList.length,
        itemBuilder: (context, index) {
          final item = _currentList[index];
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 5,
            child: ListTile(
              contentPadding: EdgeInsets.all(10),
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  item['image']!,
                  height: 80.0,
                  width: 80.0,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(
                item['name']!,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.red[300],
                  shadows: [
                    Shadow(
                      blurRadius: 2.0,
                      color: Colors.black.withOpacity(0.2),
                      offset: Offset(1.0, 1.0),
                    ),
                  ],
                ),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(
                      favoriteMemes.contains(item)
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: favoriteMemes.contains(item)
                          ? Colors.red
                          : Colors.grey,
                    ),
                    onPressed: () => _toggleFavorite(item),
                  ),
                  if (_selectedIndex == 3) // Only show delete button in 'Your Memes' section
                    IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () => _deleteMeme(item),
                    ),
                ],
              ),
              onTap: () {
                _markAsPlayed(item);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailedScreen(item: item),
                  ),
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: _selectedIndex == 3 && _currentList.isNotEmpty
          ? FloatingActionButton(
        onPressed: _createMeme,
        child: Icon(Icons.add),
        backgroundColor: Colors.orangeAccent,
      )
          : null,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.list, size: 30),
            label: 'All Memes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history, size: 30),
            label: 'Recent Played',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite, size: 30),
            label: 'Favorite Memes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box, size: 30),
            label: 'Your Memes',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepOrangeAccent,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}