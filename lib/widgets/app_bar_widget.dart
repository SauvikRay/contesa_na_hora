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
          Container(
            decoration: BoxDecoration(
              //color: Colors.green,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20.r),bottomRight:Radius.circular(20.r) )
            ),
           child: Image.asset('assets/images/splashscreen_app.png',fit: BoxFit.cover,),
          ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(60);
}
