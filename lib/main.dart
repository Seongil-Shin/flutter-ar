import 'package:flutter/material.dart';
import 'package:ar_flutter_plugin/ar_flutter_plugin.dart';
import 'package:flutter_ar/examples/debugoption.dart';
import 'package:flutter_ar/examples/objectgestureexample.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter AR Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter AR Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Expanded(child: ExampleList())
        ],
      ),
    );
  }
}

class ExampleList extends StatelessWidget {
  const ExampleList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final examples = [
      Example(
        'Debug options',
        'Visualize feature points, planes and world coordinate system',
          () => Navigator.push(context, MaterialPageRoute(builder:(context) => DebugOptionWidget()))
      ),

      Example(
          'Object & Anchors on Planes',
          ' Planes	AR Scene in which tapping on a plane creates an anchor with a 3D model attached to it',
              () => Navigator.push(context, MaterialPageRoute(builder:(context) => ObjectGesturesWidget()))
      )
    ];
    return ListView(
      children:examples.map((example) => ExampleCard(example:example)).toList()
    );
  }
}

class ExampleCard extends StatelessWidget {
  const ExampleCard({Key? key, required this.example}) : super(key: key);
  final Example example;

  @override
  Widget build(BuildContext context) {
    return Card(
      child:InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap:() {
          example.onTap();
        },
        child : ListTile(
          title:Text(example.name),
          subtitle: Text(example.description),
        )
      )
    );
  }
}


class Example {
  const Example(this.name, this.description, this.onTap);
  final String name;
  final String description;
  final Function onTap;
}


