import 'package:flutter/material.dart';
import 'package:flutter_rpg/models/character.dart';
import 'package:flutter_rpg/shared/styled_text.dart';
import 'package:flutter_rpg/theme.dart';

class StatsTable extends StatefulWidget {
  const StatsTable(this.character, {super.key}); //here charcater is a posiitonal argument not a named argument
//tend to use positional arguments if there is only ever one or two, but if many used named or if not obvuious what the value is
  
  
  final Character character;
  
  @override
  State<StatsTable> createState() => _StatsTableState();
}

class _StatsTableState extends State<StatsTable> {

//animation
double turns = 0.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          //available points
          Container(
            color: AppColors.secondaryColor,
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                AnimatedRotation(
                  turns: turns,
                  duration: const Duration(milliseconds: 200),
                  child: Icon(Icons.star, 
                  color: widget.character.points > 0 ? Colors.yellow : Colors.grey),
                ),
                const SizedBox(width: 20),
                const StyledText("Stats points available"),
                Expanded(child: SizedBox(width: 20)),
                StyledHeading(widget.character.points.toString()) //need widget to access the above class

              ],),

          ),



          //stats table
          Table(
            children: widget.character.statsAsFormattedList.map((stat) {
              return TableRow(
                decoration: BoxDecoration(
                  color: AppColors.secondaryColor.withOpacity(0.5),
                ),
                children: [
                  //stat title
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Padding(padding: const EdgeInsets.all(8),
                  child: StyledHeading(stat["title"]!),
                  )
                ),

                //stat value
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Padding(padding: const EdgeInsets.all(8),
                  child: StyledHeading(stat["value"]!),
                  )
                ),

                //icon button to increase stat

                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: IconButton(
                  icon: Icon(Icons.arrow_upward,
                  color: AppColors.textColor),
                  onPressed: () {
                    setState(() {
                      widget.character.increaseStats(stat["title"]!);
                      turns += 0.5;

                    });
                    
                  }, 
                )
              ),


                //icon button to decrease stat

                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: IconButton(
                  icon: Icon(Icons.arrow_downward,
                  color: AppColors.textColor),
                  onPressed: () {
                    setState(() {
                      widget.character.decreaseStats(stat["title"]!);
                      turns -= 0.5;   
                    });
                    
                  }, 
                )
              ),

                ],
              );
            }).toList(),
          ),



        ],
        ),
    );
  }
}


//----------------------------//
// hlth ||  10 || up || down  // --> row 1
//----------------------------//
// attk ||  10 || up || down  // --> row 2
//----------------------------//
// defs ||  10 || up || down  // --> row 3
//----------------------------//
// skll ||  10 || up || down  // --> row 4
//----------------------------//