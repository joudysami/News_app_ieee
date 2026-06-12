import 'package:action_slider/action_slider.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/constant/app_color.dart';

class slider extends StatelessWidget {
  const slider({super.key, required this.imageOnRight, required this.action});

  final bool imageOnRight;
  final Future<void> Function() action;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: imageOnRight ? null : 10,
      right: imageOnRight ? 10 : null,
      bottom: 20,
      child: ActionSlider.standard(
        backgroundBorderRadius: BorderRadius.circular(40.0),
        foregroundBorderRadius: BorderRadius.circular(40.0),
        width: 160.0,
        backgroundColor: AppColor.grey,
        sliderBehavior: SliderBehavior.stretch,
        height: 50.0,
        icon: Transform.rotate(
          angle: 0,
          alignment: Alignment.center,
          child: const Icon(Icons.arrow_back_ios_new, size: 28.0),
        ),
        child: const Text(
          'View All',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColor.white,
          ),
        ),
        action: (controller) async {
          controller.loading();
          try {
            await action();
          } finally {
            controller.reset();
          }
        },
      ),
    );
  }
}
