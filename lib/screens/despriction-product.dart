// ignore_for_file: file_names, prefer_const_constructors, must_be_immutable, unnecessary_this
import 'package:flutter/material.dart';
import 'package:login/provider/products/create/tag-selector.dart';
import 'package:provider/provider.dart';

import '../provider/products/create/switch-section.dart';

class DescriptionProductPage extends StatelessWidget {
  const DescriptionProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    final  String productImage = ModalRoute.of(context)!.settings.arguments.toString();
    print("esta es la pelicula:$productImage");
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              GeneralInformationProduct(imageProduct: productImage),
              AttributesProduct(),
              GarantiaProduct(),
              VariacionesProduct(),
              SizedBox(height: 10),
              MaterialButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                disabledColor: Colors.grey,
                elevation    : 0,
                color        : Color.fromRGBO(95, 78, 219, 1),
                onPressed    : () async {
                  Navigator.pushReplacementNamed(context, 'products');
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 80,vertical: 15),
                  child  : const Text('Registrar', style: TextStyle(color:Colors.white))
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



class SwitchSelector extends StatefulWidget {
  final String titleSection;
  final bool? tieneHijos;
  bool? isAtributesProductActive;
  bool? isGarantiaProductActive;
  bool? isVariacionesProductActive;

  SwitchSelector({super.key, 
    required this.titleSection, 
    this.tieneHijos,
    this.isAtributesProductActive,
    this.isGarantiaProductActive,
    this.isVariacionesProductActive,
  });

  @override
  State<SwitchSelector> createState() => _SwitchSelectorState();
}

class _SwitchSelectorState extends State<SwitchSelector> {

  @override
  Widget build(BuildContext context) {
    final switchSelector = Provider.of<SwitchSectionProvider>(context);
    return  Container(
      color : const Color.fromRGBO(95, 78, 219, 1),
      height: 55,
      width : double.infinity,
      child : (widget.tieneHijos == false) 
        ? Align( alignment: Alignment.centerLeft,
          child : Padding(
            padding : const EdgeInsets.symmetric(horizontal: 20),
            child   : Text(widget.titleSection, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 14)),
          ))
        : Row( 
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment : MainAxisAlignment.spaceBetween,
          children : [
            Align(
              alignment : Alignment.centerLeft,
              child: Padding(
                padding : const EdgeInsets.symmetric(horizontal: 20),
                child   : Text(
                 widget.titleSection,
                 maxLines : 3,
                 overflow : TextOverflow.ellipsis,
                 style    : TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 13)
                ),
              ),
            ),
            Expanded(child: SizedBox()),
            SizedBox(
              width : 100,
              height: 100,
              child : SwitchListTile(
                activeColor       : Colors.white,
                activeTrackColor  : Color.fromRGBO(147, 229, 238, 1),
                inactiveThumbColor: Colors.white,
                inactiveTrackColor: Colors.grey,
                value : ( widget.isAtributesProductActive   != null ) ? switchSelector.isAtributesProductActive 
                      : ( widget.isGarantiaProductActive    != null ) ? switchSelector.isGarantiaProductActive 
                      : ( widget.isVariacionesProductActive != null ) ? switchSelector.isVariacionesProductActive : false,          
                onChanged : (bool value){
                  if( widget.isAtributesProductActive  != null ) {   
                    setState(() {
                      switchSelector.isAtributesProductActive   = value;
                    });
                  }
                  if( widget.isGarantiaProductActive   != null ) {   
                    setState(() {
                      switchSelector.isGarantiaProductActive    = value;
                    });
                  }
                  if(widget.isVariacionesProductActive != null ) {   
                    setState(() {
                      switchSelector.isVariacionesProductActive = value;
                    });
                  }
                }
              ),
            ) 
          ]), 
    );
  }
}



class GeneralInformationProduct extends StatelessWidget {
  final String imageProduct;
  
