import 'package:flutter/material.dart';
import 'package:market/pages/login_page.dart';


class RegisterPage extends StatefulWidget{

   static const String ROUTE = "/register";

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
   final _formKey = GlobalKey<FormState>();

  bool _obscurePassword = true;

  final _usernameController = TextEditingController();
  
  final _emailController = TextEditingController();

   final _passwordController = TextEditingController();

  @override 
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Registrar"),
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
          _usernameTF(),
           _emailTF(), //estas son funciones
          _passwordTF(),
          _actions(),
           ],
          ),
        ),
      ),
    );
  }
 Widget _usernameTF() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: TextFormField(
            controller: _usernameController,
            validator:(val) => val!.length > 5  ? 'Usuario invalido ' : null,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Usuario',
              hintText: 'Coloque un usuario',
              icon: Icon(
                Icons.person,
                color: Theme.of(context).primaryColor,)
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
          Navigator.pushReplacementNamed(context, LoginPage.ROUTE);

        }, child: Text("Iniciar Sesion", style: Theme.of(context). textTheme.bodyText2))
      ],
    );
  }

  Widget _title(){
    return Text('Register', style: Theme.of(context). textTheme.headline1);
  }
}