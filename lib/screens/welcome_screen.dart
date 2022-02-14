import 'package:animations/animations.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it_done/screens/signin_screen.dart';
import 'package:get_it_done/utils/colors.dart';
import 'package:get_it_done/utils/sign_in_with_google.dart';
import 'package:ionicons/ionicons.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  static const path = '/';
  static const screenName = 'Welcome screen';

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    FirebaseAnalytics.instance
        .setCurrentScreen(screenName: WelcomeScreen.screenName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Get It Done'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: Container(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 50.0,
                          child: OutlinedButton(
                            onPressed: () {
                              signInWithGoogle();
                            },
                            child: const Icon(Ionicons.logo_google),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15.0,
                      ),
                      Expanded(
                        child: SizedBox(
                          height: 50.0,
                          child: OutlinedButton(
                            onPressed: () {},
                            child: const Icon(Ionicons.logo_facebook),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Hero(
                    tag: 'signin',
                    child: SizedBox(
                      height: 50.0,
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            // fullscreenDialog: true,
                            builder: (_) => const SigninScreen(),
                          ));
                        },
                        icon: const Icon(Ionicons.mail_outline),
                        label: const Text('Sign in with email'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
