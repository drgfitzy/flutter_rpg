import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_rpg/models/skill.dart';
import 'package:flutter_rpg/models/stats.dart';
import 'package:flutter_rpg/models/vocation.dart';



class Character with Stats {  //with Stats means that we have added our Stats mixin to the character class which can now access these mixin fileds and functions

  //constructor
  Character({
    required this.name,
    required this.slogan,
    required this.vocation,
    required this.id,
    
  });

  //fields
  final Set<Skill> skills = {};
  final Vocation vocation;
  final String name;
  final String slogan;
  final String id;
  bool _isFav = false; //the _ means we make this variable private and sop we cannot access it outside of thie file
                      //this means if we make an inastance of this character class in another file we cannot the isFav property.
                      //this is so people cannot access and change it without goinmg through some structured process.
                      //this structured way will be through a a function as below.
  
  
  
  //because the mixin files have an _ befor the, they are private and so cannot be accessed by any other file. 
  //We do want to access them ultimately but we want to do this in a controlled way so we use a Getter as below. 
  //a getter is essentially a function that returns a value from a class or a mixin and that value can be a privvate one. 
  //and we can format these values witrhin the gtter beofre we return them if we need to. 
  //We can then use those getters as properties (not methods) on instances of these objects....lets add a few getters to the Stats mixin
  //and one to the character class
  
  //getters

  bool get isFav => _isFav;


  
  void toggleIsFav() {

    _isFav = !_isFav;

  }
//next is the mixin...a mixin in dart is a collection of fileds and methods that can be used by other classes
//a way for different classes to share certain properties and functionality withoiout the need for inheritance...quite useful
//here we will make a mixin for the stats and the character class is going to be able to bring in all of those fileds into the 
//character class along with whatever methods are in the mixin as well. 




void updateSkill(Skill skill){
  skills.clear;
  skills.add(skill);
}

//character to firestore (map)

Map<String, dynamic> toFireStore() {  //cannot store enumns, mixins etc in a firestore database so need more simple values
  return {

    "name": name,
    "slogan": slogan,
    "isFav": _isFav,
    "vocation": vocation.toString(), 
    "skills": skills.map((s)=>s.id).toList(), //this turns the complex vocation enum to a string
    "stats": statsAsMap,
    "points": points, //we already have access to this getter
    //note we don't store the id here... we assign a character an id when we save it
    };
  }

//character from firestore
factory Character.fromFirestore( 
  DocumentSnapshot<Map<String, dynamic>> snapshot,  //represents a sanpshot of a document at that moment in time
  SnapshotOptions? options
) {

  final data = snapshot.data()!;

  // make character instance and retun it from this function

  Character character = Character(
    name: data["name"], 
    slogan: data["slogan"], 
    vocation: Vocation.values.firstWhere((v)=>v.toString() == data["vocation"]), 
    id: snapshot.id, 
    );
//update skills 
for (String id in data["skills"]) {
  Skill skill = allSkills.firstWhere((s)=>s.id == id);
  character.updateSkill(skill);
  }
//set isFav
if (data["isFav"] == true) {
  character.toggleIsFav();
  }

character.setStats(points: data["points"], stats: data["stats"]);

return character;
  }
}
//set stats & p[oints on the chartacter








//Character char = Character(name: 'mario', slogan: "okie dokie", id: "1");
//print(char.is);


//dummy character data

List<Character> characters = [
  Character(name: "Greg", slogan: "Kapumf!", vocation: Vocation.wizard, id: "1"),
  Character(name: "Jane", slogan: "Light me up!!", vocation: Vocation.junkie, id: "2"),
  Character(name: "Ag", slogan: "Fire in the hole!", vocation: Vocation.raider, id: "3"),
  Character(name: "Will", slogan: "Lets go guys!", vocation: Vocation.ninja, id: "4"),




  // required this.name,
  //   required this.slogan,
  //   required this.vocation,
  //   required this.id,


];