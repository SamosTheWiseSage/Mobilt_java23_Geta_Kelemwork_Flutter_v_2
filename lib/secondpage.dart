
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'main.dart';

class secondPage extends StatefulWidget {
  const secondPage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<secondPage> createState() => _secondPageState();
}

class _secondPageState extends State<secondPage> {
  int _counter = 1;
  String url = "https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg";
  void _incrementCounter() {
    setState(() {
      debugPrint(_counter.toString());
      if(_counter < 3){
        _counter++;
      }

      if(_counter == 2){
        url = 'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg';
      } else if(_counter == 3){
        url = 'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-3.jpg';
      } else if(_counter == 4){

      }
      else if(_counter == 1){
        url = "https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg";
      }
    });
  }void _incrementCounterMinus() {
    setState(() {
      debugPrint(_counter.toString());
      if(_counter > 1){
        _counter--;
      }
      if(_counter == 2){
        url = 'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg';
      } else if(_counter == 3){
        url = 'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-4.jpg';
      } else if(_counter == 1){
       url = "https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many timesnot:',
            ),
            Row(
              children: <Widget>[
                const Expanded(
                  child: Text('Deliver features faster', textAlign: TextAlign.center),
                ),
                const Expanded(
                  child: Text('Craft beautiful UIs', textAlign: TextAlign.center),
                ),
                Expanded(
                   child: FilledButton(onPressed: ()=>{
                   Navigator.pushNamed(context, '/')}, child: const Text("Switch Page back")),
                  ),
              ],
            ),
          Center(
              child: Image.network(url,cacheWidth: 400, cacheHeight: 400,)
            ),
            ElevatedButton(onPressed: ()=>{
              _incrementCounterMinus()
            }, child: Text("Prev")),
            ElevatedButton(onPressed: ()=>{
              _incrementCounter()
            }, child: Text("Next")),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}