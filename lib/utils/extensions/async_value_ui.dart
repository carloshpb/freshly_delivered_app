import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common_widgets/custom_snackbar.dart';
import '../../exceptions/app_auth_exception.dart';

extension AsyncValueUI on AsyncValue {
  void showAlertDialogOnError(BuildContext context) {
    if (!isRefreshing && hasError) {
      final message = _errorMessage(error!);
      Flushbar(
        margin: const EdgeInsets.all(8),
        borderRadius: BorderRadius.circular(8),
        message: message,
        icon: const Icon(
          Icons.info_outline,
          color: Colors.blue,
        ),
      ).show(context);
      // showExceptionAlertDialog(
      //   context: context,
      //   title: 'Error'.hardcoded,
      //   exception: message,
      // );
    }
  }

  String _errorMessage(Object error) {
    if (error is AppAuthException) {
      return error.message;
    } else {
      return error.toString();
    }
  }

  void showSnackbarOnError(BuildContext context) => whenOrNull(
        error: (error, stackTrace) =>
            CustomSnackbar.showErrorToast(context, 'Error', error.toString()),
      );
}
