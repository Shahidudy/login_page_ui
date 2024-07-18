import 'package:flutter/material.dart';
import 'package:login_page_ui/pages/home_page.dart';

class LogPage extends StatefulWidget {
  const LogPage({super.key});

  @override
  State<LogPage> createState() => _LogPageState();
}

class _LogPageState extends State<LogPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final String myEmail = 'aaa';
  final String myPassword = '123';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: Text(
                    'LOGIN',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: const Color.fromARGB(255, 1, 80, 144)),
                  ),
                ),
                Form(
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            hintText: 'email',
                            prefixIcon: Icon(Icons.email),
                            border: OutlineInputBorder(),
                            labelText: 'email'),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: _passwordController,
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: 'password',
                            prefixIcon: Icon(Icons.password),
                            border: OutlineInputBorder(),
                            labelText: 'password'),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      MaterialButton(
                          minWidth: double.infinity,
                          child: Text(
                            'Click to Login',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          color: Colors.blue[400],
                          onPressed: () {
                            login(context);
                          })
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void login(BuildContext context) {
    final email = _emailController.text;
    final password = _passwordController.text;

    if (email == myEmail && password == myPassword) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return HomePage();
          },
        ),
      );
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Login Failed try again'),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('OK'))
              ],
            );
          });
    }
  }
}
