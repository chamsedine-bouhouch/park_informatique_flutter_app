import 'package:flutter/material.dart';
import 'package:flutter_app/providers/auth.dart';
import 'package:provider/provider.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  static const String _title = 'Login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(_title)),
      body: const MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(10),
            child: Form(
                key: _formKey,
                child: ListView(
                  children: <Widget>[
                    Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10),
                        child: const Text(
                          'Connexion',
                          style: TextStyle(fontSize: 20),
                        )),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: TextFormField(
                        controller: _emailController,
                        validator: (value) => (value == null || value.isEmpty)
                            ? "Merci d'entrer un email valide"
                            : null,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Email',
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: TextFormField(
                        obscureText: true,
                        controller: _passwordController,
                        validator: (value) => (value == null || value.isEmpty)
                            ? "Merci d'entrer un mot de passe valide"
                            : null,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                        ),
                      ),
                    ),
                    // TextButton(
                    //   onPressed: () {
                    //     //forgot password screen
                    //   },
                    //   child: const Text('Forgot Password',),
                    // ),
                    Container(
                        height: 50,
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: ElevatedButton(
                          child: const Text('Login'),
                          onPressed: () {
                            Map creds = {
                              'email': _emailController.text,
                              'password': _passwordController.text,
                              'device_name': 'mobile'
                            };
                            if (_formKey.currentState!.validate()) {
                              // If the form is valid, display a snackbar. In the real world,
                              // you'd often call a server or save the information in a database.

                              // ScaffoldMessenger.of(context).showSnackBar(
                              //   const SnackBar(
                              //       content: Text('Processing Data')),
                              // );
                              Provider.of<Auth>(context,listen:false).login(creds: creds);
                              // print(creds);
                              // print(_emailController.text);
                              // print(_passwordController.text);
                            }
                          },
                        )),
                  ],
                ))));
  }
}
