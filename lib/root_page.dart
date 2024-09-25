import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
      backgroundColor: Colors.black.withRed(20),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [ Colors.red.shade900,
              Colors.black.withRed(20)],
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0,left: 20,right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
                          child: Image.asset('assets/pfp.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Christiana Amandla",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 17
                              ),
                            ),
                            const SizedBox(height: 2,),
                            Text("Lets Watch something refreshing!",
                              style: GoogleFonts.poppins(
                                  fontSize: 13,
                                  color: Colors.grey.shade700
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    Icon(Icons.density_medium_outlined)
                  ],
                ),
              ),


              Container(
                width: MediaQuery.of(context).size.width,
                color: Color.fromRGBO(21,19,24,1),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0,right: 15,top: 10),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Text('TV Shows',
                        style: TextStyle(
                          fontSize: 24
                        ),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 12.0),
                        child: Container(
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
                              hintText: 'Search for shows',
                              hintStyle: TextStyle(color: Colors.grey[300],),  // Light grey hint text
                              prefixIcon: Icon(Icons.search, color: Colors.grey[300]),  // Magnifying glass icon
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(vertical: 12),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(child: _pages[_currentIndex]),
            ],
          ),
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
