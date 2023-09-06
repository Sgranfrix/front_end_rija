import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputField extends StatelessWidget {

  final String? labelText;
  final bool? multiline;
  final bool enabled;
  final bool isPassword;
  final bool isUsername;
/*  final Function onChanged;
  final Function onSubmit;
  final Function onTap;*/
  final int? maxLength;
  final TextAlign textAlign;
  final TextEditingController? controller;
  final TextInputType? keyboardType;

  const InputField(
      {required this.labelText,  this.multiline,  this.enabled=true,  this.isPassword=false,  this.isUsername=false,  this.maxLength,  this.controller,  this.keyboardType, required this.textAlign});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: TextField(

        enabled: enabled,
        maxLength: maxLength,
        obscureText: isPassword,
        textAlign: this.textAlign == null ? TextAlign.left : this.textAlign,
        maxLines: multiline != null && multiline == true ? null : 1,
        keyboardType: keyboardType,
        inputFormatters: keyboardType == TextInputType.number ? <
            TextInputFormatter>[
          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
        ] : null,
/*        onChanged: onChanged(),
        onSubmitted: onSubmit(),
        onTap: onTap(),*/
        controller: controller,
        cursorColor: Colors.white,
        style: TextStyle(
          height: 1.0,
          color: Colors.indigo,
        ),
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: new BorderRadius.circular(30.0),
            borderSide: BorderSide(
              color: Colors.indigo,
            ),
          ),
          fillColor: Colors.indigo,
          focusedBorder: OutlineInputBorder(
            borderRadius: new BorderRadius.circular(30.0),
            borderSide: BorderSide(
              color: Colors.indigo,
            ),
          ),
          border: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(30.0),
            borderSide: BorderSide(
              color: Colors.indigo,
            ),
          ),
          labelText: labelText,
          labelStyle: TextStyle(
            color: Colors.indigo,
          ),
        ),
      ),
    );
  }
}