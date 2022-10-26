import 'package:flutter/material.dart';
import 'package:login/widgets/drawerShops.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerShops(),
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation : 0,
        title     : const Text('Tus Productos',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
        actions   : [
          TextButton(
            onPressed : (){},
            child: Padding(
              padding : EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.1),
              child   : const Text('Archivados',style: TextStyle(color: Colors.black))
            ),
          )
        ]),
      body : SizedBox(
        height: double.infinity,
        width : double.infinity,
        child : Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.20),
            MaterialButton(
              minWidth  : MediaQuery.of(context).size.width * 0.80,
              onPressed : () => Navigator.pushNamed(context, 'newProduct'),
              color     : const Color.fromARGB(255, 88, 33, 215),
              elevation : 0,
              shape     : RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              padding   : const EdgeInsets.symmetric(vertical: 20),
              child     : const Text('Nuevo Producto',style: TextStyle(color:Colors.white, fontWeight: FontWeight.bold,fontSize: 20)),
            ),
        ]),
      ) 
    );
  }
}