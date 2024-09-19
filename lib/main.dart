import 'package:flutter/material.dart';
import 'package:flutter_v2/secondpage.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(title:'Flutter Owl Free Pics'),
        '/second': (context) => const secondPage(title:'SecondPage'),
      },

      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _counter = 0;
  TextEditingController textEditingController = TextEditingController();
  void ToastAlarm(){
    Fluttertoast.showToast(
        msg: "you cant be none! type a name good sir/madam",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        webBgColor: "linear-gradient(to right, #00b09b, #96c93d)",
        textColor: Colors.white,
        fontSize: 16.0
    );
  }
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Please enter details to receive owl pics'),
            Form(child: TextFormField(
              controller: textEditingController,
              decoration: const InputDecoration(
                icon: Icon(Icons.person),
                hintText: 'What do people call you?',
                labelText: 'Name *',
              ),
              onSaved: (String? value) {
                // This optional block of code can be used to run
                // code when the user saves the form.
              },
              validator: (String? value) {
                return (value != null && value.contains('@')) ? 'Do not use the @ char.' : null;
              },
            )),
             Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(onPressed: ()=>{
                if(textEditingController.text.isEmpty) {
                 ToastAlarm()
                } else{
                Navigator.pushNamed(context, '/second') }
                }, child: const Text("Switch Page back")),
    ),
               Center(
                child: Image.network('https://upload.wikimedia.org/wikipedia/commons/thumb/3/3e/'
                    'Owl._Birds_-_defenders_of_the_forest._USSR_stamp._1979.jpg/'
                    '640px-Owl._Birds_-_defenders_of_the_'
                    'forest._USSR_stamp._1979.jpg', cacheHeight: 400,cacheWidth: 400,)

            ),
            Row(
              children: <Widget>[
              ],
            ),
          ],
        ),
      ),
    );
  }
}
