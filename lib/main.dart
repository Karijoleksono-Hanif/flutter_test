// import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'dart:io';

void main() {
  runApp(MaterialApp(
    home: HomeScreen(),
  ));
}

// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color.fromRGBO(1, 194, 211, 1),
//         title: Center(
//           child: Text("Claimease"),
//         ),
//       ),
//       body: Stack(
//         children: [
//           Positioned.fill(
//             child: Opacity(
//               opacity: 0.5, // Pas deze waarde aan voor de gewenste opaciteit
//               child: Image.asset(
//                 'assets/images/background.png',
//                 fit: BoxFit
//                     .cover, // Zorgt ervoor dat de afbeelding het scherm vult
//               ),
//             ),
//           ),
//           Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const Text(
//                   "Je tekst hier",
//                   style: TextStyle(color: Colors.white), // Pas eventueel aan
//                 ),
//                 SizedBox(height: 20),
//                 ElevatedButton.icon(
//                   style: ElevatedButton.styleFrom(
//                     foregroundColor: Colors.black,
//                     backgroundColor: Colors.white, // Zwarte tekst
//                     side: BorderSide(
//                       color:
//                           const Color.fromRGBO(1, 194, 211, 1), // Blauwe border
//                       width: 2,
//                     ),
//                     padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
//                     elevation: 5, // Schaduw voor de knop
//                   ),
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => CollisionFormScreen()),
//                     );
//                   },
//                   icon: Icon(Icons.directions_car,
//                       color: Colors.black), // Icoon voor aanrijding formulier
//                   label: Text(
//                     "Aanrijding Formulier",
//                     style: TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                 ),
//                 SizedBox(height: 10),
//                 ElevatedButton.icon(
//                   style: ElevatedButton.styleFrom(
//                     foregroundColor: Colors.black,
//                     backgroundColor: Colors.white, // Zwarte tekst
//                     side: BorderSide(
//                       color:
//                           const Color.fromRGBO(1, 194, 211, 1), // Blauwe border
//                       width: 2,
//                     ),
//                     padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
//                     elevation: 5, // Schaduw voor de knop
//                   ),
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => PersonalInfoScreen()),
//                     );
//                   },
//                   icon: Icon(Icons.person,
//                       color:
//                           Colors.black), // Icoon voor persoonlijke informatie
//                   label: Text(
//                     "Persoonlijke Informatie",
//                     style: TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                 ),
//                 SizedBox(height: 10),
//                 ElevatedButton.icon(
//                   style: ElevatedButton.styleFrom(
//                     foregroundColor: Colors.black,
//                     backgroundColor: Colors.white, // Zwarte tekst
//                     side: BorderSide(
//                       color:
//                           const Color.fromRGBO(1, 194, 211, 1), // Blauwe border
//                       width: 2,
//                     ),
//                     padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
//                     elevation: 5, // Schaduw voor de knop
//                   ),
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => InfoScreen()),
//                     );
//                   },
//                   icon: Icon(Icons.info,
//                       color: Colors.black), // Icoon voor meer informatie
//                   label: Text(
//                     "Meer Informatie",
//                     style: TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class CollisionFormScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Aanrijding Formulier"),
//       ),
//       body: Center(
//         child: Text("Aanrijding Formulier"),
//       ),
//     );
//   }
// }

// class PersonalInfoScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Persoonlijke Informatie"),
//       ),
//       body: Center(
//         child: Text("Persoonlijke Informatie Formulier"),
//       ),
//     );
//   }
// }

// class InfoScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Meer Informatie"),
//       ),
//       body: Center(
//         child:
//             Text("Meer informatie over deze applicatie en een instructieblad."),
//       ),
//     );
//   }
// }

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
                      MaterialPageRoute(builder: (context) => InfoScreen()),
                    );
                  },
                  icon: Icon(Icons.info,
                      color: Colors.black), // Icoon voor meer informatie
                  label: Text(
                    "Meer Informatie",
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

class CollisionFormScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Aanrijding Formulier"),
      ),
      body: PdfFormFilling(), // De PdfFormFilling-widget toegevoegd
      // body:
      //     SfPdfViewer.asset("assets/Documents/aanrijdingsformulier-survam.pdf"),
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

class InfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meer Informatie"),
      ),
      body: Center(
        child:
            Text("Meer informatie over deze applicatie en een instructieblad."),
      ),
    );
  }
}

// Vertegenwoordigt de SfPdfViewer-widget geladen met een formulierdocument
class PdfFormFilling extends StatefulWidget {
  @override
  _HomePage createState() => _HomePage();
}

