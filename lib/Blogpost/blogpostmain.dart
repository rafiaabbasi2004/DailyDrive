import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Blogscreen extends StatefulWidget {
  const Blogscreen({super.key});

  @override
  State<Blogscreen> createState() => _BlogscreenState();
}

class _BlogscreenState extends State<Blogscreen> {
  final List<String> quotes = [
    "The only way to do great work is to love what you do. - Steve Jobs",
    "The best time to plant a tree was 20 years ago. The second best time is now.",
    "Your time is limited, don’t waste it living someone else’s life. - Steve Jobs",
    "The best revenge is massive success. - Frank Sinatra",
    "Life is what happens when you’re busy making other plans. - John Lennon",
    "Do not wait to strike till the iron is hot; but make it hot by striking. - William B. Sprague",
    "You miss 100% of the shots you don’t take. - Wayne Gretzky",
  ];

  // List of different texts for the cards
  final List<String> cardTexts = [
    "Discover new strategies for productivity..",
    "Learn to prioritize your tasks effectively..",
    "Techniques to stay focused and motivated..",
    "Ways to balance work and personal life..",
  ];

  void _showMore(int index) {
    // Navigate to the appropriate detail screen based on the index
    String routeName = '';
    switch (index) {
      case 0:
        routeName = '/discover';
        break;
      case 1:
        routeName = '/prioritize';
        break;
      case 2:
        routeName = '/stayfocused';
        break;
      case 3:
        routeName = '/balance';
        break;

    }

    if (routeName.isNotEmpty) {
      Navigator.pushNamed(context, routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Daily Motivation'),
      ),
      body: Column(
        children: [
          CarouselSlider.builder(
            options: CarouselOptions(
              height: 200.0,
              enlargeCenterPage: true,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 5),
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              viewportFraction: 0.8,
            ),
            itemCount: quotes.length,
            itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
                Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.pink,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        quotes[itemIndex],
                        style: TextStyle(
                          fontSize: 18,
                          fontStyle: FontStyle.italic,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
          ),
          SizedBox(height: 25),

          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: List.generate(cardTexts.length, (index) => Container(
                  margin: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2), // shadow color
                        spreadRadius: 3, // spread radius
                        blurRadius: 4, // blur radius
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),

                    child: Padding(
                      padding: const EdgeInsets.all(25.0),

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(

                            child: Text(
                              cardTexts[index], // Use the list of texts
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.pink,
                              padding: EdgeInsets.symmetric(horizontal: 13, vertical: 10),

    ),


                            onPressed: () => _showMore(index),
                            child: Text(
                              'Show more',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )),
              ),
            ),

        ],
      ),
    );
  }
}
