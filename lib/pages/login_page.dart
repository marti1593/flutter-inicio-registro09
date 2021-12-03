import 'package:flutter/material.dart';
import 'package:market/pages/register_page.dart';


class LoginPage extends StatefulWidget{

   static const String ROUTE = "/Login";

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
   final _formKey = GlobalKey<FormState>();

  bool _obscurePassword = true;

  
  
  final _emailController = TextEditingController();

   final _passwordController = TextEditingController();

  @override 
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Form(
        key: _formKey,
        child: Container(
          margin: EdgeInsets.all(8),
          child: Column(children: [ 
          _title(),
          SizedBox(
            height: 15,
          ),
          
           _emailTF(), //estas son funciones
          _passwordTF(),
          _actions(),
           ],
          ),
        ),
      ),
    );
  }
 
  Widget _emailTF() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: TextFormField(
            controller: _emailController,
            validator:(val) => !val!.contains('@')  ? 'email invalida ' : null,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Email',
              hintText: 'Coloque un email',
              icon: Icon(
                Icons.email,
                color: Theme.of(context).primaryColor,)
            ),

          ),
    );
  }

  Widget _passwordTF() {
    return TextFormField(
          obscureText: _obscurePassword,
          controller: _passwordController,
          validator:(val) => val!.length < 5 ? 'Password invalida ' : null,
          decoration: InputDecoration(
            suffixIcon: GestureDetector(
              onTap:(){
                setState(() {
                  _obscurePassword = !_obscurePassword;
                });
              } ,
              child: Icon(_obscurePassword ? Icons.visibility : Icons.visibility_off,
              color: Theme.of(context).primaryColor,),
            ),
            border: OutlineInputBorder(),
            labelText: 'Password',
            hintText: 'Coloque una password',
            icon: Icon(
              Icons.lock,
              color: Theme.of(context).primaryColor,)
          ),

        );
  }

  Widget _actions(){
    return Column(
      children: [
        RaisedButton(
          splashColor: Theme.of(context).primaryColorDark, //para llmar al tema predefinido en main 
          color: Theme.of(context).bottomAppBarColor,
          child: Text("Enviar", style: Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.white)),
          onPressed:(){

            if(_formKey.currentState!.validate()){
               print("Formulario valido!");
            }else{
              print("Errores en el formulario");
            }

         

        }),
        FlatButton(onPressed: (){
          Navigator.pushReplacementNamed(context, RegisterPage.ROUTE);

        }, child: Text("Tienes una cuenta?", style: Theme.of(context). textTheme.bodyText2))
      ],
    );
  }

  Widget _title(){
    return Text('Login', style: Theme.of(context). textTheme.headline1);
  }
}