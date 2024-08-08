import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )..repeat(reverse: true);

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    SchedulerBinding.instance.addPostFrameCallback((_) {
      Future.delayed(Duration(seconds: 3), () {
        Navigator.of(context).pushReplacementNamed('/home');
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.orangeAccent, Colors.pinkAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FadeTransition(
                opacity: _fadeAnimation,
                child: ScaleTransition(
                  scale: _scaleAnimation,
                  child: Icon(
                    Icons.smart_toy_rounded, // You can use any icon here
                    size: 120.0,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              FadeTransition(
                opacity: _fadeAnimation,
                child: ScaleTransition(
                  scale: _scaleAnimation,
                  child: Text(
                    'Meme App',
                    style: TextStyle(
                      fontSize: 28.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          blurRadius: 4.0,
                          color: Colors.black.withOpacity(0.4),
                          offset: Offset(2.0, 2.0),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15.0),
              CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: 3.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
