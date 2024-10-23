

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_rpg/models/character.dart';

class FirestoreService {

  //static variables cannot be used as an instance of the class, justy accessed by the clas itself
  static final ref = FirebaseFirestore.instance
  .collection("characters").withConverter( //converter is a firestore method that fires the methods below to process data to and from firestore
    fromFirestore: Character.fromFirestore, 
    toFirestore: (Character c, _) => c.toFireStore()
    );


// add a new character

static Future<void> addCharacter(Character character) async {
  await ref.doc(character.id).set(character);
}

// get character once

static Future<QuerySnapshot<Character>> getCharactersOnce() {
  return ref.get();
}


// update a character
static Future<void> updateCharacter(Character character) async {
  await ref.doc(character.id).update({
    "stats": character.statsAsMap,
    "points": character.points,
    "skills": character.skills.map((s)=> s.id).toList(),
    "isFav": character.isFav,
  });


}

//delete a character

static Future<void> deleteCharacter(Character character) async {
  await ref.doc(character.id).delete();
}


}