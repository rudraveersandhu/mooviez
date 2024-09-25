import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:shimmer/shimmer.dart';

import '../models/model.dart';

class MovieInfoScreen extends StatefulWidget {
  final Show show;
  const MovieInfoScreen({super.key,required this.show});

  @override
  State<MovieInfoScreen> createState() => _MovieInfoScreenState();
}

class _MovieInfoScreenState extends State<MovieInfoScreen> with TickerProviderStateMixin {

  final ScrollController _controller1 = ScrollController();
  final ScrollController _controller2 = ScrollController();
  late AnimationController _controller;
  late Animation<double> _animation;

  bool _isMounted = false;


  void _onScrollEvent() {
    _controller1.jumpTo(_controller2.offset);
  }


  @override
  void initState() {

    _isMounted = true;
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600),
    );
    _animation = Tween(begin: 0.0,end: 1.0).animate(_controller);

    _controller2.addListener(_onScrollEvent);
    super.initState();
  }

  @override
  void dispose() {
    _isMounted = false;
    _controller1.dispose();
    _controller2.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black.withRed(70),
              Colors.black.withOpacity(.96)
            ],
            stops: [
              0.3,
              .65
            ]),
      ),
      child: Stack(
        children: [
          NestedScrollView(
              physics: const BouncingScrollPhysics(),
              controller: _controller1,
              headerSliverBuilder: (BuildContext context, bool innerBoxScrolled,) {
                return <Widget>[
                  SliverAppBar(
                    expandedHeight: 360,
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    pinned: false,
                    toolbarHeight: 40,
                    leading: IconButton(
                      icon: Icon(Icons.arrow_back,color:Colors.white), // Change this to your custom icon
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    //floating: true,
                    automaticallyImplyLeading: true,
                    flexibleSpace: LayoutBuilder(
                      builder: (
                          BuildContext context,
                          BoxConstraints constraints,
                          ) {
                        return FlexibleSpaceBar(
                          background: GestureDetector(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                const SizedBox(
                                  height: 80,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.8),  // Shadow color
                                        spreadRadius: 15,  // How far the shadow spreads
                                        blurRadius: 50,    // Softness of the shadow
                                        offset: Offset(0, 3),  // Position of the shadow (x, y)
                                      ),
                                    ],
                                  ),
                                  child: CachedNetworkImage(
                                    imageUrl: widget.show.image.medium,
                                    fit: BoxFit.cover,
                                    placeholder: (context, url) => SizedBox(
                                      width: 200.0,
                                      height: 400.0,
                                      child: Shimmer.fromColors(
                                        baseColor: Colors.black.withRed(50),
                                        highlightColor: Colors.black.withRed(150),
                                        child: Container(
                                          width: 200.0,
                                          height: 400.0,
                                          color: Colors.grey[300],
                                        ),
                                      ),
                                    ),
                                    errorWidget: (context, url, error) => Icon(Icons.error),
                                  ),
                                ),
                                const SizedBox(height: 13),
                              ],
                            ),
                          ),
                        ); // the vanishing upper part
                      },
                    ),
                  ),
                ];
              },
              body: SingleChildScrollView(
                controller: _controller2,
                physics: NeverScrollableScrollPhysics(),
                child: Material(
                  color: Colors.transparent,
                  child: Stack(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.black.withRed(20),
                              Colors.black.withRed(40),

                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 15.0, top: 15),
                                child: Container(
                                    width: MediaQuery.of(context).size.width - 120,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(
                                              CupertinoIcons.waveform_path,
                                              color: Colors.grey.shade500,
                                            ),
                                            SizedBox(
                                              width: 7,
                                            ),
                                            Column(
                                              children: [
                                                Text(
                                                  "Listen on Strings",
                                                  maxLines: 3,
                                                  style: TextStyle(
                                                      color: Colors.grey.shade500,
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.w500),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),

                                      ],
                                    )),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Icon(
                                  Icons.play_circle_filled_rounded,
                                  color: Colors.white,
                                  size: 77,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
          )
        ],
      ),
    );
  }
}
