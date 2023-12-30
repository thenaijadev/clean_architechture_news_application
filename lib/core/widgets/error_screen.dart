import 'package:clean_news_application/core/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: TextWidget(
          text: "Route Does Not Exist",
        ),
      ),
    );
  }
}
