import 'package:flutter/material.dart';
import 'package:xammaths/home.dart';
import 'package:camera/camera.dart';
import 'package:xammaths/userpages/pastquestions.dart';
import 'package:xammaths/userpages/revision.dart';
import 'camera_utils.dart';
import 'package:gallery_saver/gallery_saver.dart';

class DoubtPage extends StatefulWidget {
  const DoubtPage({super.key});

  @override
  State<DoubtPage> createState() => _DoubtPageState();
}

class _DoubtPageState extends State<DoubtPage> {
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = <Widget>[
    const RevisionPage(),
    const PastQuestions(),
    const HomePage(),
    const DoubtPage()
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => _widgetOptions.elementAt(_selectedIndex)),
      );
    });
  }

  void _showAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Submited"),
          content: const Text(
              "Our teachers will get back to you on your doubt with the explaination via email within 24 hrs"),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Close"),
            ),
          ],
        );
      },
    );
  }

  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  final doubtform = GlobalKey<FormState>();
  TextEditingController doubtname = TextEditingController();
  TextEditingController doubtemail = TextEditingController();
  TextEditingController doubtsubject = TextEditingController();
  Future<void> _takePicture() async {
    try {
      await _initializeControllerFuture;

      final XFile file = await _controller.takePicture();

      // Save the captured image to the gallery
      await GallerySaver.saveImage(file.path);

      // Show a Thank-You dialog after taking the picture
      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text(
              'Picture recorded',
              style: TextStyle(color: Colors.black, fontSize: 25),
            ),
            content: const Text(
              'Picture uploaded',
              style: TextStyle(
                  color: Color.fromARGB(255, 122, 111, 111), fontSize: 18),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // Close the dialog
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    } catch (e) {
      // ignore: avoid_print
      print("Error taking or saving picture: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    _controller =
        CameraController(CameraUtils.cameras[0], ResolutionPreset.medium);
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            ); // Add your back button functionality here
          },
        ),
        title: const Text(
          'Ask Us Your Doubt',
          style: TextStyle(
            fontSize: 30,
            fontFamily: 'cursive',
          ),
        ),
        backgroundColor: Colors.teal.shade400,
      ),
      backgroundColor: const Color.fromARGB(255, 200, 230, 201),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Submit Your Doubt',
                  style: TextStyle(
                      fontSize: 28, color: Color.fromARGB(255, 0, 77, 64)),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Form(
                key: doubtform,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 200, 230, 201),
                      ),
                      child: TextFormField(
                          keyboardType: TextInputType.name,
                          controller: doubtname,
                          decoration: const InputDecoration(
                            filled: true, // Fill the box with color
                            fillColor: Colors.white,

                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 0, 77, 64),
                                    width: 3)),
                            label: Text(
                              "Full Name",
                            ),
                            labelStyle: TextStyle(
                              fontSize: 25,
                              color: Color.fromARGB(255, 0, 77, 64),
                            ),
                            hintText: 'Enter your Name',
                            hintStyle:
                                TextStyle(fontSize: 20, color: Colors.grey),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.black), // Border color
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 3.5),
                              // Focused border color
                            ),
                          )),
                    ),
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 200, 230, 201),
                      ),
                      child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: doubtemail,
                          decoration: const InputDecoration(
                            filled: true, // Fill the box with color
                            fillColor: Colors.white,

                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 0, 77, 64),
                                    width: 3)),
                            label: Text(
                              "Email",
                            ),
                            labelStyle: TextStyle(
                              fontSize: 25,
                              color: Color.fromARGB(255, 0, 77, 64),
                            ),
                            hintText: 'xxx@xxx.com',
                            hintStyle:
                                TextStyle(fontSize: 20, color: Colors.grey),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.black), // Border color
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 3.5),
                              // Focused border color
                            ),
                          )),
                    ),
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 200, 230, 201),
                      ),
                      child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: doubtsubject,
                          decoration: const InputDecoration(
                            filled: true, // Fill the box with color
                            fillColor: Colors.white,

                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 0, 77, 64),
                                    width: 3)),
                            label: Text(
                              "Year and Level",
                            ),
                            labelStyle: TextStyle(
                              fontSize: 25,
                              color: Color.fromARGB(255, 0, 77, 64),
                            ),
                            hintText: 'LC maths- Higher Level',
                            hintStyle:
                                TextStyle(fontSize: 20, color: Colors.grey),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.black), // Border color
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 3.5),
                              // Focused border color
                            ),
                          )),
                    ),
                    const SizedBox(height: 15),
                    // ignore: sized_box_for_whitespace
                    Container(
                      height: 300,
                      width: 390,
                      child: FutureBuilder<void>(
                        future: _initializeControllerFuture,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            return CameraPreview(_controller);
                          } else {
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                        },
                      ),
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                      height: 40,
                      width: 200,
                      child: FloatingActionButton(
                          onPressed: _takePicture,
                          child: const Row(children: [
                            Icon(Icons.camera_alt),
                            Text('Picture your doubt',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.black))
                          ])),
                    ),
                    const SizedBox(height: 15),
                    ElevatedButton(
                        onPressed: () {
                          _showAlert(context);
                        },
                        child: const Text('Click to submit',
                            style:
                                TextStyle(color: Colors.black, fontSize: 20)))
                  ],
                ))
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.green.shade200,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(Icons.auto_stories_sharp, color: Colors.white),
            label: 'Revision ',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.article_outlined,
              color: Colors.white,
            ),
            label: 'Past Qs',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.question_answer_outlined),
            label: 'Doubts',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