// State-klasse voor de PdfFormFilling-widget
class _HomePage extends State<PdfFormFilling> {
  // Globale sleutel om toegang te krijgen tot de state van de SfPdfViewer
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();
  // Controller voor de PdfViewer
  final PdfViewerController _pdfViewerController = PdfViewerController();
  // Lijst om formulier velden uit het PDF-document op te slaan
  List<PdfFormField>? _formFields;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Body die de SfPdfViewer bevat
      body: SfPdfViewer.asset(
        'assets/aanrijdingsformulier-survam.pdf',
        key: _pdfViewerKey,
        controller: _pdfViewerController,
        onFormFieldFocusChange: _onFormFieldFocusChange,
        onDocumentLoaded: _onDocumentLoaded,
      ),
      // Zwevende actieknop om de formuliergegevens te delen
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          _validateAndShareFormData();
        },
        label: const Text('Share', style: TextStyle(fontSize: 20)),
        icon: const Icon(Icons.share),
      ),
    );
  }

  // Methode die wordt aangeroepen wanneer het PDF-document is geladen
  void _onDocumentLoaded(PdfDocumentLoadedDetails details) {
    // Haal de formulier velden uit het PDF-document
    _formFields = _pdfViewerController.getFormFields();
  }

  /// Behandel focusverandering op het DOB-veld om een DatePicker weer te geven
  Future<void> _onFormFieldFocusChange(
      PdfFormFieldFocusChangeDetails details) async {
    final PdfFormField formField = details.formField;
    // Als het veld focus krijgt en het 'dob'-veld is, toon een DatePicker
    if (details.hasFocus) {
      if (formField is PdfTextFormField && formField.name == 'dob') {
        final DateTime? selectedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1950),
          lastDate: DateTime.now(),
        );

        // Stel de geselecteerde datum in het 'dob'-veld
        if (selectedDate != null) {
          formField.text =
              '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}';
        }

        // Verwijder focus van het veld
        FocusManager.instance.primaryFocus?.unfocus();
      }
    }
  }

  /// Voer validaties uit op de ingevulde formuliergegevens en deel ze extern
  Future<void> _validateAndShareFormData() async {
    final List<String> errors = <String>[];
    // Valideer elk formulier veld
    for (final PdfFormField formField in _formFields!) {
      if (formField is PdfTextFormField) {
        // Valideer het 'name'-veld
        if (formField.name == 'name') {
          if (formField.text.isEmpty) {
            errors.add('Naam is verplicht.');
          } else if (formField.text.length < 3) {
            errors.add('Naam moet minstens 3 karakters bevatten.');
          } else if (formField.text.length > 30) {
            errors.add('Naam mag niet langer zijn dan 30 karakters.');
          } else if (formField.text.contains(RegExp(r'[0-9]'))) {
            errors.add('Naam mag geen cijfers bevatten.');
          } else if (formField.text
              .contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
            errors.add('Naam mag geen speciale tekens bevatten.');
          }
        }
        // Valideer het 'dob'-veld
        if (formField.name == 'dob') {
          if (formField.text.isEmpty) {
            errors.add('Geboortedatum is verplicht.');
          } else if (!RegExp(r'^\d{1,2}\/\d{1,2}\/\d{4}$')
              .hasMatch(formField.text)) {
            errors.add('Geboortedatum moet in dd/mm/jjjj-formaat zijn.');
          }
        }
        // Valideer het 'dob'-veld
        if (formField.name == 'dob') {
          if (formField.text.isEmpty) {
            errors.add('Geboortedatum is verplicht.');
          } else if (!RegExp(r'^\d{1,2}\/\d{1,2}\/\d{4}$')
              .hasMatch(formField.text)) {
            errors.add('Geboortedatum moet in dd/mm/jjjj-formaat zijn.');
          }
        }
        // Valideer het 'email'-veld
        if (formField.name == 'email') {
          if (formField.text.isEmpty) {
            errors.add('E-mail is verplicht.');
          }
          // E-mail regex vergelijking
          else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
              .hasMatch(formField.text)) {
            errors.add('E-mail moet in correct formaat zijn.');
          }
        }
      } else if (formField is PdfListBoxFormField) {
        // Valideer het list box veld
        if (formField.selectedItems == null ||
            formField.selectedItems!.isEmpty) {
          errors.add('Selecteer minstens één cursus.');
        }
      } else if (formField is PdfSignatureFormField) {
        // Valideer het handtekening veld
        if (formField.signature == null) {
          errors.add('Onderteken het document.');
        }
      }
    }

    // Als er fouten zijn, toon ze in een dialoogvenster
    if (errors.isNotEmpty) {
      await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: SizedBox(
              height: 100,
              width: 100,
              child: ListView.builder(
                itemCount: errors.length,
                itemBuilder: (_, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(errors[index]),
                  );
                },
              ),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    } else {
      // Als er geen fouten zijn, deel het formulier
      _shareForm();
    }
  }

  /// Deel het formulier extern via de deel dialoog van het platform
  Future<void> _shareForm() async {
    // Sla het document op
    List<int> savedBytes = await _pdfViewerController.saveDocument();
    String dir = (await getApplicationCacheDirectory()).path;

    // Sla het tijdelijke bestand op in de cache directory
    File('$dir/workshop_registration.pdf').writeAsBytesSync(savedBytes);

    List<XFile> files = [
      XFile('$dir/workshop_registration.pdf', mimeType: 'application/pdf'),
    ];

    // Deel het bestand
    await Share.shareXFiles(files,
        subject: 'Formulierdocument succesvol gedeeld.');

    // Verwijder het bestand uit de cache directory
    File('$dir/workshop_registration.pdf').deleteSync();
  }
}
