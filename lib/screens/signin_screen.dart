import 'package:animations/animations.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it_done/bloc/signin_email_bloc.dart';
import 'package:ionicons/ionicons.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({Key? key}) : super(key: key);

  static const path = '/email';
  static const name = 'Sign in screen';

  @override
  _SigninScreenState createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  int _page = 0;

  Future<bool> _onWillPop() async {
    if (_page == 1) {
      setState(() {
        _page = 0;
      });
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          leading: const BackButton(),
          title: const Text('Sign up/Sign in'),
        ),
        body: BlocProvider(
          create: (context) => SigninEmailBloc(),
          child: PageTransitionSwitcher(
            reverse: _page == 0,
            transitionBuilder: (child, primaryAnimation, secondaryAnimation) =>
                SharedAxisTransition(
              child: child,
              animation: primaryAnimation,
              secondaryAnimation: secondaryAnimation,
              transitionType: SharedAxisTransitionType.horizontal,
            ),
            child: _page == 0
                ? EmailPage(next: () {
                    setState(() {
                      _page = 1;
                    });
                  })
                : const FinalPage(),
          ),
        ),
      ),
    );
  }
}

class EmailPage extends StatefulWidget {
  final void Function() next;
  const EmailPage({Key? key, required this.next}) : super(key: key);

  @override
  _EmailPageState createState() => _EmailPageState();
}

class _EmailPageState extends State<EmailPage> {
  String _email = '';

  final _formKey = GlobalKey<FormState>();
  late FocusNode _focusNode;

  @override
  void initState() {
    FirebaseAnalytics.instance.setCurrentScreen(screenName: SigninScreen.name);
    _focusNode = FocusNode();
    Future.delayed(const Duration(milliseconds: 350), () {
      setState(() {
        _focusNode.requestFocus();
      });
    });
    final emailState = BlocProvider.of<SigninEmailBloc>(context).state;
    if (emailState is SigninEmailFilled) {
      setState(() {
        _email = emailState.email;
      });
    }
    super.initState();
  }

  void handleSubmit() {
    if (!_formKey.currentState!.validate()) return;
    widget.next();
    final emailBloc = BlocProvider.of<SigninEmailBloc>(context);
    emailBloc.add(SetSigninEmail(_email));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Enter your email address',
            style: Theme.of(context).textTheme.displaySmall,
          ),
          const SizedBox(
            height: 20.0,
          ),
          Form(
            key: _formKey,
            child: TextFormField(
              initialValue: _email,
              focusNode: _focusNode,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'email address',
              ),
              onChanged: (v) {
                setState(() {
                  _email = v;
                });
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (v) {
                if (v == null || v == '') return 'The email is required';
                if (!RegExp(
                        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                    .hasMatch(v)) return 'Invalid email';
                return null;
              },
            ),
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
                onPressed: handleSubmit,
                icon: const Icon(Ionicons.mail_outline),
                label: const Text('Sign in with email'),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class FinalPage extends StatefulWidget {
  const FinalPage({Key? key}) : super(key: key);

  @override
  FinalPageState createState() => FinalPageState();
}

class FinalPageState extends State<FinalPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<SigninEmailBloc, SigninEmailState>(
        builder: (context, state) {
          if (state is SigninEmailFilled) {
            return Text(state.email);
          }
          return const Text('This will never show up');
        },
      ),
    );
  }
}
