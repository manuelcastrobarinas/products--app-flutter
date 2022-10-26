import 'package:flutter/material.dart';
import '../widgets/drawerShops.dart';

class NewProductsPage extends StatelessWidget {
  const NewProductsPage({super.key});

  @override
  Widget build(BuildContext context) {

    const String imagenes = 'https://media-exp1.licdn.com/dms/image/C4D03AQFIFBm3icjEBg/profile-displayphoto-shrink_800_800/0/1629210156499?e=1671062400&v=beta&t=y0cFq3EVekNCN7XWebxIYzHqFeTwMg2iItorOvmahlo';

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
              child   : const Text('¿te llamamos? ',style: TextStyle(color: Colors.black))
            ),
          )
        ]),
      body : SizedBox(
        height: double.infinity,
        width : double.infinity,
        child : Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            Padding(
              padding : EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.1),
              child   : const Text('Imágenes Producto', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18)),
            ),

            SizedBox(
              height: 200,
              width: double.infinity,
                child: ListView.builder(
                  scrollDirection : Axis.horizontal,
                  itemCount   : 4,
                  itemBuilder : (BuildContext context, index) {
                    return Padding(
                      padding : const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                      child   : Container(
                        width   : 150,
                        height  : 150,
                        decoration : BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color       : Colors.indigoAccent,
                          // ignore: prefer_const_literals_to_create_immutables
                          boxShadow : [
                            const BoxShadow(
                              color   : Colors.black26,
                              offset  : Offset(0,6),
                              blurRadius: 10,
                            )
                          ],
                        ),
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(25),
                              child: const SizedBox(
                                width: double.infinity,
                                height: double.infinity,
                                child: FadeInImage(
                                  placeholder: AssetImage('assets/products/no-image.png'), 
                                  image      : NetworkImage(imagenes),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 50),
                              child: Container(
                                width : double.infinity,
                                height: 30,
                                decoration : const BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25), topRight: Radius.circular(25))
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                                  child: Text(
                                    'nombre del producto', 
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(color: Colors.white)
                                  ),
                                ),  
                              ),
                            )

                          ],
                        ),
                      ),
                    );
                  }
                ),
              ),




            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            Center(
             
              child: MaterialButton(
                minWidth  : MediaQuery.of(context).size.width * 0.80,
                onPressed : () {},
                color     : const Color.fromARGB(255, 88, 33, 215),
                elevation : 0,
                shape     : RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                padding   : const EdgeInsets.symmetric(vertical: 20),
                child     : const Text('Agregar imagenes',style: TextStyle(color:Colors.white, fontWeight: FontWeight.bold,fontSize: 20)),
              ),
            ),
            const SizedBox(height: 40),
            Center(
              child: MaterialButton(
                minWidth  : MediaQuery.of(context).size.width * 0.80,
                onPressed : (imagenes.isEmpty) ? null 
                                               : () => Navigator.pushNamed(context, 'description',arguments: imagenes),
                color     : const Color.fromARGB(255, 88, 33, 215),
                disabledColor : Colors.grey,
                elevation : 0,
                shape     : RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                padding   : const EdgeInsets.symmetric(vertical: 20),
                child     : const Text('Continuar',style: TextStyle(color:Colors.white, fontWeight: FontWeight.bold,fontSize: 20)),
              ),
            ),
        ]),
      ) 
    );
  }
}

