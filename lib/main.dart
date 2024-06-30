import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: HomeScreen(),
  ));
}

// class MyWidget extends StatelessWidget {
//   const MyWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//   return MaterialApp(
//     home: Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color.fromRGBO(1, 194, 211, 1),
//         title: Center(
//           child: Text("Claimease"),
//         ),
//       ),
//       body: const Center(
//         child: Image(
//           image: AssetImage('assets/images/background.png'),
//         ),
//       ),
//     ),
//   );
// }

// return MaterialApp(
//   home: Scaffold(
//     appBar: AppBar(
//       backgroundColor: const Color.fromRGBO(1, 194, 211, 1),
//       title: Center(
//         child: Text("Claimease"),
//       ),
//     ),
//     body: Stack(
//       children: [
//         Positioned.fill(
//           child: Opacity(
//             opacity: 0.5, // Pas deze waarde aan voor de gewenste opaciteit
//             child: Image.asset(
//               'assets/images/background.png',
//               fit: BoxFit
//                   .cover, // Zorgt ervoor dat de afbeelding het scherm vult
//             ),
//           ),
//         ),
//         const Center(
//           child: Text(
//             "Je tekst hier",
//             style: TextStyle(color: Colors.white), // Pas eventueel aan
//           ),
//         ),
//       ],
//     ),
//   ),
// );

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(1, 194, 211, 1),
        title: Center(
          child: Text("Claimease"),
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Opacity(
              opacity: 0.5, // Pas deze waarde aan voor de gewenste opaciteit
              child: Image.asset(
                'assets/images/background.png',
                fit: BoxFit
                    .cover, // Zorgt ervoor dat de afbeelding het scherm vult
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Je tekst hier",
                  style: TextStyle(color: Colors.white), // Pas eventueel aan
                ),
                SizedBox(height: 20),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.white, // Zwarte tekst
                    side: BorderSide(
                      color:
                          const Color.fromRGBO(1, 194, 211, 1), // Blauwe border
                      width: 2,
                    ),
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                    elevation: 5, // Schaduw voor de knop
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PersonalInfoScreen()),
                    );
                  },
                  icon: Icon(Icons.person,
                      color:
                          Colors.black), // Icoon voor persoonlijke informatie
                  label: Text(
                    "Persoonlijke Informatie",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.white, // Zwarte tekst
                    side: BorderSide(
                      color:
                          const Color.fromRGBO(1, 194, 211, 1), // Blauwe border
                      width: 2,
                    ),
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                    elevation: 5, // Schaduw voor de knop
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CollisionFormScreen()),
                    );
                  },
                  icon: Icon(Icons.directions_car,
                      color: Colors.black), // Icoon voor aanrijding formulier
                  label: Text(
                    "Aanrijding Formulier",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PersonalInfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Persoonlijke Informatie"),
      ),
      body: Center(
        child: Text("Persoonlijke Informatie Formulier"),
      ),
    );
  }
}

class CollisionFormScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Aanrijding Formulier"),
      ),
      body: Center(
        child: Text("Aanrijding Formulier"),
      ),
    );
  }
}
