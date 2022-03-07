import 'package:contesta_na_hora/constants/app_color.dart';
import 'package:contesta_na_hora/constants/text_font_style.dart';
import 'package:contesta_na_hora/helpers/all_routes.dart';
import 'package:contesta_na_hora/helpers/navigation_service.dart';
import 'package:contesta_na_hora/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const MainAppBarWidget(
          text: 'Home',
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              ListTile(
                leading: Text('home'),
                onTap: () {
                  NavigationService.popAndReplace(Routes.home);
                },
              ),
            ],
          ),
        ),
        body: Card(
          margin: EdgeInsets.symmetric( horizontal: 20.w),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
          color:AppColors.secondaryColor ,
          child: Row(
            children: <Widget>[
              Flexible(
                flex: 3,
                child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.r),
                      bottomLeft: Radius.circular(20.r),
                    ),
                    child: Image.network('https://images.unsplash.com/photo-1498084393753-b411b2d26b34?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=400&q=80',height: 200.h,fit: BoxFit.cover,),
                  ),
              ),
                Flexible(
                  flex: 4,
                  child: SizedBox(
                    height: 200.h,
                    child: Padding(
                      padding: EdgeInsets.only(left: 15.w,top: 10.h,right: 10.w),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 75.h,
                            child: Text('Recebeu uma multa? Conteste na hora!',textAlign: TextAlign.left,overflow: TextOverflow.fade,style: TextFontStyle.card1TitleText,),
                            ),
                          SizedBox(
                            height: 70.h,
                            child: Text('Somos a sua equipa de advogados com valências em direito rodoviário.',textAlign: TextAlign.left,overflow: TextOverflow.fade,style: TextFontStyle.card1SubTitleBoldText,),
                            ),
                            
                        ],
                      ),
                    ),
                  )),
                

              
            ],
          ),
        ),
      ),
    );
  }
}
