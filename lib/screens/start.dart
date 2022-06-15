import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/home/home.dart';
import 'package:custom_page_route/custom_page_route.dart';

class Start extends StatelessWidget {
  const Start({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final fontstyle_1 = GoogleFonts.oswald(fontSize: 25, fontWeight: FontWeight.w300, color: Colors.blueGrey.shade600);
    final fontstyle_2 = GoogleFonts.oswald(fontSize: 15, fontWeight: FontWeight.w300, color: Colors.blueGrey.shade300);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 100),
        child: Column(
          children: <Widget>[
            Image.asset(
                'assets/images/start.jpg',
            ),
            Text(
              "Tired of managing tasks?",
              style: fontstyle_1,
              textAlign: TextAlign.justify,
            ),
            Text(
                "Here we come to manage your tasks with some excellent features.",
              style: fontstyle_2,
            ),
            Container(
              margin: EdgeInsetsDirectional.only(top: 170),
              height: 70,
              width: 70,
              decoration: ShapeDecoration(
                color: Colors.black12,
                shape: CircleBorder(),
              ),
              child: IconButton(
                icon: Icon(Icons.arrow_forward_ios, size: 40, color: Colors.blueGrey.shade600,),
                onPressed: () => Navigator.of(context).push(
                  CustomPageRoute(
                    axisDirection: AxisDirection.left,
                    child: Home(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
