import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:donate_clothes/ui/screens/users/user_cubit/cubit.dart';
import 'package:donate_clothes/ui/screens/users/user_cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/basic.dart';
import '../../widgets/default_button.dart';
import '../../widgets/default_text_form_field..dart';
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var nameController = TextEditingController();

  var emailController = TextEditingController();

  var passController = TextEditingController();

  var confirmPassController = TextEditingController();

  var phoneController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  bool isPassword = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => UserCubit(),
      child: BlocConsumer<UserCubit, UserStates>(
        listener: (BuildContext context, state) {
          if (state is RegisterSuccessState) {
            if (state.loginModel.success!) {
              messageToast(
                  msg: state.loginModel.message!, state: ToastStates.SUCCESS);


              navigateFinish(context, LoginScreen());

            } else {
              print(state.loginModel.message);
              messageToast(
                  msg: state.loginModel.message!, state: ToastStates.ERROR);
            }
          }
        },
        builder: (BuildContext context, Object? state) {
          return Form(
            key: formKey,
            child: Scaffold(
              backgroundColor: const Color(0xffFFFFFF),
              appBar: AppBar(
                backgroundColor: const Color(0xffFFFFFF),
                elevation: 0,
              ),
              body: Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Create Account',
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 32,
                              color: Color(0xff264446)),
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        const Text(
                          ' Let’s create account together',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: Color(0xff828A89)),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        defaultTextForm(
                            controller: nameController,
                            type: TextInputType.text,
                            hintText: "User Name",
                            validate: (value) {
                              if (value!.isEmpty) {
                                return 'Name must be not empty';
                              }
                              return null;
                            },
                            prefix: Icons.person_outline_rounded),
                        const SizedBox(
                          height: 15,
                        ),
                        defaultTextForm(
                            controller: emailController,
                            type: TextInputType.emailAddress,
                            hintText: "Email Address",
                            validate: (value) {
                              if (value!.isEmpty) {
                                return 'email must be not empty';
                              }
                              return null;
                            },
                            prefix: Icons.email_outlined),
                        const SizedBox(
                          height: 15,
                        ),
                        defaultTextForm(
                            controller: phoneController,
                            type: TextInputType.phone,
                            hintText: "Phone Number",
                            validate: (value) {
                              if (value!.isEmpty) {
                                return 'Phone must be not empty';
                              }
                              return null;
                            },
                            prefix: Icons.phone_in_talk_outlined),
                        const SizedBox(
                          height: 15,
                        ),
                        defaultTextForm(
                            controller: passController,
                            type: TextInputType.visiblePassword,
                            hintText: 'Password',
                            validate: (value) {
                              if (value.isEmpty) {
                                return 'the password not allow to be empty';
                              }
                              return null;
                            },
                            prefix: Icons.lock,
                            suffix: isPassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                            isPassword: !isPassword,
                            suffixPressed: () {
                              setState(() {
                                isPassword = !isPassword;
                              });
                            }),
                        const SizedBox(
                          height: 15,
                        ),
                        defaultTextForm(
                            controller: confirmPassController,
                            type: TextInputType.visiblePassword,
                            hintText: 'Confirm Password',
                            validate: (value) {
                              if (value.isEmpty) {
                                return 'the password not match';
                              }
                              return null;
                            },
                            prefix: Icons.lock,
                            suffix: isPassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                            isPassword: !isPassword,
                            suffixPressed: () {
                              setState(() {
                                isPassword = !isPassword;
                              });
                            }),
                        const SizedBox(
                          height: 25,
                        ),
                        Center(
                          child: ConditionalBuilder(
                            condition: state is! LoginLoadingState,
                            builder: (context) => DefaultButton(
                                text: 'Sign Up',
                                fun: () {
                                    if (formKey.currentState!.validate()) {
                                      UserCubit.get(context).userRegister(
                                        username: nameController.text,
                                        email: emailController.text,
                                        phone: phoneController.text,
                                        password: passController.text,
                                        confirmPassword:
                                            confirmPassController.text,
                                      );
                                      if (nameController.text.length < 3) {
                                        messageToast(
                                            msg:
                                                '\'username\'length must be at least 3 characters long',
                                            state: ToastStates.ERROR);
                                      }
                                      if (!emailController.text.endsWith(".com")) {
                                        messageToast(
                                          msg: "\"email\" must be a valid email",
                                          state: ToastStates.ERROR,
                                        );
                                      }
                                      if (phoneController.text.length < 11) {
                                        messageToast(
                                            msg:
                                                "\"phone\" length must be at least 11 characters long",
                                            state: ToastStates.ERROR);
                                      }
                                      if (passController.text.length < 6) {
                                        messageToast(
                                            msg:
                                                "\"password\" length must be at least 6 characters long",
                                            state: ToastStates.ERROR);
                                      }
                                      if (passController.text != confirmPassController.text) {
                                        messageToast(
                                            msg: "Passwords do not match",
                                            state: ToastStates.ERROR);
                                      }
                                    }

                                }),
                            fallback: (context) =>
                                Center(child: CircularProgressIndicator()),
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Already have an account?',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff756B6B)),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginScreen()));
                              },
                              child: const Text(
                                'Login',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xffF74F22)),
                              ),
                            )
                          ],
                        )
                       ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
