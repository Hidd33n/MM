import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class ErrorCases {
  static void showLoginError(BuildContext context) {
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.error(
        message: "loginError".tr(),
      ),
    );
  }

  static void showNetworkError(BuildContext context) {
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.error(
        message: "networkError".tr(),
      ),
    );
  }

  static void showGenericError(BuildContext context) {
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.error(
        message: "genericError".tr(),
      ),
    );
  }

  static void showRegistrationError(BuildContext context) {
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.error(
        message: "registrationError".tr(),
      ),
    );
  }

  // Métodos para casos de éxito genéricos
  static void showRegistrationSuccess(BuildContext context) {
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.success(
        message: "registrationSuccess".tr(),
      ),
    );
  }

  static void showUpdateSuccess(BuildContext context) {
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.success(
        message: "updateSuccess".tr(),
      ),
    );
  }

  static void showDeleteSuccess(BuildContext context) {
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.success(
        message: "deleteSuccess".tr(),
      ),
    );
  }
}
