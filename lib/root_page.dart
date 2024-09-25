import 'package:flutter/material.dart';
import 'package:quad_movies/home_page.dart';

class RootPage extends StatefulWidget {
  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    Center(child: Text('Search Page', style: TextStyle(color: Colors.white))),
    Center(child: Text('Profile Page', style: TextStyle(color: Colors.white))),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Column(
          children: [

            Container(
              width: MediaQuery.of(context).size.width * .9,  // Adjust the width as necessary
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.black.withRed(30),  // Dark grey background for the container
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey[300]!),  // Light grey border
              ),
              child: TextField(
                style: TextStyle(color: Colors.white),  // Text color inside the field
                decoration: InputDecoration(
                  hintText: 'Search for movies',
                  hintStyle: TextStyle(color: Colors.grey[300],),  // Light grey hint text
                  prefixIcon: Icon(Icons.search, color: Colors.grey[300]),  // Magnifying glass icon
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 12),
                ),
              ),
            ),
            Expanded(child: _pages[_currentIndex]),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.white60,
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
