import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:xammaths/home.dart';

// ignore: camel_case_types
class registerPage extends StatefulWidget {
  const registerPage({super.key});

  @override
  State<registerPage> createState() => _registerPageState();
}

final registerform = GlobalKey<FormState>();
TextEditingController firstname = TextEditingController();
TextEditingController secondname = TextEditingController();
// ignore: non_constant_identifier_names
TextEditingController Username = TextEditingController();
// ignore: non_constant_identifier_names
TextEditingController Password = TextEditingController();
TextEditingController confirmpassword = TextEditingController();
String _selectedItem = 'Junior cert-higher';

// ignore: camel_case_types
class _registerPageState extends State<registerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal.shade50,
        title: const Text(
          'Register',
          style: TextStyle(
            fontSize: 30,
            fontFamily: 'cursive',
          ),
        ),
      ),
      backgroundColor: Colors.teal.shade50,
      body: SingleChildScrollView(
          child: Center(
        child: Column(
          children: [
            const Text(
              'Xam Maths',
              style: TextStyle(fontSize: 70, fontFamily: 'ProtestRiot'),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              'Fill all the fields to register *',
              style: TextStyle(
                  fontFamily: 'cursive',
                  fontSize: 30,
                  color: Color.fromARGB(255, 0, 77, 64)),
            ),
            Form(
                key: registerform,
                child: Container(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(children: [
                      const SizedBox(
                        height: 20,
                      ),
                      // ignore: avoid_unnecessary_containers
                      Container(
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 29, 233, 182),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(255, 0, 77, 64),

                              spreadRadius: 1,
                              blurRadius: 9,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: TextFormField(
                            keyboardType: TextInputType.name,
                            controller: firstname,
                            decoration: const InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  gapPadding: 10.0,
                                  borderSide: BorderSide(
                                    width: 5.0,
                                    color: Color.fromARGB(255, 178, 223, 219),
                                  )),
                              label: Text(
                                "First name",
                              ),
                              labelStyle: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                              hintText: 'Enter your First name',
                              hintStyle:
                                  TextStyle(fontSize: 20, color: Colors.black),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.white), // Border color
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color:
                                        Colors.black), // Focused border color
                              ),
                            )),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 29, 233, 182),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(255, 0, 77, 64),

                              spreadRadius: 1,
                              blurRadius: 9,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: TextFormField(
                            keyboardType: TextInputType.name,
                            controller: secondname,
                            decoration: const InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  gapPadding: 10.0,
                                  borderSide: BorderSide(
                                    width: 5.0,
                                    color: Color.fromARGB(255, 178, 223, 219),
                                  )),
                              label: Text(
                                "Second name",
                              ),
                              labelStyle: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                              hintText: 'Enter your Second name',
                              hintStyle:
                                  TextStyle(fontSize: 20, color: Colors.black),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.white), // Border color
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color:
                                        Colors.black), // Focused border color
                              ),
                            )),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 29, 233, 182),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(255, 0, 77, 64),

                              spreadRadius: 1,
                              blurRadius: 9,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: TextFormField(
                            keyboardType: TextInputType.name,
                            controller: Username,
                            decoration: const InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  gapPadding: 10.0,
                                  borderSide: BorderSide(
                                    width: 5.0,
                                    color: Color.fromARGB(255, 178, 223, 219),
                                  )),
                              label: Text(
                                "Create username",
                              ),
                              labelStyle: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                              hintText: 'Enter a username',
                              hintStyle:
                                  TextStyle(fontSize: 20, color: Colors.white),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black), // Border color
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color:
                                        Colors.black), // Focused border color
                              ),
                            )),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 29, 233, 182),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(255, 0, 77, 64),

                              spreadRadius: 1,
                              blurRadius: 9,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: TextFormField(
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true,
                          controller: Password,
                          decoration: const InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                gapPadding: 10.0,
                                borderSide: BorderSide(
                                  width: 5.0,
                                  color: Color.fromARGB(255, 178, 223, 219),
                                )),
                            label: Text(
                              "Password",
                            ),
                            labelStyle: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            hintText: 'Enter a password',
                            hintStyle:
                                TextStyle(fontSize: 20, color: Colors.white),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.black), // Border color
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.black), // Focused border color
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 29, 233, 182),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(255, 0, 77, 64),

                              spreadRadius: 1,
                              blurRadius: 9,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: TextFormField(
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true,
                          controller: confirmpassword,
                          decoration: const InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                gapPadding: 10.0,
                                borderSide: BorderSide(
                                  width: 5.0,
                                  color: Color.fromARGB(255, 178, 223, 219),
                                )),
                            label: Text(
                              "Conform Password",
                            ),
                            labelStyle: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            hintText: 'Re-enter the password',
                            hintStyle:
                                TextStyle(fontSize: 20, color: Colors.white),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.white), // Border color
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.black), // Focused border color
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 29, 233, 182),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(255, 0, 77, 64),

                              spreadRadius: 1,
                              blurRadius: 9,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: DropdownButtonFormField<String>(
                          dropdownColor: Colors.cyan.shade50,
                          value: _selectedItem,
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedItem = newValue!;
                            });
                          },
                          items: <String>[
                            'Junior cert-higher',
                            'Junior cert-ordinary',
                            'Leaving cert- higher',
                            'Leaving cert-ordinary'
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          decoration: const InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                gapPadding: 10.0,
                                borderSide: BorderSide(
                                  width: 5.0,
                                  color: Color.fromARGB(255, 178, 223, 219),
                                )),
                            labelText: 'Select an option',
                            labelStyle: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.white), // Border color
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    10.0), // Adjust the radius as needed
                              ),
                            ),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.teal.shade900),
                            padding:
                                MaterialStateProperty.all<EdgeInsetsGeometry>(
                              const EdgeInsets.all(
                                  16.0), // Adjust padding for a bigger size
                            ),
                          ),
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

                                      var tween = Tween(begin: begin, end: end)
                                          .chain(CurveTween(curve: curve));

                                      var offsetAnimation =
                                          animation.drive(tween);

                                      return SlideTransition(
                                          position: offsetAnimation,
                                          child: child);
                                    }));
                            print(
                                'Asset path: ${rootBundle.loadString('assets/flashinfo.json')}');
                            // print(secondname.text);
                            // print(Username.text);
                            // print(Password.text);
                            // print(confirmpassword.text);
                            // print('Selected Item: $_selectedItem');
                          },
                          child: const Text(
                            'SUBMIT',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          )),
                    ])))
          ],
        ),
      )),
    );
  }
}
