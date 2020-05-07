import 'package:cvdTracker/constante.dart';
import 'package:cvdTracker/widgets/header.dart';
import 'package:cvdTracker/widgets/symptomCard.dart';
import 'package:flutter/material.dart';

import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Symtoms extends StatefulWidget {
  @override
  _SymtomsState createState() => _SymtomsState();
}

class _SymtomsState extends State<Symtoms> {
  final controller = ScrollController();
  double offset = 0;

  YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: 'LBulUolFf4I',
      flags: YoutubePlayerFlags(
          autoPlay: true,
          mute: false,
      ),
  );


  @override
  void initState() {

    super.initState();
    controller.addListener(onScroll);
  }

  @override
  void dispose() {

    controller.dispose();
    super.dispose();
  }

  void onScroll() {
    setState(() {
      offset = (controller.hasClients) ? controller.offset : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: controller,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            MyHeader(
              image: "assets/icons/man.svg",
              textTop: "Get to know",
              textBottom: "About Covid-19.",
              offset: offset,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Symptoms",
                    style: kTitleTextstyle,
                  ),
                  SizedBox(height: 20),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        SymptomCard(
                          image: "assets/images/2.png",
                          title: "Fever",
                          isActive: true,
                        ),
                        SymptomCard(
                          image: "assets/images/1.png",
                          title: "cold",
                        ),
                        SymptomCard(
                          image: "assets/images/4.png",
                          title: "Headache",
                        ),
                        SymptomCard(
                          image: "assets/images/3.png",
                          title: "Caugh",
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Text("Prevention", style: kTitleTextstyle),
                  SizedBox(height: 20),
                  YoutubePlayer(
                      controller: _controller,
                   //   liveUIColor: Colors.amber,
                  ),
                  SizedBox(height: 50),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
