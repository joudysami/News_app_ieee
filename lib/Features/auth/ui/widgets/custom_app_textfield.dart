import 'package:flutter/material.dart';
import 'package:news_app/core/constant/app_color.dart';

class CustomAppTextfield extends StatelessWidget {
  const CustomAppTextfield({
    super.key,
    required this.label,
    this.hintText,
    this.suffixIcon,
    this.prefixIcon,
    this.validator,
    this.controller,
  });

  final String label;
  final String? hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? Function(String?)? validator;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(color: AppColor.grey, fontSize: 14),
          ),
          const SizedBox(height: 8),
          TextFormField(
            
            validator: validator,
            controller: controller,
            autovalidateMode: AutovalidateMode.onUserInteraction,

            style: Theme.of(context).textTheme.bodySmall,
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColor.babyblack,
              isDense: true,
              contentPadding: const EdgeInsets.symmetric(
                vertical: 2,
                horizontal: 12,
              ),
              suffixIcon: suffixIcon,
              prefixIcon: prefixIcon,
              hintText: hintText,
              hintStyle: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}