// class DoubtPage extends StatefulWidget {
//   const DoubtPage({super.key});

//   @override
//   State<DoubtPage> createState() => _DoubtPageState();
// }

// class _DoubtPageState extends State<DoubtPage> {
//   final doubtFormKey = GlobalKey<FormState>();
//   TextEditingController doubtNameController = TextEditingController();
//   TextEditingController doubtEmailController = TextEditingController();
//   TextEditingController doubtSubjectController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           leading: IconButton(
//             icon: const Icon(Icons.arrow_back),
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => const HomePage()),
//               ); // Add your back button functionality here
//             },
//           ),
//           title: const Text(
//             'Ask Us Your Doubt',
//             style: TextStyle(
//               fontSize: 22,
//               fontFamily: 'cursive',
//             ),
//           ),
//           backgroundColor: Colors.teal,
//         ),
//         backgroundColor: Colors.teal.shade400,
//         body: SingleChildScrollView(
//             child: Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Form(
//                           key: doubtFormKey,
//                           child: Column(children: [
//                             const SizedBox(height: 15),
//                             TextFormField(
//                               controller: doubtNameController,
//                               decoration: const InputDecoration(
//                                 labelText: 'Your Full Name',
//                                 border: OutlineInputBorder(),
//                               ),
//                             ),
//                             const SizedBox(height: 15),
//                             TextFormField(
//                               controller: doubtEmailController,
//                               decoration: const InputDecoration(
//                                 labelText: 'Enter Your Email',
//                                 border: OutlineInputBorder(),
//                               ),
//                             ),
//                             const SizedBox(height: 15),
//                             TextFormField(
//                               controller: doubtSubjectController,
//                               decoration: const InputDecoration(
//                                 labelText: 'State Year and Level',
//                                 border: OutlineInputBorder(),
//                               ),
//                             ),
//                             const SizedBox(height: 15),
//                             ElevatedButton(
//                               onPressed: () {
//                                 // If the form is valid, proceed with submission
//                                 // You can access form values using the controllers or `onSaved` callbacks
//                                 // For simplicity, let's just print the values for now
//                                 print('Name: ${doubtNameController.text}');
//                                 print('Email: ${doubtEmailController.text}');
//                                 print(
//                                     'Subject: ${doubtSubjectController.text}');
//                               },
//                               child: const Text('Submit'),
//                             )
//                           ]))
//                     ]))));
//   }
// }
