import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 89, 237, 166),
        body: SafeArea( // Wrap the CardCarousel with a SafeArea widget
          child: Center(
            child: CardCarousel(),
          ),
        ),
      ),
    );
  }
}

class CardCarousel extends StatefulWidget {
  const CardCarousel({Key? key}) : super(key: key);

  @override
  _CardCarouselState createState() => _CardCarouselState();
}

class _CardCarouselState extends State<CardCarousel> {
  final PageController _controller = PageController(viewportFraction: 1);
  final List<Color> _colors = [
    Color.fromARGB(255, 34, 34, 34),
  ];

  // Create a list of data that contains the name, translation, and meaning of each item
  final List<List<String>> _data = [
    ['Ar Rahmaan', 'انتہائی مہربان', 'The Most Gracious'],
    ['Ar Raheem', 'انتہائی رحم کرنے والا', 'The Most Merciful'],
    ['Al Malik','مالک، بادشاہ','The Owner, The King, The Ruler'],
    ['','',''],
    ['','',''],
    ['','',''],
    ['','',''],
    ['','',''],
    ['','',''],
    ['','',''],
    ['','',''],
    ['','',''],
    ['','',''],
    ['','',''],
    ['','',''],
    ['','',''],
    ['','',''],
    ['','',''],
    ['','',''],
    ['','',''],

  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height - 9,
      width: MediaQuery.of(context).size.width - 9,
      child: PageView.builder(
        controller: _controller,
        itemCount: _data.length,
        itemBuilder: (context, index) {
          return AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              double value = 1;
              if (_controller.position.haveDimensions) {
                value = _controller.page! - index;
                value = (1 - (value.abs() * .5)).clamp(0.0, 1.0);
              }
              return Opacity(
                opacity: value,
                child: child,
              );
            },
            child: CardItem(
              color: _colors[index % _colors.length],
              data: _data[index], // Pass the data list to the CardItem widget
            ),
          );
        },
      ),
    );
  }
}

class CardItem extends StatelessWidget {
  const CardItem({Key? key, required this.color, required this.data})
      : super(key: key);

  final Color color;
  final List<String> data; // Receive the data list as a parameter

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13),
        gradient: LinearGradient(
          colors: [color, color.withOpacity(1)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: Column( // Use a Column widget to display the text in three lines
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text( // Display the name
              data[0],
              style: TextStyle(
                fontSize: 37,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 89, 237, 166),
              ),
            ),
            SizedBox(height: 16), // Add a SizedBox with a height of 16 pixels
            Text( // Display the translation
              data[1],
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.normal,
                color: Color.fromARGB(255, 89, 237, 166),
              ),
            ),
            SizedBox(height: 16), // Add another SizedBox with a height of 16 pixels
            Text( // Display the meaning
              data[2],
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.normal,
                color: Color.fromARGB(255, 89, 237, 166),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
