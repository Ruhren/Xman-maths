import 'package:flutter/material.dart';
import 'package:xammaths/home.dart';
import 'package:xammaths/userpages/doubtpage.dart';
import 'package:xammaths/userpages/revision.dart';

class PastQuestions extends StatefulWidget {
  const PastQuestions({super.key});

  @override
  State<PastQuestions> createState() => _PastQuestionsState();
}

class _PastQuestionsState extends State<PastQuestions> {
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
      body: const Text('pastpaper'),
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
