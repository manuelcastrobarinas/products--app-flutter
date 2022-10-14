// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:login/provider/form.dart';
import 'package:login/screens/ui/input-decoration.dart';
import 'package:login/widgets/AuthBackground.dart';
import 'package:login/widgets/card.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body : AuthBackground( 
        caja: SingleChildScrollView(
          child: Column(children: [
              const SizedBox(height: 250), 
              CardComponent(contenido: Column(children: [
                const SizedBox(height: 10),
                Text('login', style: Theme.of(context).textTheme.headline4),
                const SizedBox(height: 30),
                
                ChangeNotifierProvider(
                  create: (_) => FormProvider(),
                  child:_Form(),
                )
                    

              ])),
              const SizedBox(height: 50),
              const Text("Crear nueva cuenta", style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),    
              const SizedBox(height: 50),
          ]),
        )
      ),
    );
  }
}

class _Form extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    final loginForm = Provider.of<FormProvider>(context);

    return Form(
      key: loginForm.formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        TextFormField(
          autocorrect : false,
          keyboardType: TextInputType.emailAddress,
          decoration  : InputDecorations.authInputDecoration(
            hintText    : 'manuel123@gmail.com',
            labelText   : 'Correo Electronico',
            prefixIcon  : Icons.alternate_email_rounded,
          ),  
          validator : (value) {
            String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
            RegExp regExp  = RegExp(pattern);
            return regExp.hasMatch(value ?? '') ? null : 'ingresa un correo valido';
          },
          onChanged : (value) => loginForm.email = value,
        ),
        const SizedBox(height: 30),
        TextFormField(
          autocorrect : false,
          obscureText : true,
          keyboardType: TextInputType.visiblePassword,
          decoration  : InputDecorations.authInputDecoration(
            hintText    : '****',
            labelText   : 'Contraseña',
            prefixIcon  : Icons.lock
          ),
          validator: (value) {
            return (value != null  && value.length > 5 ) ? null : 'ingresa una contraseña valida';
          },
          onChanged: (value) => loginForm.password = value,
        ),
        const SizedBox(height: 30),
        MaterialButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          disabledColor: Colors.grey,
          elevation    : 0,
          color        : Colors.deepPurple,
          onPressed    : loginForm.isLoading == true ? null : () async {
            if(!loginForm.isValidForm()) return ;
            loginForm.isLoading = true;
            await Future.delayed(const Duration(seconds: 2));
            loginForm.isLoading = false;
            Navigator.pushReplacementNamed(context, 'home');
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 80,vertical: 15),
            child: loginForm.isLoading == false 
            ? const Text('ingresar', style: TextStyle(color:Colors.white))
            : const Text('espere...', style: TextStyle(color:Colors.white))
            ),
        ),
      ],
    ),
    );
  }
} 