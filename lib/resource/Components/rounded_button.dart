// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mvvm_architecture/resource/app-colors.dart';

class RoundedButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final bool loading;
  const RoundedButton({
    required this.title,
    required this.onPressed,
    this.loading = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 40,
        width: 200,
        decoration: BoxDecoration(
          color: AppColors.buttonColor,
          borderRadius: BorderRadius.circular(10),
        ), // BoxDecoration
        child: Center(
          child: loading
              ? CircularProgressIndicator(
                  color: AppColors.whiteColor,
                )
              : Text(
                  title,
                  style: TextStyle(color: AppColors.whiteColor),
                ),
        ),
      ), // Container
    ); // InkWell
  }
}
