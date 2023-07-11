import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/custom_colors.dart';

class SuccessSignUpScreen extends ConsumerWidget {
  const SuccessSignUpScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: CustomColors.mainGreen,
        appBar: AppBar(
          backgroundColor: CustomColors.mainGreen,
        ),
        body: SafeArea(
          child: Text("Success"),
        ),
      ),
    );
  }
}
