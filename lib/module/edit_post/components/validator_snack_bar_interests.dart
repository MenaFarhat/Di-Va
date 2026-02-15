import 'package:diva/shared/components/components.dart';
import 'package:flutter/material.dart';

SnackBar validatorSnackBarInterests = SnackBar(
  content: const Text(
    'You cannot choose more than two interests',
    textAlign: TextAlign.center,
  ),
  backgroundColor: chooseToastColor(
    ToastState.ERROR,
  ),
  duration: const Duration(seconds: 5),
);
