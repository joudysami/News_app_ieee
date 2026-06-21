import 'package:flutter/material.dart';

import 'package:news_app/Features/news/presentation/widgets/silder.dart';

import 'package:news_app/core/constant/app_color.dart';

class CustomCategoryCard extends StatefulWidget {
  const CustomCategoryCard({
    super.key,
    required this.title,
    required this.onViewAll,
    required this.image,
    required this.index,
  });
  final String title;
  final String image;
  final int index;
  final Future<void> Function() onViewAll;
  @override
  State<CustomCategoryCard> createState() => _CustomCategoryCardState();
}

class _CustomCategoryCardState extends State<CustomCategoryCard> {
  bool get imageOnRight => widget.index % 2 == 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 15,
            offset: Offset(0, 8),
            color: Colors.black26,
          ),
        ],
        color: AppColor.white,
        borderRadius: BorderRadius.circular(24),
      ),
      clipBehavior: Clip.antiAlias,

      // child: ClipRRect(
      child: Stack(
        children: [
          Positioned(
            left: imageOnRight ? 0 : null,
            right: imageOnRight ? null : 0,
            top: 0,
            bottom: 0,
            child: Image.asset(
              widget.image,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            left: imageOnRight ? null : 40,
            right: imageOnRight ? 40 : null,
            top: 20,
            bottom: 0,
            child: Text(
              widget.title,
              style: TextStyle(
                fontSize: 35,
                color: AppColor.black,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          slider(imageOnRight: imageOnRight, action: widget.onViewAll)
        ],
      ),
    );
  }
}
