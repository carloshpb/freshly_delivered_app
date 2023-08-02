import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/custom_colors.dart';
import '../../../../constants/strings.dart';
import '../controllers/home_controller.dart';

class HomeScreen extends ConsumerWidget {
  //final _emailController = TextEditingController();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mediaQuerySize = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            children: [
              SizedBox(
                height: 47.0,
                child: Consumer(
                  builder: (context, searchRef, _) {
                    return TextFormField(
                      initialValue:
                          searchRef.read(searchProductTextFieldHomeProvider),
                      autofillHints: const [AutofillHints.email],
                      //controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                      onChanged: (searchText) => searchRef
                          .watch(searchProductTextFieldHomeProvider.notifier)
                          .state = searchText,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: CustomColors.buttonGreenDeactivated,
                        hintText: Strings.searchProductsHint,
                        hintStyle: const TextStyle(
                          color: Colors.white,
                        ),
                        prefixIcon: const Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            10.0,
                          ),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    );
                  },
                ),
              ),
              Column(
                children: [
                  SizedBox(
                    height: mediaQuerySize.height * 0.1954976,
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  SizedBox(
                    height: mediaQuerySize.height * 0.0390995,
                  ),
                  const SizedBox(
                    height: 13.0,
                  ),
                  SizedBox(
                    height: mediaQuerySize.height * 0.1789099526,
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  SizedBox(
                    height: mediaQuerySize.height * 0.10663507,
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  SizedBox(
                    height: mediaQuerySize.height * 0.1789099526,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
