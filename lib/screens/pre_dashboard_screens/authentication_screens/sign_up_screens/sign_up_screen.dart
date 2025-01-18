import 'package:flutter/material.dart';
import '../../../../widgets/custom_circular_progress.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: size.height * 0.04,
                ),
                SizedBox(
                    height: size.height * 0.18,
                    child: CustomCircularProgress(
                        progress: index == 0 ? 0 : (index == 1 ? 50 : 75))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
