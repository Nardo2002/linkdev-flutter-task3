import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _loadingBarAnimation;
  late Animation<AlignmentGeometry> _iconAlignmentAnimation;
  late Animation<AlignmentGeometry> _containerAlignmentAnimation;
  late Animation<double> _barAlignmentAnimation;
  late Animation<double> _loginComponentsAnimation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 4));
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _iconAlignmentAnimation = Tween<AlignmentGeometry>(
            begin: Alignment.bottomCenter, end: Alignment.center)
        .animate(CurvedAnimation(
            parent: _controller,
            curve: const Interval(0.0, 0.3, curve: Curves.easeInOut)));

    _barAlignmentAnimation = Tween<double>(begin: -100, end: 50).animate(
        CurvedAnimation(
            parent: _controller,
            curve: const Interval(0.0, 0.3, curve: Curves.easeInOut)));

    _loadingBarAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: _controller,
            curve: const Interval(0.3, 0.6, curve: Curves.easeInOut)));

    _containerAlignmentAnimation = Tween<AlignmentGeometry>(
            begin: Alignment.center, end: Alignment.topCenter)
        .animate(CurvedAnimation(
            parent: _controller,
            curve: const Interval(0.6, 0.9, curve: Curves.easeInOut)));

    _loginComponentsAnimation =
        Tween<double>(begin: MediaQuery.of(context).size.height, end: 0)
            .animate(CurvedAnimation(
                parent: _controller,
                curve: const Interval(0.7, 1.0, curve: Curves.easeInOut)));

    return Scaffold(
        appBar: AppBar(actions: [
          TweenAnimationBuilder(
          duration: const Duration(seconds: 3),
          tween: Tween<Offset>(
              begin:Offset(MediaQuery.of(context).size.width, 0),
              end: Offset(MediaQuery.of(context).size.width * 0.02, 0),),
          builder: (BuildContext context, Offset value, Widget? child) {
            return Transform.translate(
              offset: value,
              child: Row(
              children: [
                const Text(
                  'Skip',
                ),
                IconButton(
                  icon: Icon(Icons.arrow_forward, color: Colors.pink[700]),
                  iconSize: MediaQuery.of(context).size.width * 0.04,
                  onPressed: () {},
                ),
              ],
            ),
            );
          },
        ),
        ]),
        body: Stack(
          children: [
            AlignTransition(
                alignment: _containerAlignmentAnimation,
                child: Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/background.png'),
                          fit: BoxFit.cover)),
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width,
                  child: AlignTransition(
                      alignment: _iconAlignmentAnimation,
                      child: const Image(
                        image: AssetImage('assets/images/instock_img.png'),
                      )),
                )),
            // Loading Bar
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Positioned(
                  bottom: _barAlignmentAnimation.value,
                  left: MediaQuery.of(context).size.width / 2 - 80,
                  child: _loadingBarAnimation.value > 0 &&
                          _loadingBarAnimation.value < 1
                      ? SizedBox(
                          width: 160,
                          height: 5,
                          child: LinearProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation(Colors.pink[700]),
                            value: _loadingBarAnimation.value,
                          ),
                        )
                      : const SizedBox(),
                );
              },
            ),
            // Login Screen Components
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(0, _loginComponentsAnimation.value),
                  child: const LoginScreen(),
                );
              },
            ),
          ],
        ));
  }
}
