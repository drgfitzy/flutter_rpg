import 'package:flutter/material.dart';
import 'package:flutter_rpg/models/character.dart';
import 'package:flutter_rpg/models/skill.dart';
import 'package:flutter_rpg/shared/styled_text.dart';
import 'package:flutter_rpg/theme.dart';

class SkillList extends StatefulWidget {
  const SkillList(this.character, {super.key});

  final Character character;

  @override
  State<SkillList> createState() => _SkillListState();
}

class _SkillListState extends State<SkillList> {
  late List<Skill> availableSkills;
  late Skill selectedSkill;





  @override
  void initState() {
    availableSkills = allSkills.where((skill) {
    return skill.vocation == widget.character.vocation;
  }).toList();

  //1. need to check if the skill set is empty and if not we make out selection theifirst skills set in the list
  if (widget.character.skills.isEmpty) {
    selectedSkill = availableSkills[0];
  }
  //2. if the skills set is not empty (has a skillalreeady) then the selcted skill shouild be in there
  if (widget.character.skills.isNotEmpty) {
    selectedSkill = widget.character.skills.first;
  }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        color: AppColors.secondaryColor.withOpacity(0.5),
        child: Column(
          children: [
            const StyledHeading("Choose an active skill"),
            const StyledText("Skills are unique to your vocation"),
            const SizedBox(height: 20),

            Row(
              children: availableSkills.map((skill) {
              return Container(
                margin: const EdgeInsets.all(15),
                padding: const EdgeInsets.all(2),
                color: skill == selectedSkill ? Colors.yellow : Colors.transparent,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      widget.character.updateSkill(skill);
                      selectedSkill = skill;
                    }); 
                  },
                  child: Image.asset("assets/img/skills/${skill.image}",
                  width: 70),
                )
              );
            }).toList(),
            ),
            const SizedBox(height: 10),
            StyledText(selectedSkill.name),
          ],
        ),
      )
      
      );
  }
}