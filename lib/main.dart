import 'dart:ui';

import 'package:flutter/material.dart';
import 'Booking Page/elements.dart';

void main()
{
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Strip {
  final double width;
  final double height;

  Strip({required this.width, required this.height});
}


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final List<Strip> strips = [
    Strip(width: 20, height: 50),
    Strip(width: 20, height: 100),
    Strip(width: 20, height: 70),
    Strip(width: 20, height: 20),
    Strip(width: 20, height: 50),
    Strip(width: 20, height: 100),
    Strip(width: 20, height: 70),
    Strip(width: 20, height: 20),
    Strip(width: 20, height: 50),
    Strip(width: 20, height: 100),
    Strip(width: 20, height: 70),
    Strip(width: 20, height: 20),
    Strip(width: 20, height: 50),
    Strip(width: 20, height: 100),
    Strip(width: 20, height: 70),
    Strip(width: 20, height: 20),
    Strip(width: 20, height: 50),
    Strip(width: 20, height: 100),
    Strip(width: 20, height: 70),
    Strip(width: 20, height: 20),
    // Add more strips with different dimensions
  ];
  double scroller =0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Stack(
                alignment: Alignment.bottomCenter,
                // fit: StackFit.expand,
                children: <Widget>[
                  Image(image: AssetImage('assets/maps.jpg'),fit: BoxFit.cover,alignment: Alignment.bottomCenter),
                  ImageFiltered(
                      imageFilter: ImageFilter.blur(sigmaX: 5, sigmaY: 10),
                      child: ShaderMask(
                        shaderCallback: (rect) {
                          return LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Colors.black, Colors.black.withOpacity(0)],
                              stops: [0.4, 0.75]).createShader(rect);
                        },
                        blendMode: BlendMode.dstOut,
                        child: Image(image: AssetImage('assets/maps.jpg') , fit: BoxFit.cover,alignment: Alignment.bottomCenter),
                      )
                  ),
                ]),
            SizedBox(height: MediaQuery.of(context).size.height*0.05,),
            Container(
              margin: EdgeInsets.only(left: 20),
              child: Align(alignment: Alignment.centerLeft,child: Text("I Wanna go from " , style: TextStyle(fontSize: 20 , fontWeight: FontWeight.w900),)),
            ),

            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("${scroller}"),
                  Text("am")
                ],
              ),
            ),

            Stack(
              children: [

                Positioned.fill(
                  child: SingleChildScrollView(
                    controller: ScrollController(initialScrollOffset: scroller, keepScrollOffset: true),
                    // controller : _scrollController,
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: strips.map((Strip strip) {
                        return Container(
                          width: strip.width,
                          height: strip.height,
                          color: Colors.green,
                          margin: EdgeInsets.only(right: 5),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                Align(alignment: Alignment.center,child: DashedLine())
              ],
            )
          ],
        ),
      ),
    );
  }
}
