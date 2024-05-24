import 'package:flutter/material.dart';
import 'save_screen.dart';
import 'update_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dynamic Terabox App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SaveScreen()));
              },
              child: Text('Save Data'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => UpdateScreen()));
              },
              child: Text('Update Data'),
            ),
          ],
        ),
      ),
    );
  }
}
