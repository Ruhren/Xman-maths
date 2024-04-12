import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:xammaths/Logins@reg/register.dart';
import 'package:xammaths/home.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

final loginform = GlobalKey<FormState>();
TextEditingController username = TextEditingController();
TextEditingController password = TextEditingController();

class _LoginpageState extends State<Loginpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.teal.shade50,
        body: SingleChildScrollView(
          child: Column(children: [
            const SizedBox(
              height: 100,
            ),
            const Text(
              'Xam Maths',
              style: TextStyle(fontSize: 70, fontFamily: 'ProtestRiot'),
            ),
            const SizedBox(
              height: 75,
            ),
            Card(
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(1.0), // Adjust the value as needed
                ),
                margin: const EdgeInsets.all(10.0),
                elevation: 20.0,
                shadowColor: Colors.grey,
                color: const Color.fromARGB(255, 29, 233, 182),
                child: Form(
                    key: loginform,
                    child: Container(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(children: [
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                            keyboardType: TextInputType.name,
                            controller: username,
                            decoration: const InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)),
                              label: Text(
                                "Username",
                              ),
                              labelStyle: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                              ),
                              hintText: 'Enter your username',
                              hintStyle:
                                  TextStyle(fontSize: 20, color: Colors.white),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.white), // Border color
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.white, width: 3.5),
                                // Focused border color
                              ),
                            )),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true,
                          controller: password,
                          decoration: const InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            label: Text(
                              "Password",
                            ),
                            labelStyle: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                            ),
                            hintText: 'Enter your password',
                            hintStyle:
                                TextStyle(fontSize: 20, color: Colors.white),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.white), // Border color
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 3.5), // Focused border color
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                      pageBuilder: (context, animation,
                                              secondaryAnimation) =>
                                          const HomePage(),
                                      transitionsBuilder: (context, animation,
                                          seconadryAnimation, child) {
                                        const begin = Offset(1.0, 0.0);
                                        const end = Offset.zero;
                                        const curve = Curves.easeInOut;

                                        var tween = Tween(
                                                begin: begin, end: end)
                                            .chain(CurveTween(curve: curve));

                                        var offsetAnimation =
                                            animation.drive(tween);

                                        return SlideTransition(
                                            position: offsetAnimation,
                                            child: child);
                                      }));
                              // ignore: avoid_print

                              // print(username.text);
                              // print(password.text);
                            },
                            child: const Text(
                              'Login',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.black),
                            )),
                        const SizedBox(
                          height: 25,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Do not have an account?',
                              style: TextStyle(
                                  fontSize: 20, fontStyle: FontStyle.italic),
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      PageRouteBuilder(
                                          pageBuilder: (context, animation,
                                                  secondaryAnimation) =>
                                              const registerPage(),
                                          transitionsBuilder: (context,
                                              animation,
                                              seconadryAnimation,
                                              child) {
                                            const begin = Offset(1.0, 0.0);
                                            const end = Offset.zero;
                                            const curve = Curves.easeInOut;

                                            var tween = Tween(
                                                    begin: begin, end: end)
                                                .chain(
                                                    CurveTween(curve: curve));

                                            var offsetAnimation =
                                                animation.drive(tween);

                                            return SlideTransition(
                                                position: offsetAnimation,
                                                child: child);
                                          }));
                                },
                                child: const Text(
                                  "Register",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                )),
                          ],
                        ),
                      ]),
                    )))
          ]),
        ));
  }
}
