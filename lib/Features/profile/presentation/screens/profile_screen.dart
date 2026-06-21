import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Features/auth/presentation/cubit/auth_cubit/auth_cubit.dart';
import 'package:news_app/Features/auth/presentation/cubit/auth_cubit/auth_state.dart';
import 'package:news_app/Features/auth/presentation/screen/login_screen.dart';
import 'package:news_app/Features/profile/presentation/widgets/button_edit.dart';
import 'package:news_app/Features/profile/presentation/widgets/details_user.dart';
import 'package:news_app/Features/profile/presentation/widgets/image_profile.dart';
import 'package:news_app/Features/profile/presentation/widgets/profile_Tile.dart';
import 'package:news_app/Features/profile/presentation/widgets/view_history_count.dart';
import 'package:news_app/Features/profile/presentation/widgets/view_saved_count.dart';
import 'package:news_app/core/constant/app_color.dart';
import 'package:news_app/core/routes/app_routes_named.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthInitialState) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => const LoginScreen()),
            (route) => false,
          );
        }
      },
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.settings,
                      size: 30,
                      color: AppColor.grey,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                const ImageProfile(),

                const SizedBox(height: 15),

                const Text(
                  "PREMIUM MEMBER",
                  style: TextStyle(
                    fontSize: 13,
                    color: AppColor.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 8),

                const DetailsUser(),

                const SizedBox(height: 20),

                 ButtonEdit(),

                const SizedBox(height: 25),

                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade900,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ViewSavedCount(),
                      ViewHistoryCount(),
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                ProfileTile(
                  icon: Icons.bookmark_border,
                  title: "Saved News",
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      AppRoutesNamed.saved_screen,
                    );
                  },
                ),

                ProfileTile(
                  icon: Icons.history,
                  title: "Reading History",
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      AppRoutesNamed.discovery_screen,
                    );
                  },
                ),

                ProfileTile(
                  icon: Icons.logout,
                  title: "Logout",
                  onTap: () {
                    context.read<AuthCubit>().logout();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}