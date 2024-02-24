import 'package:flutter/material.dart';

Widget  defaultTextForm({
  required TextEditingController controller,
  required TextInputType type,
  bool isPassword=false,
   String? labelText,
   String? hintText,
  required final validate,
  required IconData prefix,
  final  suffixPressed,
  final onChanged,
  final onSubmit,
  final suffix,
  final onTap,
  bool isEnabled=true,
})=>Container(
  width: 344,
  height:50 ,
  child:   TextFormField(
    controller: controller,
    keyboardType: type,
    onChanged:onChanged ,
    onFieldSubmitted: onSubmit,
    validator: validate,
    obscureText: isPassword,
    onTap: onTap,
    enabled: isEnabled,

    decoration: InputDecoration(
      labelText: labelText,
      labelStyle: TextStyle(
          color: Colors.grey,
      ),
      hintText: hintText,
      hintStyle: TextStyle(
          color: Color(0xff777A95),
          fontWeight: FontWeight.w800,
          fontSize: 16
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xffF74F22), width: 2.0)
      ),
      border:  OutlineInputBorder(borderRadius: BorderRadius.circular(8),),
      prefixIcon: Icon(
        prefix ,color: Color(0xffF74F22),
      ),
      suffixIcon: suffix != null ? IconButton(
        onPressed: suffixPressed,
        icon: Icon(
          suffix,color: Color(0xffF74F22),
        ),
      ) : null,

    ),

  ),
);