import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Features/auth/presentation/widgets/primary_button.dart';
import 'package:news_app/Features/auth/presentation/cubit/auth_cubit/auth_cubit.dart';
import 'package:news_app/Features/auth/presentation/cubit/auth_cubit/auth_state.dart';
import 'package:news_app/core/helpers/validator.dart';
import 'package:news_app/Features/settings/provider/app_setting_provider.dart';
import 'package:news_app/core/routes/app_routes_named.dart';
import 'package:news_app/Features/auth/presentation/widgets/custom_app_textfield.dart';
import 'package:news_app/core/constant/app_color.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final AuthCubit _authCubit;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _authCubit = context.read<AuthCubit>();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              SizedBox(height: 80),
              Text(
                "THE DAILY POST",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SizedBox(height: 20),
              Center(
                child: Text(
                  "Sign in to access your personalized editorial experience.",
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 40),

              CustomAppTextfield(
                label: "Email",
                prefixIcon: Icon(Icons.email, color: AppColor.grey),
                hintText: "name@example.com",
                controller: _emailController,
                validator: (value) {
                  AppValidators.EmailValidator(value);
                  return null;
                },
              ),
              CustomAppTextfield(
                label: "Password",
                prefixIcon: Icon(Icons.lock, color: AppColor.grey),
                hintText: "••••••••",
                controller: _passwordController,
                validator: (value) {
                  AppValidators.PasswordValidator(value);
                  return null; // valid password
                },
              ),

              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 12.0, top: 8.0),
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(color: AppColor.blue, fontSize: 14),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: BlocListener<AuthCubit, AuthState>(
                  listener: (context, state) async {
                    if (state is AuthSuccessState) {
                     await context.read<AppSettingProvider>().completedLogin();
                      Navigator.pushReplacementNamed(
                        context,
                        AppRoutesNamed.Home_screen,
                      );
                    } else if (state is AuthFailureState) {
                      final error = (state).errorMessage;
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: const Color.fromARGB(
                            255,
                            154,
                            14,
                            4,
                          ),

                          content: Text("Login Failure error is ${(error)} "),
                        ),
                      );
                    }
                  },
                  child: primaryButton(
                    text: "Log In",
                    onPressed: () async {
                      _authCubit.login(
                        email: _emailController.text,
                        password: _passwordController.text,
                      );
                      
                    },
                  ),
                ),
              ),

              SizedBox(height: 45),
              Row(
                children: [
                  Expanded(
                    child: Divider(color: AppColor.grey, thickness: 0.5),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      "OR",
                      style: TextStyle(color: AppColor.grey, fontSize: 14),
                    ),
                  ),
                  Expanded(
                    child: Divider(color: AppColor.grey, thickness: 0.5),
                  ),
                ],
              ),

              SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.person, color: Colors.white),
                  label: Text(
                    "Continue with Google",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  style: OutlinedButton.styleFrom(
                    backgroundColor: AppColor.babyblack,
                    padding: EdgeInsets.symmetric(vertical: 14),
                    side: BorderSide(color: AppColor.grey),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 18),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.apple, color: Colors.white),
                  label: Text(
                    "Continue with Apple",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  style: OutlinedButton.styleFrom(
                    backgroundColor: AppColor.babyblack,
                    padding: EdgeInsets.symmetric(vertical: 14),
                    side: BorderSide(color: AppColor.grey),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 60),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: TextStyle(color: AppColor.grey, fontSize: 14),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        AppRoutesNamed.register_screen,
                      );
                    },
                    child: Text(
                      " Sign Up",
                      style: TextStyle(
                        color: AppColor.blue,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
