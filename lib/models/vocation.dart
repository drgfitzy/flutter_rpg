

enum Vocation {
  
  wizard(
    title: "Algo Wizzard", 
    image: "algo_wizard.jpg", 
    description: "Carries a staff to unleash algorithm magic.", 
    ability: "Algorythmic Daze", 
    weapon: "Crystal Staff" 
  ),

  junkie(
    title: "Code Junkie", 
    image: "code_junkie.jpg", 
    description: "Uses code to infiltrate enemy defenses.", 
    ability: "Higher Order Overdrive", 
    weapon: "React 99"
  ),

  raider(
    title: "Terminal Raider", 
    image: "terminal_raider.jpg", 
    description: "Adept in terminal commands to trigger traps", 
    ability: "Shellshock", 
    weapon: "Terminal" 
  ),

  ninja (
    title: "UX Ninja", 
    image: "ux_ninja.jpg", 
    description: "Uses quick & stealthy visual attacks.", 
    ability: "Triple Swipe", 
    weapon: "Infused Stylus" 
  );

  
  const Vocation({
    required this.title,
    required this.image,
    required this.description,
    required this.ability,
    required this. weapon,

  });

  final String title;
  final String image;
  final String description;
  final String ability;
  final String weapon;


// --> image (string)
//     --> title (string)
//     --> description (string)
//     --> ability (string)
//     --> weapon (string)

}
