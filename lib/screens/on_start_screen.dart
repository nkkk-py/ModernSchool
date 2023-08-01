import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:modern_school/components/my_button.dart';
import 'package:modern_school/screens/activate_account_screen.dart';
import 'package:modern_school/screens/login_screen.dart';
import 'package:modern_school/screens/widgets/caroussel_splash_screen.dart';
// import 'widgets/skip_splash_bouton.dart';

class OnStartScreen extends StatefulWidget {
  const OnStartScreen({super.key});

  @override
  State<OnStartScreen> createState() => _OnStartScreenState();
}

class _OnStartScreenState extends State<OnStartScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    // Future.delayed(const Duration(seconds: 5), () {
    //   Navigator.of(context).pushReplacement(MaterialPageRoute(
    //     builder: (_) => const LoginScreen(),
    //   ));
    // });
  }

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/background_splash.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.white.withOpacity(0.0), Colors.white],
              begin: Alignment.center,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(
                image: AssetImage('images/MS-logo-1280x317.png'),
              ),
              const Divider(height: 20),
              // const Text(
              //   'A smart tool for a smart school',
              //   style: TextStyle(
              //     fontStyle: FontStyle.italic,
              //     color: Colors.black,
              //     fontSize: 20,
              //   ),
              // ),
              Container(
                margin: const EdgeInsets.all(5.0),
                height: 295.0,
                width: 333.0,
                child: const ImageCarousel(),
                // ListView(
                //   scrollDirection: Axis.horizontal, // <-- Like so
                //   children: const [
                //     Image(
                //       image: AssetImage('assets/images/MS-logo-1280x317.png'),
                //     ),
                //     Image(
                //       image: AssetImage('assets/images/MS-logo-1280x317.png'),
                //     ),
                //     Image(
                //       image: AssetImage('assets/images/MS-logo-1280x317.png'),
                //     ),
                //   ],
                // ),
              ),
              // ElevatedButton(
              //     // style:ButtonStyle(
              //     //   backgroundColor: ),
              //     onPressed: () {
              //       Navigator.of(context).pushReplacement(
              //         MaterialPageRoute(
              //           builder: (_) => LoginScreen(),
              //         ),
              //       );
              //     },
              //     child: const Text('Click Here',
              //         style: TextStyle(
              //           color: Colors.black,
              //         ))),
              MyButton(
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (_) => ActivateAccountScreen(),
                    ),
                  );
                },
                textWidget: const Text(
                  'Activate an account',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25.0, vertical: 5.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'Or just',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                  ],
                ),
              ),
              MyButton(
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (_) => LoginScreen(),
                    ),
                  );
                },
                textWidget: const Text(
                  'Sign in',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
