import 'package:localstore/localstore.dart';
import 'package:notes_app/globals.dart';

class NoteCtrl {
  static final db = Localstore.instance.collection("notes");
  static final userDB = Localstore.instance.collection("user");

  static newUser() async {
    var isNewUser = await userDB.get();
    if (isNewUser == null) {
      final id = userDB.doc().id;
      userDB.doc(id).set({'user': true});
    }
    user = isNewUser;
    print(isNewUser);
  }

  static saveNote(var note) async {
    // gets new id
    final id = db.doc().id;

// save the item
    db.doc(id).set({
      'Title': note["Title"],
      'Date': note['Date'],
      'Text': note['Text'],
      'id': id,
    });

    await getNotes();
  }

  static editNote(var note) async {
    // gets new id
    final id = note['id'];
    print("ID: " + id);
// save the item
    db.doc(id).set({
      'Title': note["Title"],
      'Date': note['Date'],
      'Text': note['Text'],
      'id': id,
    });
    await getNotes();
  }

  static deleteNote(String id) async {
    await db.doc(id).delete();
    await getNotes();
  }

  static getNotes() async {
    var localNotes = await NoteCtrl.db.get();
    if (localNotes != null) {
      notes = localNotes.values.toList();
    } else {
      notes = [];
    }
  }
}
