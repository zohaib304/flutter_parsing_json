import 'package:flutter/material.dart';
import './model/posts_model.dart';
import 'services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Posts> posts = <Posts>[];

  @override
  void initState() {
    super.initState();
    Services.getPosts().then((list) {
      setState(() {
        posts = list;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Json"),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: posts.length,
          itemBuilder: (context, index) {
          Posts p = posts[index];
          return ListTile(
            title: Text(p.title),
            subtitle: Text(p.body),
          );
        }),
      ),
    );
  }
}
