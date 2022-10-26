import 'package:flutter/material.dart';

class DrawerShops extends StatelessWidget {
  const DrawerShops({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle style = const TextStyle(fontWeight: FontWeight.bold, fontFamily: 'poppins',color: Color.fromARGB(255, 128, 128, 128));
    return Drawer(
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal:20.0),
        child: Column(
          mainAxisAlignment : MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          _titleSection(),
          const Divider(height : 2),
          Text('Mi tienda', style: style),
          OptionDrawer(style  : style,  icon: const Icon(Icons.home),   text: 'Inicio',          route: 'login' ),
          OptionDrawer(style  : style,  icon: const Icon(Icons.image),  text: 'Productos',       route: 'products' ),
          OptionDrawer(style  : style,  icon: const Icon(Icons.brush),  text: 'Personalización', route: 'description' ),
          const Divider(height: 20),
          Text('Mi cuenta', style: style),
          OptionDrawer(style : style,  icon: const Icon(Icons.output_outlined),  text: 'Cerrar Sesión', route: 'login'),
        ]),
      ),
    );
  }

  Padding _titleSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment : MainAxisAlignment.start,
        children: [
          IconButton(
            onPressed: (){},
            icon: const Icon(Icons.close,color: Colors.black,
            size: 30
          )),
          const SizedBox(width: 5),
          const Text('Bloque', style: TextStyle( color:Colors.black, fontWeight: FontWeight.bold, fontFamily: 'poppins',fontSize: 25 ))
        ],
      ),
    );
  }
}

class OptionDrawer extends StatelessWidget {
  
  final String text;
  final Icon icon;
  final String route;

  const OptionDrawer({
    Key? key,
    required this.style, 
    required this.text, 
    required this.icon, 
    required this.route,
  }) : super(key: key);

  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title   : Text(this.text, style: style),
      leading : this.icon,
      onTap   : () => Navigator.pushNamed(context, this.route),
    );
  }
}