import 'package:flutter/material.dart';

class CardComponent extends StatelessWidget {
  final Widget contenido;

  const CardComponent({
    super.key,
   required this.contenido
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding   : const EdgeInsets.symmetric(horizontal:30.0),
      child     : Container(
        padding     : const EdgeInsets.all(20),
        width       : double.infinity,
        decoration  : BoxDecoration(
          color        : Colors.white,
          borderRadius : BorderRadius.circular(20),
          boxShadow    :const <BoxShadow> [
            BoxShadow(
              color     : Colors.black12,
              blurRadius: 15,
              offset    : Offset(0,5),
            )
          ]
        ),
        child       : contenido,
      ),
    );
  }
}