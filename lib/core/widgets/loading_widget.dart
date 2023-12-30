import 'package:clean_news_application/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key, this.size = 50});
  final double size;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: SpinKitWaveSpinner(
      color: AppColors.orange,
      size: size,
    ));
  }
}
