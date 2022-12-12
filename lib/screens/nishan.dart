import 'package:flutter/material.dart';
void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
  ));
}
class nishan extends StatefulWidget {
  const nishan({super.key});

  @override
  State<nishan> createState() => _nishanState();
}

class _nishanState extends State<nishan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('movie app'),
        centerTitle: true,
      ),
    );
  }
}