// ignore_for_file: file_names
import 'package:flutter/material.dart';

class AuthBackground extends StatelessWidget {
 
  final Widget caja;
  const AuthBackground({
    super.key, 
    required this.caja
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height  : double.infinity,
      width   : double.infinity,
      child   : Stack(
        // ignore: prefer_const_literals_to_create_immutables
        children  : [
          _PurpleBox(),
          SafeArea(
            child: Container(
              margin: const EdgeInsets.only(top: 30),
              width: double.infinity,
              child: const Icon(Icons.person_pin, color: Colors.white, size: 100),
            ),
          ),
          caja
        ],
      ) ,
    );
  }
}

class _PurpleBox extends StatelessWidget {

  @override
  Widget build(BuildContext context) {   
    final size = MediaQuery.of(context).size;
    
    return Container(
      width       : double.infinity,
      height      : size.height * 0.4,
      decoration  : _purpleBackground(),
      child       : Stack(
        // ignore: prefer_const_literals_to_create_immutables
        children  : [
         Positioned(top    : 90,  left  : 30,  child: _Buble()),
         Positioned(top    : -40, left  : -30, child: _Buble()),
         Positioned(top    : -50, right : -20, child: _Buble()),
         Positioned(bottom : -50, left  : 10,  child: _Buble()),  
         Positioned(bottom : 120, right : 20,  child: _Buble()),  
      ]) ,
    );
  }

  BoxDecoration _purpleBackground() => const BoxDecoration(
    gradient  : LinearGradient( colors: [
      Color.fromRGBO(63, 63, 156, 1),
      Color.fromRGBO(90, 70, 178, 1),
    ]),
  );
  
}



class _Buble extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Container(
      width       : 100,
      height      : 100,
      decoration  : BoxDecoration(
        borderRadius  : BorderRadius.circular(100),
        color         :const Color.fromRGBO(255, 255, 255, 0.05),
        
      ) ,
    );
  }
}