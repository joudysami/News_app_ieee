import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Features/auth/presentation/cubit/auth_cubit/auth_cubit.dart';
import 'package:news_app/Features/auth/presentation/cubit/auth_cubit/auth_state.dart';
import 'package:news_app/core/constant/app_color.dart';

class primaryButton extends StatelessWidget {
  const primaryButton({super.key, required this.text, required this.onPressed});
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      buildWhen: (previous, current) {
        return (previous is AuthLoadingState) != (current is AuthLoadingState);
      },
      builder: (context, state) {
        return ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColor.blue,
            padding: EdgeInsets.symmetric(vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
            textStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColor.white,
            ),
          ),
          child: (state is AuthLoadingState)
              ? SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    color: AppColor.white,
                    strokeWidth: 2,
                  ),
                )
              : Text(text),
        );
      },
    );
  }
}
