import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_web/event/auth_event.dart';
import 'package:flutter_web/providers/app_auth_provider.dart';
import 'package:provider/provider.dart';

class EmailVerificationScreen extends StatefulWidget {
  static const routeName = "email-verification";

  @override
  _EmailVerificationScreenState createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  final _codeController = TextEditingController();
  final _codeFocusNode = FocusNode();

  late StreamSubscription<AuthEvent> _streamSubscription;

  @override
  void initState() {
    super.initState();
    _streamSubscription =
        context.read<AppAuthProvider>().authEventStream.listen((event) {
      event.whenOrNull(
        error: (e) => ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e)),
        ),
        onConfirmUserSuccess: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.green,
              content: Text("Email verification success"),
            ),
          );
          Navigator.of(context).pushReplacementNamed("/");
        },
      );
    });
  }

  @override
  void dispose() {
    _codeController.dispose();
    _codeFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Enter the code sent to your email",
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 200,
              child: TextField(
                controller: _codeController,
                focusNode: _codeFocusNode,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                maxLength: 6,
                obscureText: true,
                style: const TextStyle(
                  fontSize: 30, // 텍스트 크기를 24로 설정
                  // 여기에 추가적인 스타일 속성을 추가할 수 있습니다.
                ),
                decoration: const InputDecoration(
                  counterText: "",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Selector<AppAuthProvider, bool>(
                child: ElevatedButton(
                  onPressed: () async =>
                      await context.read<AppAuthProvider>().confirmUser(
                            confirmationCode: _codeController.text,
                          ),
                  child: const Text("Submit"),
                ),
                builder: (context, loading, child) =>
                    loading ? const CircularProgressIndicator() : child!,
                selector: (context, provider) => provider.state.loading)
          ],
        ),
      ),
    );
  }
}
