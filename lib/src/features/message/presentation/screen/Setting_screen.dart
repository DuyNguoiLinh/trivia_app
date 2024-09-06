import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/screen/home_screen.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/widget/home_widget/draw_setting.dart';
import 'package:trivia_app_with_flutter/src/features/questions/presentation/widget/home_widget/home.dart';

// Route createPopRoute() {
//   return PageRouteBuilder(
//     pageBuilder: (context, animation, secondaryAnimation) => const SettingScreen(),
//     transitionsBuilder: (context, animation, secondaryAnimation, child) {
//       return SlideTransition(
//         position: Tween<Offset>(
//           begin: const Offset(0.0, 0.0),
//           end: const Offset(0.0, 1.0),
//         ).animate(CurvedAnimation(
//           parent: animation,
//           curve: Curves.easeIn,
//         )),
//         child: FadeTransition(
//           opacity: Tween<double>(
//             begin: 0.8,
//             end: 0.0,
//           ).animate(CurvedAnimation(
//             parent: animation,
//             curve: Curves.easeIn,
//           )),
//           child: const SettingScreen(),
//         ),
//       );
//     },
//   );
// }

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  _SettingscreenState createState() => _SettingscreenState();
}

class _SettingscreenState extends State<SettingScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller0;
  late AnimationController _controller1;
  late AnimationController _controller2;
  late AnimationController _controller3;

  late Animation<double> _fadeAnimation0;
  late Animation<double> _fadeAnimation1;
  late Animation<double> _fadeAnimation2;
  late Animation<double> _fadeAnimation3;

  late Animation<Offset> _offsetAnimation0;
  late Animation<Offset> _offsetAnimation1;
  late Animation<Offset> _offsetAnimation2;
  late Animation<Offset> _offsetAnimation3;



  @override
  void initState() {
    super.initState();
    const int slow = 1;

    _controller0 = AnimationController(
      duration: const Duration(milliseconds: 200 ~/ slow),
      vsync: this,
    );

    _controller1 = AnimationController(
      duration: const Duration(milliseconds: 300 ~/ slow),
      vsync: this,
    );

    _controller2 = AnimationController(
      duration: const Duration(milliseconds: 800 ~/ slow),
      vsync: this,
    );

    _controller3 = AnimationController(
      duration: const Duration(milliseconds: 880 ~/ slow),
      vsync: this,
    );

    _fadeAnimation0 = Tween<double>(
      begin: 0.5,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller0,
      curve: Curves.fastOutSlowIn,
    ));

    _fadeAnimation1 = Tween<double>(
      begin: 0.3,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller1,
      curve: Curves.slowMiddle,
    ));

    _fadeAnimation2 = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller2,
      curve: Curves.easeInOut,
    ));

    _fadeAnimation3 = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller3,
      curve: Curves.slowMiddle,
    ));

    _offsetAnimation0 = Tween<Offset>(
      begin: const Offset(0.0, 0.1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller0,
      curve: Curves.easeInOut,
    ));

    _offsetAnimation1 = Tween<Offset>(
      begin: const Offset(0.0, 0.1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller1,
      curve: Curves.linearToEaseOut
    ));

    _offsetAnimation2 = Tween<Offset>(
      begin: const Offset(0.0, 0.8),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller2,
      curve: Curves.linearToEaseOut,
    ));

    _offsetAnimation3 = Tween<Offset>(
      begin: const Offset(0.0, 0.9),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller3,
      curve: Curves.linearToEaseOut,
    ));
    _startAnimations();

  }

  Future<void> _startAnimations() async {
    await _controller0.forward();
    _controller1.forward();
    // await Future.delayed(const Duration(milliseconds: 500));
    _controller2.forward();
    _controller3.forward();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FadeTransition(
            opacity: _fadeAnimation0,
            child: SlideTransition(
              position: _offsetAnimation0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    'Setting',
                    style: TextStyle(fontSize: 26, color: Colors.white),
                  ),
                  const SizedBox(),
                  IconButton(
                    icon: const Icon(
                      Icons.cancel_outlined,
                      size: 35,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      GoRouter.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          ),

          FadeTransition(
            opacity: _fadeAnimation1,
            child: SlideTransition(
              position: _offsetAnimation1,
              child: Container(
                margin: const EdgeInsets.only(
                    bottom: 80, left: 20, right: 20, top: 80),
                height: 180,
                color: Colors.blueAccent,
                child: const Center(
                  child: Text(
                    'Content 1',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          FadeTransition(
            opacity: _fadeAnimation2,
            child: SlideTransition(
              position: _offsetAnimation2,
              child: Container(
                margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
                height: 80,
                color: Colors.red.withOpacity(0.8),
                child: const Center(
                  child: Text(
                    'Content 2',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          FadeTransition(
            opacity: _fadeAnimation3,
            child: SlideTransition(
              position: _offsetAnimation3,
              child: Container(
                margin: const EdgeInsets.only(bottom: 50, left: 20, right: 20),
                height: 150,
                color: Colors.green.withOpacity(0.8),
                child: const Center(
                  child: Text(
                    'Content 3',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    super.dispose();
  }
}
