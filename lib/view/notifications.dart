import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(NotificationsApp());
}

class NotificationsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notifications',
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primarySwatch: Colors.blue,
      ),
      home: NotificationsPage(),
    );
  }
}

class NotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
        backgroundColor: Colors.blue.shade700,
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          _buildNotificationCard(
            context,
            Icons.notifications,
            'Notification Title 1',
            'This is the description of the notification. It gives details about what happened.',
            Colors.blue.shade100,
          ),
          _buildNotificationCard(
            context,
            Icons.star,
            'Notification Title 2',
            'This is another description of the notification. This one is a bit different.',
            Colors.green.shade100,
          ),
          _buildNotificationCard(
            context,
            Icons.error,
            'Notification Title 3',
            'Description for a warning or error notification. Action might be required.',
            Colors.red.shade100,
          ),
          // Ajoutez d'autres notifications ici
        ],
      ),
    );
  }

  Widget _buildNotificationCard(
    BuildContext context,
    IconData icon,
    String title,
    String description,
    Color backgroundColor,
  ) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.all(16.0),
        leading: Icon(icon, size: 40, color: backgroundColor),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.blue.shade900,
          ),
        ),
        subtitle: Text(
          description,
          style: TextStyle(
            color: Colors.grey.shade700,
            fontSize: 14,
          ),
        ),
        tileColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        onTap: () {
          // Action à réaliser lors de l'appui sur la notification
        },
      ),
    );
  }
}
