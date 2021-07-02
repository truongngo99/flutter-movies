import 'package:flutter/material.dart';
import 'package:flutter_movies/utils/preference_util.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
        
      ),
      body: Text('${PreferenceUtils.getString('session_id')}'),
    );
  }
}
