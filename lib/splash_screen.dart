import 'package:flutter/material.dart';
import 'login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OSIS: NEXT GEN',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    
    _colorAnimation = ColorTween(
      begin: const Color(0xFF006C2E), // Hijau tua
      end: Colors.white,
    ).animate(_animationController);

    Future.delayed(const Duration(milliseconds: 500), () {
      _animationController.forward();
    });

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Future.delayed(const Duration(milliseconds: 300), () {
          Navigator.of(context).pushReplacement(
            PageRouteBuilder(
              transitionDuration: const Duration(milliseconds: 800),
              pageBuilder: (context, animation, secondaryAnimation) => const WelcomePage(),
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                final fade = Tween(begin: 0.0, end: 1.0).animate(animation);
                return FadeTransition(
                  opacity: fade,
                  child: child,
                );
              },
            ),
          );
        });
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _colorAnimation,
      builder: (context, child) {
        return Scaffold(
          backgroundColor: _colorAnimation.value,
          body: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Image.asset(
                'assets/icon/logo_warna.png',
                width: 300,
                height: 300,
                fit: BoxFit.contain,
              ),
            ),
          ),
        );
      },
    );
  }
}

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _logoSlideAnimation;
  late Animation<Offset> _buttonSlideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _logoSlideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.1), // Mulai sedikit di bawah
      end: const Offset(0, -0.1),  // Sedikit naik ke atas
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOutBack,
      ),
    );

    _buttonSlideAnimation = Tween<Offset>(
      begin: const Offset(0, 1), // Mulai di bawah layar
      end: const Offset(0, 0),   // Muncul ke posisi normal
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOut,
      ),
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildLogo() {
    return SlideTransition(
      position: _logoSlideAnimation,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Image.asset(
            'assets/icon/logo_warna.png',
            width: 300,
            height: 300,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }

  Widget _buildLoginButton() {
    return SlideTransition(
      position: _buttonSlideAnimation,
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: Padding(
          padding: const EdgeInsets.only(left: 24.0, right: 24.0, bottom: 40.0),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[800],
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    transitionDuration: const Duration(milliseconds: 700),
                    pageBuilder: (context, animation, secondaryAnimation) => LoginPage(),
                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                      final fade = Tween(begin: 0.0, end: 1.0).animate(animation);
                      return FadeTransition(
                        opacity: fade,
                        child: child,
                      );
                    },
                  ),
                );
              },
              child: const Text(
                'Login',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: _buildLogo()),
            _buildLoginButton(),
          ],
        ),
      ),
    );
  }
}
