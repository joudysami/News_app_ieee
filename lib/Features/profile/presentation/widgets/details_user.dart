import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Features/auth/presentation/cubit/auth_cubit/auth_cubit.dart';
import 'package:news_app/core/constant/app_color.dart';
import 'package:news_app/core/utils/date.dart';

class DetailsUser extends StatefulWidget {
  const DetailsUser({super.key});

  @override
  State<DetailsUser> createState() => _DetState();
}

class _DetState extends State<DetailsUser> {
   final User? user = FirebaseAuth.instance.currentUser;
  late String formattedDate;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<UserCubit>().loadUserName();
    });
    final createdAt = user?.metadata.creationTime;
    formattedDate = createdAt != null
        ? Time.timeFormat(createdAt.toIso8601String())
        : "Unknown";
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         BlocBuilder<UserCubit, String?>(
                builder: (context, state) {
                  return Text(
                    state ?? "No Username",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: AppColor.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                },
              ),

               SizedBox(height: 6),

              /// Email
              Text(
                user?.email ?? "No Email",
                style: const TextStyle(
                  color: AppColor.grey,
                  fontSize: 14,
                ),
              ),

              const SizedBox(height: 8),

              Text(
                "Created At: $formattedDate",
                style: const TextStyle(
                  color: AppColor.grey,
                ),
              ),

      ],
    );
  }
}