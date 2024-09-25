import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quad_movies/splash_screen.dart';

import 'api_services/api_services.dart';
import 'models/model.dart';
import 'models/search_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SearchModel(),
      child: MaterialApp(
        title: 'Netflix Style App',
        theme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.red,
        ),
        home: SplashScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class ShowSearchScreen extends StatefulWidget {
  @override
  _ShowSearchScreenState createState() => _ShowSearchScreenState();
}

class _ShowSearchScreenState extends State<ShowSearchScreen> {
  List<Show> _searchResults = [];
  bool _isLoading = false;
  TextEditingController _searchController = TextEditingController();

  Future<void> _performSearch(String searchTerm) async {
    setState(() {
      _isLoading = true;
    });

    try {
      List<Show> shows = await ApiService.searchShows(searchTerm);
      setState(() {
        _searchResults = shows;
        _isLoading = false;
      });
    } catch (error) {
      setState(() {
        _isLoading = false;
      });
      print('Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TV Shows'),
      ),
      body: FutureBuilder<List<Show>>(
        future: ApiService().fetchShows(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No shows found.'));
          } else {
            final shows = snapshot.data!;

            return ListView.builder(
              itemCount: shows.length,
              itemBuilder: (context, index) {
                final show = shows[index];
                return ListTile(
                  leading: show.image.medium.isNotEmpty
                      ? Image.network(show.image.medium)
                      : SizedBox.shrink(),
                  title: Text(show.name),
                  subtitle: Text(show.language),
                  trailing: Text(show.rating.average.toString()),
                  onTap: () {
                    // Add logic to handle item click
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}

