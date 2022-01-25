import 'package:flutter/material.dart';
class notificationsE extends StatelessWidget {
  const notificationsE({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const <Widget>[
        Card(
          child: ListTile(
            leading: FlutterLogo(size: 56.0),
            title: Text('Juan Lopez'),
            subtitle: Text('Accepted  your job offer'),
            trailing: Icon(Icons.message),
          ),
        ),
        Card(
          child: ListTile(
            leading: FlutterLogo(size: 56.0),
            title: Text('Maria Perez'),
            subtitle: Text('Wants to chat with you'),
            trailing: Icon(Icons.message),
          ),
        ),

        Card(
          child: ListTile(
            leading: FlutterLogo(size: 56.0),
            title: Text('Leo Lopez'),
            subtitle: Text('Accepted  your job offer'),
            trailing: Icon(Icons.message),
          ),
        ),
        Card(
          child: ListTile(
            leading: FlutterLogo(size: 56.0),
            title: Text('Maddie Perez'),
            subtitle: Text('Wants to chat with you'),
            trailing: Icon(Icons.message),
          ),
        ),

        Card(
          child: ListTile(
            leading: FlutterLogo(size: 56.0),
            title: Text('Juan Lopez'),
            subtitle: Text('Declined  your job offer'),

          ),
        ),
        Card(
          child: ListTile(
            leading: FlutterLogo(size: 56.0),
            title: Text('George Perez'),
            subtitle: Text('Declined  your job offer'),

          ),
        ),

        Card(
          child: ListTile(
            leading: FlutterLogo(size: 56.0),
            title: Text('Juan Lopez'),
            subtitle: Text('Requesting job offer'),
            trailing: Icon(Icons.check_circle),
          ),
        ),
        Card(
          child: ListTile(
            leading: FlutterLogo(size: 56.0),
            title: Text('George Perez'),
            subtitle: Text('Wants to chat with you'),
            trailing: Icon(Icons.message),
          ),
        ),

        Card(
          child: ListTile(
            leading: FlutterLogo(size: 56.0),
            title: Text('Juan Lopez'),
            subtitle: Text('Requesting job offer'),
            trailing: Icon(Icons.check_circle),
          ),
        ),
        Card(
          child: ListTile(
            leading: FlutterLogo(size: 56.0),
            title: Text('George Perez'),
            subtitle: Text('Wants to chat with you'),
            trailing: Icon(Icons.message),
          ),
        ),

      ],
    );
  }
}
