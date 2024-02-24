import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:donate_clothes/ui/screens/users/register_screen.dart';
import 'package:donate_clothes/ui/screens/users/user_cubit/cubit.dart';
import 'package:donate_clothes/ui/screens/users/user_cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/constants.dart';
import '../../../shared/network/local/cache_helper.dart';
import '../../widgets/basic.dart';
import '../../widgets/default_button.dart';
import '../../widgets/default_text_form_field..dart';
import '../layout_screen/layout_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();

  var passController = TextEditingController();

  var phoneController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  bool isPassword = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => UserCubit(),
      child: BlocConsumer<UserCubit, UserStates>(
        listener: (BuildContext context, state) {
          if (state is LoginSuccessState) {
            if (state.loginModel.success!) {
              print(state.loginModel.message);
              print(state.loginModel.token);
              CacheHelper.saveData(key: 'token', value: state.loginModel.token)
                  .then((value) {
                token = state.loginModel.token;
                navigateFinish(context, LayoutScreen());
              });
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
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Welcome Back',
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 32,
                              color: Color(0xff264446)),
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        const Text(
                          ' Please Enter Your Details',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: Color(0xff828A89)),
                        ),
                        SizedBox(
                          height: 30,
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
                          height: 25,
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
                          height: 25,
                        ),
                        ConditionalBuilder(
                          condition: state is! LoginLoadingState,
                          builder: (context) => DefaultButton(
                              text: 'LogIn',
                              fun: () {
                                if (formKey.currentState!.validate()) {
                                  UserCubit.get(context).userLogin(
                                      email: emailController.text,
                                      password: passController.text);
                                }
                              }),
                          fallback: (context) =>
                              Center(child: CircularProgressIndicator()),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Container(
                          height: 50,
                          // Adjust the height according to your needs
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Don’t have an account ?',
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
                                          builder: (context) =>
                                              RegisterScreen()));
                                },
                                child: const Text(
                                  'SignUp',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xffF74F22)),
                                ),
                              )
                            ],
                          ),
                        ),
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
