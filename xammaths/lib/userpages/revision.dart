import 'dart:convert';
// import 'package:xammaths/info.json';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:xammaths/assets/flashcards.dart';

import 'package:xammaths/home.dart';

import 'package:xammaths/userpages/doubtpage.dart';
import 'package:xammaths/userpages/pastquestions.dart';
// import 'package:http/http.dart' as http;

class RevisionPage extends StatefulWidget {
  const RevisionPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RevisionPageState createState() => _RevisionPageState();
}

//test
class _RevisionPageState extends State<RevisionPage> {
  List<Map<String, dynamic>> jsonList = json.decode(message);
  List<Flashcards> flashcards =
      jsonList.map((json) => Flashcards.fromJson(json)).toList();

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
          'Revision Flashcards',
          style: TextStyle(
            fontSize: 30,
            fontFamily: 'cursive',
          ),
        ),
        backgroundColor: Colors.teal.shade400,
      ),
      backgroundColor: const Color.fromARGB(255, 200, 230, 201),
      body: ListView.builder(
          itemCount: flashcards.length,
          itemBuilder: (context, index) {
            return FlashcardItem(
              flashcard: flashcards[index],
              onSwipeRight: () {
                // Mark as learnt
                setState(() {
                  flashcards[index].status = FlashcardStatus.learnt;
                });
              },
              onSwipeLeft: () {
                // Mark as to learn
                setState(() {
                  flashcards[index].status = FlashcardStatus.toLearn;
                });
              },
            );
          }),
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

//flacardinfo
class Flashcards {
  final String question;
  final String answer;
  final String image;
  FlashcardStatus status;

  Flashcards({
    required this.question,
    required this.answer,
    required this.image,
    this.status = FlashcardStatus.toLearn,
  });

  factory Flashcards.fromJson(Map<String, dynamic> json) {
    return Flashcards(
      question: json['question'] as String,
      answer: json['answer'] as String,
      image: json['image'] as String,
    );
  }
}
// dismissable

enum FlashcardStatus { learnt, toLearn }

class FlashcardItem extends StatelessWidget {
  final Flashcards flashcard;
  final VoidCallback? onSwipeRight;
  final VoidCallback? onSwipeLeft;

  const FlashcardItem({
    super.key,
    required this.flashcard,
    this.onSwipeRight,
    this.onSwipeLeft,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(flashcard),
      onDismissed: (direction) {
        if (direction == DismissDirection.endToStart) {
          if (onSwipeRight != null) onSwipeRight!();
        } else if (direction == DismissDirection.startToEnd) {
          if (onSwipeLeft != null) onSwipeLeft!();
        }
      },
      background: Container(
        color: Colors.green,
        alignment: Alignment.centerLeft,
        child: const Icon(Icons.check, color: Colors.white),
      ),
      secondaryBackground: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        child: const Icon(Icons.close, color: Colors.white),
      ),
      child: Card(
        elevation: 4,
        child: ListTile(
          title: Column(
            children: [
              Text(flashcard.question),
              Text(flashcard.answer),
              Text(flashcard.image),
            ],
          ),
          subtitle: flashcard.status == FlashcardStatus.learnt
              ? Text(
                  'Learnt: ${flashcard.answer}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                )
              : const Text('To Learn'),
        ),
      ),
    );
  }
}
