import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_web/event/auth_event.dart';
import 'package:flutter_web/providers/app_auth_provider.dart';
import 'package:flutter_web/screen/email_verification/email_verification_screen.dart';
import 'package:flutter_web/screen/sign_up/sign_up_screen.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatefulWidget {
  static const String routeName = "sign-in";

  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();

  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  late StreamSubscription<AuthEvent> _streamSubscription;

  @override
  void initState() {
    super.initState();
    _streamSubscription =
        context.read<AppAuthProvider>().authEventStream.listen((event) {
      event.whenOrNull(
        onSignInSuccess: () => Navigator.of(context).pushReplacementNamed("/"),
        confirmSignUp: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                  "you need to confirm your email. we sent you a code again. please check your email."),
            ),
          );
          Navigator.of(context).pushNamed(EmailVerificationScreen.routeName);
        },
        error: (e) => ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("something went wrong: $e"),
          ),
        ),
      );
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _streamSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: null,
        title: const Text(
          "Login",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 500,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.black12,
                                  offset: Offset(0, 2),
                                  blurRadius: 4.0)
                            ]),
                        child: Column(
                          children: [
                            Form(
                              key: _formKey,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 20,
                                ),
                                child: Column(
                                  children: [
                                    TextFormField(
                                      controller: _emailController,
                                      focusNode: _emailFocusNode,
                                      decoration: const InputDecoration(
                                        filled: true,
                                        hintText: "Email",
                                        prefixIcon: Icon(Icons.email),
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(30),
                                          ),
                                        ),
                                      ),
                                      validator: (value) {
                                        RegExp r = RegExp(
                                            r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)*\w[\w-]+$');

                                        if (value == null || value.isEmpty) {
                                          return "enter email";
                                        }

                                        if (!r.hasMatch(value)) {
                                          return "email format not correct";
                                        }

                                        return null;
                                      },
                                      onFieldSubmitted: (value) {
                                        _emailFocusNode.unfocus();
                                        FocusScope.of(context)
                                            .requestFocus(_passwordFocusNode);
                                      },
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    TextFormField(
                                      controller: _passwordController,
                                      focusNode: _passwordFocusNode,
                                      obscureText: true,
                                      decoration: const InputDecoration(
                                        filled: true,
                                        hintText: "Password",
                                        prefixIcon: Icon(Icons.password),
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(30),
                                          ),
                                        ),
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return "enter password";
                                        }

                                        if (value.length < 8) {
                                          return "more than 8 characters";
                                        }

                                        return null;
                                      },
                                      onFieldSubmitted: (value) {
                                        _passwordFocusNode.unfocus();
                                      },
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Selector<AppAuthProvider, bool>(
                                        child: ElevatedButton(
                                          onPressed: () async {
                                            FocusScope.of(context).unfocus();
                                            if (_formKey.currentState!
                                                .validate()) {
                                              await context
                                                  .read<AppAuthProvider>()
                                                  .signIn(
                                                    email:
                                                        _emailController.text,
                                                    password:
                                                        _passwordController
                                                            .text,
                                                  );
                                            }
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.blue,
                                          ),
                                          child: Text(
                                            "Login",
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium!
                                                .copyWith(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                        ),
                                        builder: (context, loading, child) =>
                                            loading
                                                ? const CircularProgressIndicator()
                                                : child!,
                                        selector: (context, provider) =>
                                            provider.state.loading),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () => Navigator.of(context)
                              .pushNamed(SignUpScreen.routeName),
                          child: const Text("Sign Up"),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
