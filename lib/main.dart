import 'dart:io';
import 'package:url_launcher/url_launcher.dart';
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
                    "Gebruikershandleiding",
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
                    "FAQ",
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
        title: Text("Gebruikers Handleiding"),
      ),
      body: UserManualPage(),
    );
  }
}

class InfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(1, 194, 211, 1),
        title: Text("FAQ (Veel gestelde vragen)"),
      ),
      body: QuestionnairePage(),
    );
  }
}

//--------------------END HOME SCREEN-------------------------------------

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
          style: TextStyle(
              fontSize: 20, color: Color.fromARGB(255, 255, 255, 255)),
        ),
        icon:
            const Icon(Icons.share, color: Color.fromARGB(255, 255, 255, 255)),
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
    // Als het veld focus krijgt en het 'datum'-veld is, toon een DatePicker
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

//--------------------USER MANUAL-------------------------------------

class UserManualPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              'Gebruikershandleiding voor de Verkeersongevallen App',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            UserManualStep(
              step: 'Stap 1: Kies ‘Aanrijdings formulier’',
              description:
                  'Open de app en selecteer de optie ‘Aanrijdengs Formulier’ om te beginnen met het invullen van het ongelukken formulier.',
            ),
            UserManualStep(
              step: 'Stap 2: Vul het formulier in met de juiste informatie',
              description:
                  'Beantwoord de vragen in de app zorgvuldig. Je zult verschillende soorten vragen tegenkomen, zoals:',
              subSteps: [
                'Ja/Nee vragen',
                'Vragen waarbij je tekst kunt invoeren (bijvoorbeeld naam, adres, telefoonnummer)',
                'Vragen met checkboxen om specifieke informatie aan te geven',
                'Vragen waar U zal moeten tekenen',
              ],
            ),
            UserManualStep(
              step: 'Stap 3: Dubbelcheck of alle informatie correct is',
              description:
                  'Neem de tijd om je antwoorden nogmaals te controleren. Zorg ervoor dat alle informatie die je hebt ingevuld juist en volledig is.',
            ),
            UserManualStep(
              step: 'Stap 4: Sla het formulier op als een PDF op uw telefoon',
              description:
                  'Nadat je alle vragen hebt beantwoord en gecontroleerd, sla je het ingevulde formulier op als een PDF-bestand op je telefoon. Deze optie zal beschikbaar zijn nadat je alle stappen hebt doorlopen.\n\nVoor het downloaden van een pdf moet u de volgende stappen volgen:',
              subSteps: [
                'Klik op het “Delen” knopje',
                'Druk up het “Print” icoontje',
                'Druk op het “PDF” icoontje dat verschijnt aan de bovenkant van de pagina',
                'Sla het op in uw telefoon in het mapje dat u kiest',
              ],
            ),
            UserManualStep(
              step: 'Stap 5: Het versturen is uw eigen verantwoordelijkheid',
              description:
                  'Het versturen van het ingevulde formulier naar je verzekeringsmaatschappij is je eigen verantwoordelijkheid. Je kunt dit bijvoorbeeld doen door de PDF via whatsapp te versturen. Zorg ervoor dat je een internetverbinding hebt om het bestand te kunnen versturen.',
            ),
          ],
        ),
      ),
    );
  }
}

class UserManualStep extends StatelessWidget {
  final String step;
  final String description;
  final List<String>? subSteps;

  UserManualStep(
      {required this.step, required this.description, this.subSteps});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          step,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        Text(
          description,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
        ),
        if (subSteps != null)
          ...subSteps!.map((subStep) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Text(
                  '• $subStep',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              )),
        SizedBox(height: 16),
      ],
    );
  }
}

//--------------------QuestionnairePage-------------------------------------

class QuestionnairePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: [
            SizedBox(height: 16),
            FAQItem(
              question: 'Wat is de app?',
              answer:
                  'De app is een handig hulpmiddel waarmee je een ongelukken formulier kunt invullen op je telefoon. Na het invullen kun je het formulier downloaden en vervolgens versturen naar je verzekeringsmaatschappij.',
            ),
            FAQItem(
              question: 'Hoe gebruik ik de app?',
              answer:
                  'Je kunt de app gebruiken door vragen te beantwoorden over het ongeluk. Er zijn verschillende soorten vragen, zoals ja/nee-vragen, tekstvelden voor details en checkboxen voor specifieke informatie. Vul de informatie over het ongeluk nauwkeurig in om een volledig en correct formulier te krijgen.',
            ),
            FAQItem(
              question: 'Hoe verstuur ik mijn ingevulde formulier?',
              answer:
                  'Nadat je alle vragen hebt beantwoord, kun je het ingevulde formulier downloaden als een PDF-bestand. Het versturen van het formulier naar je verzekeringsmaatschappij ligt vervolgens in jouw handen. Je kunt de PDF bijvoorbeeld via e-mail versturen.',
            ),
            FAQItem(
              question: 'Heb ik internet nodig voor deze app?',
              answer:
                  'Nee, de app werkt volledig offline. Je hebt geen internetverbinding nodig om het formulier in te vullen en op te slaan. Het versturen van de ingevulde PDF naar je verzekeringsmaatschappij vereist echter wel een internetverbinding, maar dat moet je zelf regelen op het moment van versturen.',
            ),
            SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () async {
                const url = 'https://forms.office.com/r/jwF42ckHHE';
                // ignore: deprecated_member_use
                if (await canLaunch(url)) {
                  // ignore: deprecated_member_use
                  await launch(url);
                } else {
                  throw 'Could not launch $url';
                }
              },
              icon: Icon(Icons.feedback,
                  color: Color.fromARGB(255, 255, 255, 255)),
              label: Text(
                'Feedback',
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF01C2D3), // Achtergrondkleur
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FAQItem extends StatelessWidget {
  final String question;
  final String answer;

  FAQItem({required this.question, required this.answer});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          question,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        Text(
          answer,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
        ),
        SizedBox(height: 16),
      ],
    );
  }
}

//--------------------------test code ------------------------------------------------
