import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:quad_movies/widgets/show_item.dart';
import 'package:shimmer/shimmer.dart';

import '../api_services/api_services.dart';
import '../models/model.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {


  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller and animation
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1), // Set the duration of the fade-in effect
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(

        color: Color.fromRGBO(21,19,24,1),
        child: FutureBuilder<List<Show>>(
          future: ApiService.fetchAllShows(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: SizedBox(
                      width: 50.0,
                      height: 50.0,
                      child: Shimmer.fromColors(
                        baseColor: Colors.black.withRed(50),
                        highlightColor: Colors.black.withRed(150),
                        child: Container(
                          width: 50.0,
                          height: 50.0,
                          color: Colors.grey[300],
                        ),
                      ),
                    ),
                    title: Text('Movie'),
                    subtitle: Text('language'),
                    trailing: Text('Rating'),
                    onTap: () {
                      // Add logic to handle item click
                    },
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text('No shows found.'));
            } else {
              _controller.forward();
              final shows = snapshot.data!;

              // Use AnimatedBuilder for the fade effect
              return AnimatedBuilder(
                animation: _fadeAnimation,
                builder: (context, child) {
                  return Opacity(
                    opacity: _fadeAnimation.value,
                    child: ListView.builder(
                      itemCount: shows.length,
                      itemBuilder: (context, index) {
                        final show = shows[index];

                        return GestureDetector(
                          onTap: (){
                            print(show);
                            print("fvdfvdfvdf");
                          },
                            child: Container(child: ShowItem(show: show)));
                      },
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
