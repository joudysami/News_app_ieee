import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Features/auth/presentation/widgets/primary_button.dart';
import 'package:news_app/Features/auth/presentation/cubit/auth_cubit/auth_cubit.dart';
import 'package:news_app/Features/auth/presentation/cubit/auth_cubit/auth_state.dart';
import 'package:news_app/core/constant/app_color.dart';
import 'package:news_app/core/helpers/validator.dart';
import 'package:news_app/Features/auth/presentation/widgets/custom_app_textfield.dart';
import 'package:news_app/core/routes/app_routes_named.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final AuthCubit _authCubit;
  late final TextEditingController _nameController;
  late final TextEditingController _confirmPasswordController;
    final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _authCubit = context.read<AuthCubit>();
    _nameController = TextEditingController();
    _confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              Text(
                "THE DAILY POST",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 12),
              Text(
                "Join the conversation. Subscribe today.",
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Container(
                      width: 400,
                      decoration: BoxDecoration(
                        color: AppColor.babyblack,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: AppColor.blue),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 24,
                      ),
                      child: Form (
                        key: _formKey,
                        child: Column(
                          children: [
                            CustomAppTextfield(
                              label: "Full Name",
                              hintText: "Jane Doe",
                              controller: _nameController,
                              prefixIcon: const Icon(
                                Icons.person_2_outlined,
                                color: AppColor.grey,
                              ),
                              validator: (value) {
                                return AppValidators.NameValidator(value);
                              },
                            ),
                            CustomAppTextfield(
                              label: "Email",
                              hintText: "jane@example.com",
                              controller: _emailController,
                              validator: (value) {
                                return AppValidators.EmailValidator(value);
                              },
                              prefixIcon: const Icon(
                                Icons.email_outlined,
                                color: AppColor.grey,
                              ),
                            ),
                            CustomAppTextfield(
                              label: "Password",
                              hintText: "••••••••",
                              controller: _passwordController,
                              validator: (value) {
                                return AppValidators.PasswordValidator(value);
                              },
                              prefixIcon: const Icon(
                                Icons.lock_outlined,
                                color: AppColor.grey,
                              ),
                            ),
                            CustomAppTextfield(
                              label: "Confirm Password",
                              hintText: "••••••••",
                              controller: _confirmPasswordController,
                              validator: (value) {
                                return AppValidators.ConfirmPasswordValidator(
                                  value,
                                  _passwordController.text,
                                );
                              },
                              prefixIcon: const Icon(
                                Icons.lock_outline_rounded,
                                color: AppColor.grey,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: RichText(
                                      text: TextSpan(
                                        style: const TextStyle(
                                          color: AppColor.grey,
                                          fontSize: 13,
                                        ),
                                        children: [
                                          const TextSpan(text: "I agree to the "),
                                          TextSpan(
                                            text: "Terms of Service",
                                            style: const TextStyle(
                                              color: AppColor.blue,
                                              decoration:
                                                  TextDecoration.underline,
                                            ),
                                          ),
                                          const TextSpan(text: " and "),
                                          TextSpan(
                                            text: "Privacy Policy.",
                                            style: const TextStyle(
                                              color: AppColor.blue,
                                              decoration:
                                                  TextDecoration.underline,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 16),
                            SizedBox(
                              width: double.infinity,
                              child: BlocListener<AuthCubit, AuthState>(
                                listener: (context, state) {
                                  if (state is AuthSuccessState) {
                                    
                                    Navigator.popAndPushNamed(
                                      context,
                                      AppRoutesNamed.login_screen,
                                    );
                                  } else if (state is AuthFailureState) {
                                   
                                   
                                  }
                                },
                                child: primaryButton(
                                  text: "Create Account",
                                  onPressed: () async {
                                    await _authCubit.register(
                                      email: _emailController.text,
                                      password: _passwordController.text,
                                      name: _nameController.text,
                                    );
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Row(
                              children: [
                                Expanded(
                                  child: Divider(
                                    color: AppColor.babyblack,
                                    thickness: 0.5,
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 12),
                                  child: Text(
                                    "Or register with",
                                    style: TextStyle(
                                      color: AppColor.grey,
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Divider(
                                    color: AppColor.babyblack,
                                    thickness: 0.5,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 18),
                            SizedBox(
                              width: double.infinity,
                              child: TextButton(
                                onPressed: () {},
                                child: Row(
                                  children: [
                                    Spacer(),
                                    Icon(Icons.person, color: Colors.white),
                                    SizedBox(width: 8),
                                    Text(
                                      "Continue with Google",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                      ),
                                    ),
                                    Spacer(),
                                  ],
                                ),
                                style: OutlinedButton.styleFrom(
                                  backgroundColor: AppColor.babyblack,
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 14),
                                  side: BorderSide(color: AppColor.grey),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 12),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Already have an account?",
                                  style: TextStyle(
                                      color: AppColor.grey, fontSize: 13),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                      context,
                                      AppRoutesNamed.login_screen,
                                    );
                                  },
                                  child: const Text(
                                    "Sign In",
                                    style: TextStyle(
                                      color: AppColor.blue,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
