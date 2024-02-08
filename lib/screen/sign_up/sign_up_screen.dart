import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_web/event/auth_event.dart';
import 'package:flutter_web/providers/app_auth_provider.dart';
import 'package:flutter_web/screen/email_verification/email_verification_screen.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  static const String routeName = "sign-up";

  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _confirmPasswordFocusNode = FocusNode();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  late StreamSubscription<AuthEvent> _streamSubscription;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _streamSubscription =
        context.read<AppAuthProvider>().authEventStream.listen((event) {
      event.whenOrNull(
        error: (e) => ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e))),
        onCodeDelivery: (codeDeliveryDetails) => Navigator.of(context)
            .pushReplacementNamed(EmailVerificationScreen.routeName),
        onSignUpSuccess: () {
          Navigator.of(context)
              .pushReplacementNamed(EmailVerificationScreen.routeName);

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.green,
              content: Text("Email verification code sent. Check your email."),
            ),
          );
        },
      );
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
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
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          "Sign Up",
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
                                        FocusScope.of(context).requestFocus(
                                            _confirmPasswordFocusNode);
                                      },
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    TextFormField(
                                      controller: _confirmPasswordController,
                                      focusNode: _confirmPasswordFocusNode,
                                      obscureText: true,
                                      decoration: const InputDecoration(
                                        filled: true,
                                        hintText: "Confirm Password",
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
                                          return "re-enter password";
                                        }

                                        if (value !=
                                            _passwordController.value.text) {
                                          return "doesn't match with your password";
                                        }

                                        return null;
                                      },
                                      onFieldSubmitted: (value) {
                                        _confirmPasswordFocusNode.unfocus();
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
                                                  .signUp(
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
                                            "Sign Up",
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