  const GeneralInformationProduct({
    super.key,
    required this.imageProduct
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SwitchSelector( titleSection: '1. Información General', tieneHijos: false ),
        SizedBox(height: 10),
        Padding( padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              FadeInImage(
                height  : 60,
                width   : 60,
                placeholder: AssetImage('assets/products/no-image.png'), 
                image      : AssetImage('assets/products/no-image.png'),   //TODO: HACER UN CAMBIO AQUI PARA RECIBIR LA IMAGEN EN RED QUE ES LA QUE DEBERIA CARGAR
                fit : BoxFit.cover,
              ),
              SizedBox(width: 10),
              Expanded(child: InputComponent(keyboardType: TextInputType.text,titleInfo: 'Nombre del producto', paddingTop: 0,isFormOne: true, placeholder: 'Saco', )),    
            ],
          ),
        ),
        SizedBox(height: 30),
        Padding( padding: const EdgeInsets.symmetric( horizontal:20.0),
          child: InputComponent(keyboardType: TextInputType.number,titleInfo: 'precio (BCOP) *', paddingTop: 0,isFormOne: true, placeholder: '\$36,000', ),
        ),
        SizedBox(height: 30),
        Padding( padding: const EdgeInsets.symmetric( horizontal:20.0),
          child: InputComponent(keyboardType: TextInputType.text,titleInfo: 'Categorías de búsqueda', paddingTop: 0,isFormOne: true, placeholder: '#saco', ),
        ),
        SizedBox(height: 30),
         Padding( padding: const EdgeInsets.symmetric( horizontal:20.0),
          child: InputComponent(keyboardType:TextInputType.multiline, titleInfo: 'Descripcíon *', paddingTop: 0,isFormFour: true, placeholder: '', ),
        ),
        SizedBox(height: 30),
        Padding( padding: const EdgeInsets.symmetric( horizontal:20.0),
          // ignore: prefer_const_literals_to_create_immutables
        child: Row(children: [
          Expanded(child: InputComponent(keyboardType: TextInputType.text,titleInfo: 'SKU *', paddingTop: 0,isFormOne: true, placeholder: 'SKU')),
          SizedBox(width: 20),
          Expanded(child: InputComponent(keyboardType: TextInputType.text,titleInfo: 'Tiempo de despacho (dias)*', paddingTop: 0,isFormOne: true, placeholder: '1 - 2')),
        ])
        ),
        SizedBox(height: 30),
      ],
    );
  }
}



class AttributesProduct extends StatelessWidget {

  
  const AttributesProduct({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final switchSelection = Provider.of<SwitchSectionProvider>(context);
    final tagSelector     = Provider.of<TagSelectorProvider>(context);
  
    return (switchSelection.isAtributesProductActive == false) ? SwitchSelector(titleSection: '2. Atributos del producto',isAtributesProductActive: switchSelection.isAtributesProductActive) 
    :   Column(
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        SwitchSelector(titleSection: '2. Atributos del producto',tieneHijos: true, isAtributesProductActive: switchSelection.isAtributesProductActive),
        SizedBox(height: 30),
        _ChipsSelector(),
        SizedBox(height: 20),
        ( tagSelector.isMarca == false ) 
          ? SizedBox()
          : Padding(padding: const EdgeInsets.symmetric( horizontal:20.0),
            child: InputComponent(keyboardType: TextInputType.text,titleInfo: 'Marca', paddingTop: 0,isFormOne: true, placeholder: '')
          ),
        SizedBox(height: 20),
        ( tagSelector.isYear == false ) 
          ? SizedBox()
          : Padding(
              padding: const EdgeInsets.symmetric( horizontal:20.0),
              child: InputComponent(keyboardType: TextInputType.text,titleInfo: 'Año', paddingTop: 0,isFormOne: true, placeholder: ''),
            ),
        SizedBox(height: 20),
        ( tagSelector.isMaterial == false ) 
          ? SizedBox()
          : Padding(
            padding: const EdgeInsets.symmetric( horizontal:20.0),
            child: InputComponent(keyboardType: TextInputType.text,titleInfo: 'Material', paddingTop: 0,isFormOne: true, placeholder: ''),
          ),
        SizedBox(height: 30),
      ],
    );
  }
}

class _ChipsSelector extends StatelessWidget {
  const _ChipsSelector({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final tagSelector = Provider.of<TagSelectorProvider>(context); 

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceAround,

      // ignore: prefer_const_literals_to_create_immutables
      children: [
        _TagsSelector(title:'Marca', marca  : tagSelector.isMarca),
        _TagsSelector(title:'Año',   year   : tagSelector.isYear ),
        _TagsSelector(title:'Material', material : tagSelector.isMaterial)
      ],
    );
  }
}

class _TagsSelector extends StatefulWidget {
  
  final String title;
  final bool? marca;
  final bool? year;
  final bool? material;

  const _TagsSelector({
    Key? key, 
    required this.title, 
    this.marca, 
    this.year, 
    this.material,
  }) : super(key: key);

  @override
  State<_TagsSelector> createState() => _TagsSelectorState();
}

class _TagsSelectorState extends State<_TagsSelector> {
  @override
  Widget build(BuildContext context) {
    
    final tagSelector = Provider.of<TagSelectorProvider>(context);
  
    return ChoiceChip(
      backgroundColor: Colors.transparent,
      shape: StadiumBorder(side: BorderSide(color: Color.fromRGBO(95, 78, 219, 1))),
      label: Text(this.widget.title), 
      labelStyle: TextStyle(color:Color.fromRGBO(95, 78, 219, 1),fontWeight: FontWeight.w600),
      selectedColor: Color.fromARGB(182, 173, 165, 240),
      selected  : ( widget.marca != null ) ? tagSelector.isMarca 
                : ( widget.year  != null ) ? tagSelector.isYear
                : ( widget.material != null ) ? tagSelector.isMaterial : false,
      onSelected: (value) {
        if (widget.marca != null) {   
          setState(() {
            tagSelector.isMarca = value;
          });
        }
        if (widget.year   != null) {   
          setState(() {
            tagSelector.isYear = value;
          });
        }
        if (widget.material != null) {   
          setState(() {
            tagSelector.isMaterial = value;
          });
        }
      }
    );
  }
}



