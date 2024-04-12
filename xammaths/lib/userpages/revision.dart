import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:xammaths/userpages/doubtpage.dart';
import 'package:xammaths/userpages/pastquestions.dart';
import 'package:xammaths/home.dart';

class RevisionPage extends StatefulWidget {
  const RevisionPage({Key? key}) : super(key: key);

  @override
  _RevisionPageState createState() => _RevisionPageState();
}

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

class _RevisionPageState extends State<RevisionPage> {
  late List<Flashcards> flashcards = [];

  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = <Widget>[
    const RevisionPage(),
    const PastQuestions(),
    const HomePage(),
    const DoubtPage(),
  ];

  @override
  void initState() {
    super.initState();
    loadJsonData();
  }

  

void loadJsonData() {
  const String jsonString = '''
    [
      {
        "question": "Right angle",
        "answer": "An angle that measures 90 degrees",
        "image": "rightangle.jpeg"
      },
      {
        "question": "Straight angle",
        "answer": "An angle that measures between 90 and 180 degrees",
        "image": "straightangle.jpeg"
      },
      {
        "question": "Reflex angle",
        "answer": "An angle greater than 180 degrees (but less than 360)",
        "image": "reflexangle.jpeg"
      },
      {
        "question": "Acute Angle",
        "answer": "An angle that measures less than 90 degrees",
        "image": "acuteangle.jpeg"
      },
      {
        "question": "Transversal Line",
        "answer": "A line that intersects two or more lines",
        "image": "transveralline.jpeg"
      },
      {
        "question": "Alternate angles",
        "answer": "Are on opposite sides of the transversal and between the intersected lines. Alternate angles between parallel lines are equal in size.",
        "image": "alternateangles.jpeg"
      },
      {
        "question": "Corresponding angles",
        "answer": "Angles which occupy the same relative position where a transversal crosses two other lines. If the two lines are parallel, the corresponding angles are equal.",
        "image": "correspondingangles.jpeg"
      }
    ]
  ''';

  List<dynamic> jsonList = json.decode(jsonString);
  setState(() {
    flashcards =
        jsonList.map((json) => Flashcards.fromJson(json)).toList();
  });
}

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => _widgetOptions.elementAt(_selectedIndex),
        ),
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
            );
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
      body: flashcards.isNotEmpty
          ? ListView.builder(
              itemCount: flashcards.length,
              itemBuilder: (context, index) {
                return FlashcardItem(
                  flashcard: flashcards[index],
                );
              },
            )
          : const Center(
              child: CircularProgressIndicator(),
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

class FlashcardItem extends StatelessWidget {
  final Flashcards flashcard;

  const FlashcardItem({
    Key? key,
    required this.flashcard,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(flashcard),
      onDismissed: (direction) {
        if (direction == DismissDirection.endToStart) {
          // Implement action for swipe right
        } else if (direction == DismissDirection.startToEnd) {
          // Implement action for swipe left
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
              Image.asset(flashcard.image), // Uncomment if you want to display image
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

enum FlashcardStatus { learnt, toLearn }
