import 'package:flutter/material.dart';
import 'package:flutter_rpg/screens/home/home.dart';
import 'package:flutter_rpg/services/character_store.dart';
import 'package:flutter_rpg/theme.dart';
import 'package:provider/provider.dart';

//firebase database
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


void main () async {

  //////////////////Firebase code ////////////////////////////
  ///
  WidgetsFlutterBinding.ensureInitialized(); //enables firebase to use platfrom channels to caLL native code.
  await Firebase.initializeApp( //connects to firebase before we run app
  options: DefaultFirebaseOptions.currentPlatform,
);

///////////////////////////////////////////////////////////

  runApp(ChangeNotifierProvider(
    create: (context) => CharacterStore(),
    child: MaterialApp(
      home: const Home(),
      theme: primaryTheme,
      debugShowCheckedModeBanner: false,
    ),
  ));
}



class Sandbox extends StatelessWidget {
  const Sandbox({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sandbox"),
        backgroundColor: Colors.grey,
      ),
      body: const Text("Sandbox")
    );
  }
}



//Note on aminations

//implicit (built in) animations
//--easy to use
//--limited configuration


//explicit (custom) animations
// -- harder to set up
// -- more control over animation


