import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quad_movies/models/search_model.dart';
import 'package:quad_movies/widgets/show_item.dart';

import '../api_services/api_services.dart';
import '../models/model.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {


  @override
  Widget build(BuildContext context) {
    return Consumer<SearchModel>(
        builder: (context, model, child) {
          return Scaffold(
            body: Container(
              color: Color.fromRGBO(21,19,24,1),
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
              Expanded(
                child: ListView.builder(
                itemCount: model.shows.length,
                  itemBuilder: (context, index) {
                    final show = model.shows[index];
                    return ShowItem(show: show); // Use ShowItem to display each show
                  },
                ),
              ),

                ],
              ),
            ),

          );
        });

  }


}
