// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, unused_field, prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';

void main() {
  runApp(RegisterApp());
}

class RegisterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CFPay Registration',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.poppinsTextTheme(),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: RegisterPage(),
    );
  }
}

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final PageController _pageController = PageController();
  final _formKey1 = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  final _formKey3 = GlobalKey<FormState>();

  String _firstName = '';
  String _lastName = '';
  String _number = '';
  String _phone = '';
  String _pin = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Arrière-plan avec effet de dégradé
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                colors: [Colors.blue.shade100, Colors.white],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
              color: Colors.white.withOpacity(0.2),
              ),
            ),
          ),
          PageView(
            controller: _pageController,
            children: [
              // Étape 1: Nom et Prénom
              _buildPage(
                context,
                formKey: _formKey1,
                title: 'Entrez votre nom et prénom',
                children: [
                  _buildTextField(
                    label: 'Prénom',
                    onSaved: (value) => _firstName = value!,
                    icon: Icons.person,
                  ),
                  _buildTextField(
                    label: 'Nom',
                    onSaved: (value) => _lastName = value!,
                    icon: Icons.person,
                  ),
                ],
                onNext: () {
                  if (_formKey1.currentState?.validate() ?? false) {
                    _formKey1.currentState?.save();
                    _pageController.nextPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  }
                },
                onBack: () {
                  _pageController.previousPage(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                },
              ),
              // Étape 2: Numéro
              _buildPage(
                context,
                formKey: _formKey2,
                title: 'Entrez votre numéro',
                children: [
                  _buildTextField(
                    label: 'Numéro',
                    keyboardType: TextInputType.number,
                    onSaved: (value) => _number = value!,
                    icon: Icons.confirmation_number,
                  ),
                ],
                onNext: () {
                  if (_formKey2.currentState?.validate() ?? false) {
                    _formKey2.currentState?.save();
                    _pageController.nextPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  }
                },
                onBack: () {
                  _pageController.previousPage(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                },
              ),
              // Étape 3: Numéro de téléphone
              _buildPage(
                context,
                formKey: _formKey3,
                title: 'Entrez votre numéro de téléphone',
                children: [
                  _buildTextField(
                    label: 'Numéro de téléphone',
                    keyboardType: TextInputType.phone,
                    onSaved: (value) => _phone = value!,
                    icon: Icons.phone,
                  ),
                ],
                onNext: () {
                  if (_formKey3.currentState?.validate() ?? false) {
                    _formKey3.currentState?.save();
                    _pageController.nextPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  }
                },
                onBack: () {
                  _pageController.previousPage(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                },
              ),
              // Étape 4: Code PIN
              _buildPinPage(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPage(
    BuildContext context, {
    required GlobalKey<FormState> formKey,
    required String title,
    required List<Widget> children,
    required VoidCallback onNext,
    required VoidCallback onBack,
  }) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          Form(
            key: formKey,
            child: Column(
              children: [
                ...children,
                SizedBox(height: 20),
                Row(
                  children: [
                    ElevatedButton.icon(
                      onPressed: onBack,
                      icon: Icon(Icons.arrow_back),
                      label: Text('Retour'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue.shade600,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 15),
                      ),
                    ),
                    Spacer(),
                    ElevatedButton.icon(
                      onPressed: onNext,
                      icon: Icon(Icons.arrow_forward),
                      label: Text('Suivant'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue.shade700,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 15),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required FormFieldSetter<String> onSaved,
    TextInputType keyboardType = TextInputType.text,
    bool obscureText = false,
    required IconData icon,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: label,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          prefixIcon: Icon(icon, color: Colors.blue.shade700),
        ),
        keyboardType: keyboardType,
        obscureText: obscureText,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Ce champ est requis';
          }
          return null;
        },
        onSaved: onSaved,
      ),
    );
  }

  Widget _buildPinPage() {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Entrez votre code PIN',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          _buildPinInput(),
          SizedBox(height: 20),
          Row(
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  _pageController.previousPage(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                },
                icon: Icon(Icons.arrow_back),
                label: Text('Retour'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade600,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 15),
                ),
              ),
              Spacer(),
              ElevatedButton.icon(
                onPressed: () {
                  if (_pin.length == 4) {
                    // Action à faire après l'inscription
                    Navigator.pushReplacementNamed(context, '/home');
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Veuillez entrer un code PIN de 4 chiffres.'),
                      ),
                    );
                  }
                },
                icon: Icon(Icons.arrow_forward),
                label: Text('Suivant'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade700,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 15),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPinInput() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(4, (index) {
            return Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: Center(
                child: Text(
                  _pin.length > index ? '•' : '',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                  ),
                ),
              ),
            );
          }),
        ),
        SizedBox(height: 20),
        GridView.builder(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemCount: 12,
          itemBuilder: (context, index) {
            if (index == 9) {
              return SizedBox.shrink(); // Empty space for grid alignment
            } else if (index == 11) {
              return ElevatedButton(
                onPressed: () {
                  if (_pin.isNotEmpty) {
                    setState(() {
                      _pin = _pin.substring(0, _pin.length - 1);
                    });
                  }
                },
                child: Icon(Icons.backspace),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red.shade600,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              );
            } else {
              final number = index == 10 ? 0 : index + 1;
              return ElevatedButton(
                onPressed: () {
                  if (_pin.length < 4) {
                    setState(() {
                      _pin += number.toString();
                    });
                  }
                },
                child: Text(
                  number.toString(),
                  style: TextStyle(fontSize: 24),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade700,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
