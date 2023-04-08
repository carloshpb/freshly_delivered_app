import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//import '../l10n/app_localizations_provider.dart';

/// Simple not found screen used for 404 errors (page not found on web)
class NotFoundScreen extends ConsumerWidget {
  const NotFoundScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final loc = ref.watch(appLocalizationsProvider);
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        //TODO : Better visual for text
        child: Text(
            // loc.not_found,
            "404 NOT FOUND"),
      ),
    );
  }
}
