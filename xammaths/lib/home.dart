import 'package:flutter/material.dart';
import 'userpages/doubtpage.dart';

import 'package:xammaths/userpages/revision.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 200, 230, 201),
      body: Column(
        children: [
          const SizedBox(
            height: 70,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Xam Maths',
                style: TextStyle(fontSize: 80, fontFamily: 'ProtestRiot'),
              ),
            ],
          ),
          const SizedBox(
            height: 80,
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     // ignore: avoid_unnecessary_containers
          //     Container(
          //       width: 370,
          //       height: 100,
          //       decoration:
          //           BoxDecoration(borderRadius: BorderRadius.circular(1.0)),
          //       child: ElevatedButton(
          //           style: ButtonStyle(
          //             overlayColor: MaterialStateProperty.all<Color>(
          //               Colors.teal.shade400,
          //             ),
          //             elevation: const MaterialStatePropertyAll(30),
          //             backgroundColor: MaterialStateProperty.all<Color>(
          //                 Colors.tealAccent.shade400),
          //             shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          //               RoundedRectangleBorder(
          //                 borderRadius: BorderRadius.circular(
          //                     10.0), // Adjust the radius as needed
          //               ),
          //             ),
          //           ),
          //           onPressed: () {
          //             Navigator.push(
          //               context,
          //               MaterialPageRoute(
          //                   builder: (context) => const PastQuestions()),
          //             );
          //           },
          //           child: const Row(
          //             children: [
          //               Icon(
          //                 Icons.book,
          //                 size: 50,
          //                 color: Colors.black,
          //               ),
          //               SizedBox(width: 20),
          //               Text(
          //                 'Past Questions by chapter',
          //                 style: TextStyle(
          //                     fontSize: 27,
          //                     color: Colors.black,
          //                     fontFamily: 'cursive'),
          //               ),
          //             ],
          //           )),
          //     )
          //   ],
          // ),
          const SizedBox(
            height: 60,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ignore: avoid_unnecessary_containers
              Container(
                width: 370,
                height: 100,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(1.0)),
                child: ElevatedButton(
                    style: ButtonStyle(
                      overlayColor: MaterialStateProperty.all<Color>(
                        Colors.teal.shade400,
                      ),
                      elevation: const MaterialStatePropertyAll(30),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.tealAccent.shade400),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              10.0), // Adjust the radius as needed
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DoubtPage()),
                      );
                    },
                    child: const Row(
                      children: [
                        Icon(
                          Icons.question_answer_outlined,
                          size: 50,
                          color: Colors.black,
                        ),
                        SizedBox(width: 20),
                        Text(
                          'Ask us a doubt',
                          style: TextStyle(
                              fontSize: 27,
                              color: Colors.black,
                              fontFamily: 'cursive'),
                        ),
                      ],
                    )),
              )
            ],
          ),
          const SizedBox(
            height: 60,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ignore: avoid_unnecessary_containers
              Container(
                width: 370,
                height: 100,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(1.0)),
                child: ElevatedButton(
                    style: ButtonStyle(
                      overlayColor: MaterialStateProperty.all<Color>(
                        Colors.teal.shade400,
                      ),
                      elevation: const MaterialStatePropertyAll(30),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.tealAccent.shade400),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              10.0), // Adjust the radius as needed
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RevisionPage()));
                    },
                    child: const Row(
                      children: [
                        Icon(
                          Icons.timer,
                          size: 50,
                          color: Colors.black,
                        ),
                        SizedBox(width: 20),
                        Text(
                          'Revision Flashcards',
                          style: TextStyle(
                              fontSize: 27,
                              color: Colors.black,
                              fontFamily: 'cursive'),
                        ),
                      ],
                    )),
              )
            ],
          ),
        ],
      ),
    );
  }
}