class GarantiaProduct extends StatelessWidget {
  const GarantiaProduct({super.key});

  @override
  Widget build(BuildContext context) {

    final switchSelector = Provider.of<SwitchSectionProvider>(context);
    return (switchSelector.isGarantiaProductActive == false ) 
    ? SwitchSelector(titleSection: '3. Garantia del producto',tieneHijos: true,isGarantiaProductActive: switchSelector.isGarantiaProductActive) 
    : Column(
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        SwitchSelector(titleSection: '3. Garantia del producto',tieneHijos: true,isGarantiaProductActive: switchSelector.isAtributesProductActive),
        SizedBox(height: 30),
        Padding(padding: const EdgeInsets.symmetric( horizontal:20.0),
          child: InputComponent(keyboardType: TextInputType.number, titleInfo: 'Garantia (en dias)', paddingTop: 0,isFormOne: true, placeholder: '0')
        ),
        Padding(
          padding: const EdgeInsets.symmetric( horizontal:20.0),
          child: InputComponent(keyboardType: TextInputType.multiline,titleInfo: 'Descripción', paddingTop: 0, isFormFour: true, placeholder: ''),
        ),
        SizedBox(height: 30),
      ],
    );
  }
}



class VariacionesProduct extends StatelessWidget {
  const VariacionesProduct({super.key});

  @override
  Widget build(BuildContext context) {
    final switchSelector = Provider.of<SwitchSectionProvider>(context);
    return (switchSelector.isVariacionesProductActive == false) 
    ? SwitchSelector(titleSection: '4. Variaciones del producto',tieneHijos: true,isVariacionesProductActive: switchSelector.isVariacionesProductActive)
    : Column(
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        SwitchSelector(titleSection: '4. Variaciones del producto',tieneHijos: true,isVariacionesProductActive: switchSelector.isVariacionesProductActive),
        SizedBox(height: 30),
        Text('hacer las variaciones'),
        SizedBox(height: 30),
      ],
    );
  }
}


class InputComponent extends StatelessWidget {

  
    final String titleInfo,placeholder;
    final TextEditingController? textcontroller;
    final TextInputType keyboardType;
    final bool? isStyle1, isFormOne, isFormTwo, isFormFour;
    final TextStyle style1;
    final double paddingTop; //añadimos propiedad para manejar el padding de ser necesario
    final bool? needCurrencyFormatter;
    final bool? needCreditCardNumberFormatter;
    final int? maxNumber;
    final TextStyle? hintTextStyle;
  
  const InputComponent({
    super.key, 
    required this.titleInfo, required this.placeholder, this.textcontroller, required this.keyboardType, 
    this.isStyle1, this.isFormOne, this.isFormTwo, this.isFormFour, 
    this.style1 = const TextStyle(fontSize: 15, color: Colors.black, fontWeight:FontWeight.bold),
    this.hintTextStyle = const TextStyle(color: Colors.grey),
    required this.paddingTop, this.needCurrencyFormatter, this.needCreditCardNumberFormatter, this.maxNumber,});

  @override
  Widget build(BuildContext context) {
    return (isFormOne==true)? _formOne(context) : (isFormFour == true ) ?  _formFour(context)  : Text("elegir un formulario");
  }

  // SIEMPRE QUE TENGAMOS QUE USARLO en un  ROW  ES NECESARIO PONERLE EXPANDED,
  Widget _formOne(BuildContext context) {
  return Padding(
    padding:  EdgeInsets.only(top:this.paddingTop),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Text(titleInfo, style:(isStyle1==true)? style1 : TextStyle(fontSize: 13, color: Colors.black,fontWeight: FontWeight.w400)),
      TextFormField( 
        maxLength: this.maxNumber,
        style: TextStyle( fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold),
        cursorColor: Color.fromRGBO(108, 93, 211, 1),
        controller: this.textcontroller,
        autocorrect: false,
        keyboardType: this.keyboardType,    
        decoration: InputDecoration(
          hintTextDirection: TextDirection.ltr,
          hintText:this.placeholder,
          hintStyle: (this.hintTextStyle == null) ? null : this.hintTextStyle,
          enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(243, 243, 243, 1))),  
          focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(108, 93, 211, 1))),
          border: UnderlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(243, 243, 243, 1))),
        ),
        
      ),
    ]),
  );
  }


  Widget _formFour(BuildContext context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(titleInfo, style:(isStyle1==true)? style1 : TextStyle(fontSize: 13, color: Colors.black,fontWeight: FontWeight.w400)),
        TextFormField(
          maxLines    : null,
          minLines    : 1,
          controller  : this.textcontroller,
          keyboardType: this.keyboardType,  
          decoration  : InputDecoration(
            hintText: this.placeholder,
            border  :  OutlineInputBorder(
              borderSide :BorderSide(width: 1)
            ),
            focusedBorder : OutlineInputBorder(
              borderSide  : BorderSide(width: 1,color: Color.fromRGBO(108, 93, 211, 1))
            ),
          ), 
        ),
      ],
    );
  }

}
