import 'package:flutter/material.dart';
import 'package:flutter_rpg/models/character.dart';
import 'package:flutter_rpg/services/firestore_service.dart';

class CharacterStore extends ChangeNotifier {


  final List<Character> _characters = [
  
  // Character(name: "Greg", slogan: "Kapumf!", vocation: Vocation.wizard, id: "1"),

  // Character(name: "Jane", slogan: "Light me up!!", vocation: Vocation.junkie, id: "2"),

  // Character(name: "Ag", slogan: "Fire in the hole!", vocation: Vocation.raider, id: "3"),

  // Character(name: "Will", slogan: "Lets go guys!", vocation: Vocation.ninja, id: "4"),

  ];


  get characters => _characters;



// add character

void addCharacter (Character character) {
  FirestoreService.addCharacter(character);
  _characters.add(character);
  notifyListeners(); //this notifies any listener (consumer) in the application that we have changed it. 
  //Then the consumner can rerun its builder function with that new data and reflected on screen
}

// save (update) character
Future<void> saveCharacter(Character character) async  {
  await FirestoreService.updateCharacter(character);
  return;
}


// remove character
void removeCharacter (Character character) async {
  await FirestoreService.deleteCharacter(character);

  _characters.remove(character);
  notifyListeners();
}

// initally fetch characters
void fetchCharactersOnce() async {
  if (characters.length == 0){
    final snapshot = await FirestoreService.getCharactersOnce();

    for (var doc in snapshot.docs) {
      _characters.add(doc.data());  
    }
    notifyListeners();
  }
}


}
