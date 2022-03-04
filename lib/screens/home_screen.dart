import 'package:contesta_na_hora/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar:const  MainAppBarWidget(text: 'Home',),
      body: Center(
        child: ClipPath(
          clipper: MyClipper(),
          child: Image.asset('assets/images/splashscreen_app.png',height: 200,width: 300,fit: BoxFit.cover,),
        ),
      ),
    ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {

 

  @override
  Path getClip(Size size) {

   double radius =20;

    Path path = Path()


    
    
    ..moveTo(radius, 0)
    //..lineTo(size.width-radius, 0)
    ..arcToPoint(Offset(size.width, 0))
    ..lineTo(size.width, size.height-radius)
    ..arcToPoint(Offset(size.width-radius,160), radius: Radius.circular(radius),clockwise: false)
    //..lineTo(radius, size.height)
    //..arcToPoint(Offset(0,size.height-radius),radius: Radius.circular(radius),clockwise: false)
    //..lineTo(0, radius)
    //..arcToPoint(Offset(radius,0),radius: const Radius.elliptical(40,20))
    ..lineTo(0, 160)

    ..close();


    return path;
   
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
  
}
