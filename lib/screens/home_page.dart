import 'package:flutter/material.dart';
import 'package:flutter_app/reusable_card.dart';
import 'package:flutter_app/constants.dart';
import 'note_list.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter_app/screens/note_detail.dart';
import 'package:flutter_app/models/note.dart';
import 'package:flutter_app/utils/database_helper.dart';
import 'package:flutter_app/screens/note_list.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DatabaseHelper databaseHelper = DatabaseHelper();
  List<Note> noteList;
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue[900],
              Colors.blue[700],
              Colors.blue[500],
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 80, bottom: 80),
              child: Text(
                'Welcome',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40.0,
                  color: Colors.white,
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60.0),
                      topRight: Radius.circular(60.0)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    ReusableCard(
                      onPress: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return NoteList();
                        }));
                      },
                      colour: Color(0xFF2B2929),
                      cardChild: Padding(
                        padding: EdgeInsets.all(30),
                        child: Text(
                          'View & Update',
                          style: kHomeButton,
                        ),
                      ),
                    ),
                    ReusableCard(
                      onPress: () {
                        navigateToDetail(Note('', '', 2, '', ''), 'Add Note');
                      },
                      colour: Color(0xFF2B2929),
                      cardChild: Padding(
                        padding: EdgeInsets.all(30),
                        child: Text(
                          'Add a Title',
                          style: kHomeButton,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void navigateToDetail(Note note, String title) async {
    bool result =
        await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return NoteDetail(note, title);
    }));

    if (result == true) {
      updateListView();
    }
  }

  void updateListView() {
    final Future<Database> dbFuture = databaseHelper.initializeDatabase();
    dbFuture.then((database) {
      Future<List<Note>> noteListFuture = databaseHelper.getNoteList();
      noteListFuture.then((noteList) {
        setState(() {
          this.noteList = noteList;
          this.count = noteList.length;
        });
      });
    });
  }
}
