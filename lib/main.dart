import 'package:flutter/material.dart';

void main() {
  runApp(MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
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

    return MaterialApp(
      home: Scaffold(
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
            const Center(
              child: Text(
                "Je tekst hier",
                style: TextStyle(color: Colors.white), // Pas eventueel aan
              ),
            ),
          ],
        ),
      ),
    );
  }
}
