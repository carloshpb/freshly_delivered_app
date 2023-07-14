import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../common_widgets/custom_snackbar.dart';
import '../../../../constants/custom_colors.dart';
import '../../../../constants/strings.dart';
import '../../../../routers/app_router.dart';
import '../controllers/success_sign_up_controller.dart';

class SuccessSignUpScreen extends ConsumerStatefulWidget {
  const SuccessSignUpScreen({
    super.key,
  });

  @override
  ConsumerState<SuccessSignUpScreen> createState() =>
      _SuccessSignUpScreenState();
}

class _SuccessSignUpScreenState extends ConsumerState<SuccessSignUpScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(
        const Duration(
          seconds: 3,
        ),
      );
      ref.read(goRouterProvider).pushReplacement(AppRouter.home.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    // error handling
    ref.listen<AsyncValue<void>>(
      successSignUpControllerProvider,
      (previousState, nextState) => nextState.whenOrNull(
        error: (error, stackTrace) {
          CustomSnackbar.showErrorToast(context, 'Error', error.toString());
        },
      ),
    );

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: CustomColors.mainGreen,
        appBar: AppBar(
          backgroundColor: CustomColors.mainGreen,
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                Strings.success,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Image.asset('assets/images/confirm_ball.png'),
              const Center(
                child: SizedBox(
                  width: 302.0,
                  height: 72.0,
                  child: Text(
                    Strings.accountCreatedSuccess,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              const Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.white,
                  color: Color.fromRGBO(23, 104, 46, 1.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
