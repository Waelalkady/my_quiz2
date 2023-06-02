import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';


void main() {
  SystemChrome.setSystemUIOverlayStyle(// مشكلة الخط عللاى التطبيق
      const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     
      debugShowCheckedModeBanner: false,
      title: 'my quiz',
      theme: ThemeData(
        primarySwatch: Colors.indigo
      ),
      
      home:  HomeScreen(title: 'my quiz',),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});//تعديل
  
  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
 

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      body: ListView(
        padding:EdgeInsets.zero,
        children: [
          Container(
            height: 100,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20)
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 30),
                    title: Text("My Quiz",style:Theme.of(context).textTheme.headlineSmall?.copyWith(
                     color: Colors.white
                    )),
                    subtitle: Text("wael alqady",style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.white54
                    ),),
                    trailing:const CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('assets/images/logo.jpg'),
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
          Container(
            color: Theme.of(context).primaryColor,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(100)
                )
              ),
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 40,
                mainAxisSpacing: 30,
                children: [
                  itemDashbord('Videos', CupertinoIcons.play_rectangle, Colors.deepOrange),
                  itemDashbord('image', CupertinoIcons.graph_circle, Colors.black),
                  itemDashbord('audio', CupertinoIcons.person_2, Colors.black26),
                  itemDashbord('commints', CupertinoIcons.chat_bubble_2, Colors.cyan),
                  itemDashbord('revenue', CupertinoIcons.money_dollar, Colors.deepOrangeAccent),
                  itemDashbord('upload', CupertinoIcons.add_circled, Colors.lime),
                  itemDashbord('about', CupertinoIcons.question_circle_fill, Colors.yellowAccent),
                  itemDashbord('contect', CupertinoIcons.phone, Colors.greenAccent),
                  itemDashbord('about', CupertinoIcons.question_circle_fill, Colors.yellowAccent),
                  itemDashbord('contect', CupertinoIcons.phone, Colors.greenAccent),



                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  itemDashbord(String title,IconData iconData, Color backgraound) => Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
          offset: const Offset(0, 5),
          color: Theme.of(context).primaryColor.withOpacity(.2),
          spreadRadius: 2,
          blurRadius: 5
        )
  ]
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: backgraound,
            shape: BoxShape.circle
          ),
          child: Icon(iconData, color: Colors.white),
        ),
        const SizedBox(height: 8),
        Text(title, style: Theme.of(context).textTheme.titleMedium,)
      ],
    ),
  );
}