import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:donate_clothes/ui/screens/users/forget_password/forget_password_page.dart';
import 'package:donate_clothes/ui/screens/users/register_screen.dart';
import 'package:donate_clothes/ui/screens/users/user_cubit/cubit.dart';
import 'package:donate_clothes/ui/screens/users/user_cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sizer/sizer.dart';

import '../../../generated/l10n.dart';
import '../../../shared/constants.dart';
import '../../../shared/network/local/cache_helper.dart';
import '../../widgets/basic.dart';
import '../../widgets/default_button.dart';
import '../../widgets/default_text_form_field..dart';
import '../layout_screen/layout_screen.dart';
import '../setting_screen/setting_controller/theme_controller.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  var emailController = TextEditingController();
  var passController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool isPassword = false;

  SettingController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => UserCubit(),
      child: BlocConsumer<UserCubit, UserStates>(
        listener: (BuildContext context, state) {
          if (state is LoginSuccessState) {
            if (state.loginModel.success == true) {
              // messageToast(
              //     msg: state.loginModel.message!, state: ToastStates.SUCCESS);
              navigateFinish(context, LayoutScreen());
              CacheHelper.saveData(key: 'token', value: state.loginModel.token)
                  .then((value) {
                token = state.loginModel.token;
              });
            }

            if (state.loginModel.success == false) {
              messageToast(
                  msg: 'check your internet', state: ToastStates.ERROR);
            }
          }
          if (state is LoginErrorState) {
            messageToast(msg: 'User Name or Password is wrong', state: ToastStates.ERROR);
          }
        },
        builder: (BuildContext context, Object? state) {
          return Form(
            key: formKey,
            child: Scaffold(
              backgroundColor: const Color(0xffFFFFFF),
              // appBar: PreferredSize(
              //     preferredSize:
              //     const Size.fromHeight(0.0), // here the desired height
              //     child: AppBar(
              //       backgroundColor: Color(0xffFFFFFF),
              //       elevation: 0,
              //     )),
              body: SingleChildScrollView(
                child: Directionality(
                  textDirection: controller.selectedIndex == 0
                      ? TextDirection.ltr
                      : TextDirection.rtl,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image(image: AssetImage('assets/images/blueLogo.jpg'),width:double.infinity,height:30.h,fit: BoxFit.fill,),
                      SizedBox(height: 5.h,),
                     Padding(
                       padding:  EdgeInsetsDirectional.symmetric(horizontal: 2.h),
                       child: Center(
                         child: Column(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             Text(
                              'Login to your Account',
                               style: TextStyle(
                                   fontWeight: FontWeight.w700,
                                   fontSize: 3.h,
                                   color: controller2.app),
                             ),
                             SizedBox(
                               height: 7,
                             ),
                             Text(
                              'Your generosity can change lives. Donate today and make a difference!',
                               textAlign: TextAlign.center,
                               style: TextStyle(
                                   fontWeight: FontWeight.w400,
                                   fontSize: 15,
                                   color: Color(0xff828A89)),
                             ),
                             SizedBox(
                               height: 5 .h,
                             ),
                             defaultTextForm(
                                 controller: emailController,
                                 type: TextInputType.emailAddress,
                                 hintText: S.of(context).Email,
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
                                 hintText: S.of(context).Password,
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
                             // Align(
                             //   alignment: Alignment.centerRight,
                             //   child: TextButton(
                             //     onPressed: () {
                             //       Navigator.push(
                             //         context,
                             //         MaterialPageRoute(
                             //             builder: (context) =>
                             //                 ForgetPasswordPage()),
                             //       );
                             //     },
                             //     child: Text(
                             //       S.of(context).forgetPassword,
                             //       style: TextStyle(
                             //           fontSize: 16.0,
                             //           fontWeight: FontWeight.w700,
                             //           color: controller.app),
                             //     ),
                             //   ),
                             // ),
                             const SizedBox(
                               height: 20,
                             ),
                             Center(
                               child: ConditionalBuilder(
                                 condition: state is! LoginLoadingState,
                                 builder: (context) => Container(
                                   width: 315,
                                   child: DefaultButton(
                                       text: S.of(context).login,
                                       fun: () {
                                         if (formKey.currentState!.validate()) {
                                           UserCubit.get(context).userLogin(
                                               email: emailController.text,
                                               password: passController.text);
                                         }
                                       }),
                                 ),
                                 fallback: (context) => Center(
                                     child: CircularProgressIndicator(
                                       color: controller.app,
                                     )),
                               ),
                             ),
                             SizedBox(
                               height: 4.h,
                             ),
                         Row(
                           children: <Widget>[
                             Expanded(
                               child: Divider(
                                 thickness: 1.5,
                                 color: Colors.grey[400],
                               ),
                             ),
                             Padding(
                               padding: const EdgeInsets.symmetric(horizontal: 8.0),
                               child: Text(
                                 'OR',
                                 style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: Colors.grey[600]),
                               ),
                             ),
                             Expanded(
                               child: Divider(
                                 thickness: 1.5,
                                 color: Colors.grey[400],
                               ),
                             ),
                           ],
                         ),
                             SizedBox(height: 3.h,),
                             Center(
                               child: DefaultButton(
                                   text: "Create new account",
                                   fun: () {
                                      navigateTo(context, RegisterScreen());
                                   }),
                               ),
                             // Row(
                             //   mainAxisAlignment: MainAxisAlignment.center,
                             //   children: [
                             //     Text(
                             //       S.of(context).anotheAcc,
                             //       style: TextStyle(
                             //           fontSize: 20,
                             //           fontWeight: FontWeight.w600,
                             //           color: Color(0xff756B6B)),
                             //     ),
                             //     TextButton(
                             //       onPressed: () {
                             //         Navigator.push(
                             //             context,
                             //             MaterialPageRoute(
                             //                 builder: (context) =>
                             //                     RegisterScreen()));
                             //       },
                             //       child: Text(
                             //         S.of(context).signUp,
                             //         style: TextStyle(
                             //             fontSize: 20,
                             //             fontWeight: FontWeight.w700,
                             //             color: controller.app),
                             //       ),
                             //     )
                             //   ],
                             // ),






                             /////////////////////////////////////
                             // Padding(
                             //   padding: EdgeInsets.symmetric(horizontal: 45.0),
                             //   child: MaterialButton(
                             //     onPressed: () async {
                             //       await signInWithGoogle();
                             //     },
                             //     height: 45.0,
                             //     shape: RoundedRectangleBorder(
                             //         borderRadius: BorderRadius.circular(10.0),
                             //         side: BorderSide(color: Colors.grey)),
                             //     child: Row(
                             //       mainAxisAlignment: MainAxisAlignment.center,
                             //       children: [
                             //         Image.network(
                             //           'http://pngimg.com/uploads/google/google_PNG19635.png',
                             //           height: 30.0,
                             //         ),
                             //         SizedBox(width: 8.0),
                             //         Text(
                             //           'Google',
                             //           style: TextStyle(
                             //               fontSize: 20.0,
                             //               color: Color(0xff756B6B)),
                             //         ),
                             //       ],
                             //     ),
                             //   ),
                             // ),
                           ],
                         ),
                       ),
                     )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  // Future<void> signInWithGoogle() async {
  //   try {
  //     GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
  //     if (googleSignInAccount != null) {
  //       GoogleSignInAuthentication googleSignInAuthentication =
  //           await googleSignInAccount.authentication;
  //       AuthCredential authCredential = GoogleAuthProvider.credential(
  //         idToken: googleSignInAuthentication.idToken,
  //         accessToken: googleSignInAuthentication.accessToken,
  //       );
  //       UserCredential authResult =
  //           await _auth.signInWithCredential(authCredential);
  //       User user = authResult.user!;
  //       print('User email: ${user.email}');
  //
  //       Navigator.pushReplacement(
  //         context,
  //         MaterialPageRoute(builder: (context) => LayoutScreen()),
  //       );
  //     } else {
  //       print('Google sign in failed.');
  //     }
  //   } catch (error) {
  //     print('Error signing in with Google: $error');
  //   }
  // }

  Future<UserCredential> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) {
        // If the user cancels the sign-in, we return early
        return Future.error('Sign in aborted by user');
      }

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      // Create a new credential
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Once signed in, return the UserCredential
      UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);

      navigateFinish(context, LayoutScreen());

      return userCredential;
    } catch (e) {
      print('Error signing in with Google: $e');
      return Future.error('Error signing in with Google: $e');
    }
  }

}
