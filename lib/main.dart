import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

void main() {
  runApp(MaterialApp(
    home: HomeScreen(),
  ));
}

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
                'assets/background.png',
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
                      color: Color(0xFF01C2D3), // Blauwe border
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
        backgroundColor: const Color.fromRGBO(1, 194, 211, 1),
        title: Text("Aanrijding Formulier"),
      ),
      body: PdfFormFilling(), // De PdfFormFilling-widget toegevoegd
    );
  }
}

class PersonalInfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(1, 194, 211, 1),
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
        backgroundColor: const Color.fromRGBO(1, 194, 211, 1),
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
        'assets/aanrijdingsformulier-survam_v3.pdf',
        key: _pdfViewerKey,
        controller: _pdfViewerController,
        onFormFieldFocusChange: _onFormFieldFocusChange,
        onDocumentLoaded: _onDocumentLoaded,
      ),
      // Zwevende actieknop om de formuliergegevens te delen
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          _validateAndShareFormData();
        },
        label: const Text(
          'Delen',
          style: TextStyle(fontSize: 20, color: Color(0xFFC1DEE0)),
        ),
        icon: const Icon(Icons.share, color: Color(0xFFC1DEE0)),
        backgroundColor: Color(0xFF01C2D3),
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
      if (formField is PdfTextFormField &&
          (formField.name == 'Datum' ||
              formField.name == 'Datum1' ||
              formField.name == 'Datum2' ||
              formField.name == 'Datum3' ||
              formField.name == 'Datum4' ||
              formField.name == 'Datum5' ||
              formField.name == 'Datum6' ||
              formField.name == 'Datum7' ||
              formField.name == 'Datum8' ||
              formField.name == 'Datum9' ||
              formField.name == 'Datum10' ||
              formField.name == 'Datum11' ||
              formField.name == 'Datum12' ||
              formField.name == 'Datum13' ||
              formField.name == 'Datum14' ||
              formField.name == 'Datum15')) {
        final DateTime? selectedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1950),
          lastDate: DateTime.now(),
        );
        // Stel de geselecteerde datum in het 'datum'-veld
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
        // Valideer het 'datum'-veld
        if (formField.name == 'Datum' ||
            formField.name == 'Datum1' ||
            formField.name == 'Datum2' ||
            formField.name == 'Datum3' ||
            formField.name == 'Datum4' ||
            formField.name == 'Datum5' ||
            formField.name == 'Datum6' ||
            formField.name == 'Datum7' ||
            formField.name == 'Datum8' ||
            formField.name == 'Datum9' ||
            formField.name == 'Datum10' ||
            formField.name == 'Datum11' ||
            formField.name == 'Datum12' ||
            formField.name == 'Datum13' ||
            formField.name == 'Datum14' ||
            formField.name == 'Datum15')
        // Valideer het 'datum'-veld
        if (formField.name == 'Datum' ||
            formField.name == 'Datum1' ||
            formField.name == 'Datum2' ||
            formField.name == 'Datum3' ||
            formField.name == 'Datum4' ||
            formField.name == 'Datum5' ||
            formField.name == 'Datum6' ||
            formField.name == 'Datum7' ||
            formField.name == 'Datum8' ||
            formField.name == 'Datum9' ||
            formField.name == 'Datum10' ||
            formField.name == 'Datum11' ||
            formField.name == 'Datum12' ||
            formField.name == 'Datum13' ||
            formField.name == 'Datum14' ||
            formField.name == 'Datum15') ;
      } else if (formField is PdfSignatureFormField) {
        // Valideer het handtekening veld
        if (formField.signature == null) {
          errors.add('Onderteken het document.');
        }
      }
    }
    // Als er geen fouten zijn, deel het formulier
    _shareForm();
  }

  /// Deel het formulier extern via de deel dialoog van het platform
  Future<void> _shareForm() async {
    // Sla het document op
    List<int> savedBytes = await _pdfViewerController.saveDocument();
    String dir = (await getApplicationCacheDirectory()).path;

    // Sla het tijdelijke bestand op in de cache directory
    File('$dir/aanrijdingsformulier.pdf').writeAsBytesSync(savedBytes);

    List<XFile> files = [
      XFile('$dir/aanrijdingsformulier.pdf', mimeType: 'application/pdf'),
    ];

    // Deel het bestand
    await Share.shareXFiles(files,
        subject: 'Aanrijdingformulier',
        text:
            'Hierbij het aanrijdingsformulier en de foto s van de aanrijding.');

    // Verwijder het bestand uit de cache directory
    File('$dir/aanrijdingsformulier.pdf').deleteSync();
  }
}
