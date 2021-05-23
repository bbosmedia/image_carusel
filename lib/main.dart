import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: _MyHomePage(),
    );
  }
}

class _MyHomePage extends StatefulWidget {
  @override
  __MyHomePageState createState() => __MyHomePageState();
}

class __MyHomePageState extends State<_MyHomePage> {
  int photoIndex = 0;

  void _previousImage() {
    setState(() {
      photoIndex = photoIndex > 0 ? photoIndex - 1 : photos.length - 1;
    });
  }

  void _nextImage() {
    setState(() {
      photoIndex = photoIndex < photos.length - 1 ? photoIndex + 1 : 0;
    });
  }

  List<String> photos = [
    'assets/images/burger1.jpg',
    'assets/images/burger2.jpg',
    'assets/images/burger3.jpg',
    'assets/images/burger4.jpg'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(photos[photoIndex]), fit: BoxFit.cover),
              ),
              height: 400.0,
              width: double.infinity,
            ),
            Positioned(
              top: 375,
              left: 25.0,
              right: 25.0,
              child: SelectedPhoto(numberOfDots: photos.length, photoIndex: photoIndex,),
            )
          ]),
          SizedBox(
            height: 40,
          ),
          Row(
            children: [
              RaisedButton(
                onPressed: _previousImage,
                child: Text("Prev"),
                elevation: 5.0,
                color: Colors.green[500],
              ),
              RaisedButton(
                  onPressed: _nextImage,
                  child: Text("Next"),
                  elevation: 5.0,
                  color: Colors.red[500]),
            ],
          ),
        ],
      ),
    );
  }
}

class SelectedPhoto extends StatelessWidget {
  final int numberOfDots;
  final int photoIndex;
  SelectedPhoto({required this.numberOfDots, required this.photoIndex});

  Widget _inactivePhoto(){
    return Container(
      child: Padding(
        padding: EdgeInsets.only(left: 3.0, right: 3.0),
        child: Container(
          height: 8.0,
          width: 8.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.0),
            color: Colors.grey,
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                spreadRadius: 0.0,
                blurRadius: 2.0
              )
            ]
          ),
        ),
      ),
    );
  }



  Widget _activePhoto(){
    return Container(
      child: Padding(
        padding: EdgeInsets.only(left: 3.0, right: 3.0),
        child: Container(
          height: 10.0,
          width: 10.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: Colors.white,

          ),
        ),
      ),
    );
  }

  List <Widget> _buildDots(){
    List<Widget> dots =[];

    for(var i = 0; i < numberOfDots; i++){
      dots.add(i == photoIndex ? _activePhoto() : _inactivePhoto());
    }
    return dots;
  }


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: _buildDots(),
      ),
    );
}}
