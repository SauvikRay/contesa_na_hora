import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBarWidget({Key? key,  this.text,}) : super(key: key);
  final String? text;

  @override
  Widget build(BuildContext context) {
    //final appBarTheme = Theme.of(context).appBarTheme;
    return AppBar(
      title: Text(text!),
          actions: [
               Padding(
              padding: EdgeInsets.only(right: 10.w),
              child: IconButton(
                  onPressed: (){},
                  icon:const Icon(Icons.add_box_rounded,size: 35.0,),
              ),
            ),
          ],
          flexibleSpace:
          ClipPath(
            clipper: MyAppBarClipper(),
            child: Image.asset('assets/images/splashscreen_app.png',fit: BoxFit.cover,)),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(100);
}


class MyAppBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double radius = 20;

    Path path = Path()
      ..lineTo(0, 0)//start point
  
      ..lineTo(size.width,0) // device width(dx),0(dy)
      ..lineTo(size.width, size.height - radius) //deviceWidth, 100
      ..arcToPoint(Offset(size.width - radius, size.height-(radius*2)), //deviceWidth-20,160
                    radius: Radius.circular(radius), clockwise: false)
      ..lineTo(radius, size.height-(radius*2)) //20,100
      ..arcToPoint(Offset(0, size.height-radius),//0,100
            radius: Radius.circular(radius),clockwise: false)
      ..lineTo(0, size.height-radius)
      

  
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
