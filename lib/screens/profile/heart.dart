import 'package:flutter/material.dart';
import 'package:flutter_rpg/models/character.dart';
import 'package:flutter_rpg/theme.dart';

class Heart extends StatefulWidget {
  const Heart({super.key, required this.character});

  final Character character;

  @override
  State<Heart> createState() => _HeartState();
}

class _HeartState extends State<Heart> with SingleTickerProviderStateMixin {
  late AnimationController _controller;


  late Animation _sizeAnimation;

  @override
  void initState() {
    _controller = AnimationController(
      duration: Duration(milliseconds: 200),
      vsync: this,
    );

// transition of animation for the heart from small to large
    _sizeAnimation = TweenSequence([
      TweenSequenceItem<double>(
        tween: Tween(begin: 25, end: 40), 
        weight: 50,
        ),

//then from large to small....need to use a tween (i.e th etransition between 2 values)

      TweenSequenceItem<double>
      (
        tween: Tween(begin: 40, end: 25), 
        weight: 50,
        ),
      ]).animate(_controller);
  
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller, //2. assign the conmtroller as the aniumation controller for the heart icon button
      builder: (context, child) {
        return IconButton(onPressed: 
        () {
          _controller.reset();
          _controller.forward();
          widget.character.toggleIsFav();
        }, 
        icon: Icon(Icons.favorite,
        color: widget.character.isFav ? AppColors.primaryColor : Colors.grey[800],
        size: _sizeAnimation.value, //1. asign the size animation to the heart icon...still 2 more things to to
          ),
        );
      }
    );
  }
}