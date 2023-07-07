import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../common_widgets/default_elevated_button.dart';
import '../../../../constants/custom_colors.dart';
import '../../../../constants/paths.dart';
import '../../../../constants/strings.dart';

final _passwordVisibleStateProvider = StateProvider.autoDispose<bool>(
  (ref) => true,
);

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mediaQuerySize = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: CustomColors.mainGreen,
      body: SafeArea(
        // Weird Flutter bug where body has its width squeezed. Fix it with SizedBox
        child: SizedBox(
          height: mediaQuerySize.height,
          width: mediaQuerySize.width,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: mediaQuerySize.height * 0.21522,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset(
                        Paths.logoPath,
                        height: mediaQuerySize.height * 0.1189,
                      ),
                      Text(
                        Strings.login.toUpperCase(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 40.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 14.0),
                        child: Text(
                          Strings.email.toUpperCase(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                    ),
                    TextField(
                      style: const TextStyle(
                        color: CustomColors.buttonGreen,
                        fontSize: 16.0,
                      ),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: const Icon(
                          Icons.mail,
                          color: CustomColors.greenIcon,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            10.0,
                          ),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 26.0, bottom: 14.0),
                        child: Text(
                          Strings.password.toUpperCase(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                    ),
                    TextField(
                      obscureText: ref.watch(_passwordVisibleStateProvider),
                      style: const TextStyle(
                        color: CustomColors.buttonGreen,
                        fontSize: 16.0,
                      ),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: const Icon(
                          Icons.lock,
                          color: CustomColors.greenIcon,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            10.0,
                          ),
                          borderSide: BorderSide.none,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            ref.watch(_passwordVisibleStateProvider)
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: CustomColors.greenIcon,
                          ),
                          onPressed: () {
                            ref
                                    .read(_passwordVisibleStateProvider.notifier)
                                    .state =
                                !ref.read(_passwordVisibleStateProvider);
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 11.0, bottom: 25.0),
                      child: Row(
                        children: [
                          const Text(
                            Strings.forgotPasword,
                            style: TextStyle(
                              fontSize: 12.0,
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              minimumSize: Size.zero,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 6.0),
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            child: Text(
                              Strings.recover.toUpperCase(),
                              style: const TextStyle(
                                fontSize: 12.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    ElevatedButton(
                      child: Text(
                        Strings.login.toUpperCase(),
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      Strings.questionDontHaveAccount,
                      style: TextStyle(
                        fontSize: 12.0,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        Strings.register.toUpperCase(),
                        style: const TextStyle(
                          fontSize: 12.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
