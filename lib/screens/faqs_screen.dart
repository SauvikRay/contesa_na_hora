import 'dart:math';

import 'package:contesta_na_hora/constants/app_color.dart';
import 'package:contesta_na_hora/constants/text_font_style.dart';
import 'package:contesta_na_hora/helpers/ui_helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../widgets/app_bar_widget.dart';

class FaqsScreen extends StatefulWidget {
  const FaqsScreen({Key? key}) : super(key: key);

  @override
  State<FaqsScreen> createState() => _FaqsScreenState();
}

class _FaqsScreenState extends State<FaqsScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _opacityAnimation;

  bool expandedTile = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 300,
      ),
    );
    _slideAnimation = Tween<Offset>(
      begin: Offset(0, -1.5),
      end: Offset(0, 0),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.fastOutSlowIn,
      ),
    );
    _opacityAnimation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const MainAppBarWidget(
          text: 'FAQs',
        ),
        drawer: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(60.r),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 30.w, top: 30.h),
                    child: IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Icon(
                          CupertinoIcons.clear_circled,
                          color: AppColors.primaryColor,
                          size: 40.sp,
                        )),
                  ),
                ],
              ),
              Row(
                children: [
                  Image.asset(
                    'assets/images/rose_rosa.png',
                    color: AppColors.drawerLogoColor,
                    scale: 4,
                  ),
                ],
              ),
              InkWell(
                onTap: () {},
                child: ListTile(
                  leading: SvgPicture.asset(
                    'assets/icons/home.svg',
                    height: 25.sp,
                    width: 25.sp,
                    color: AppColors.appDrawerTextColor,
                  ),
                  title: Text(
                    'Home',
                    style: TextFontStyle.drawerTitle,
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: ListTile(
                  leading: SvgPicture.asset(
                    'assets/icons/home.svg',
                    height: 25.sp,
                    width: 25.sp,
                    color: AppColors.appDrawerTextColor,
                  ),
                  title: Text(
                    'Home',
                    style: TextFontStyle.drawerTitle,
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: ListTile(
                  leading: SvgPicture.asset(
                    'assets/icons/home.svg',
                    height: 25.sp,
                    width: 25.sp,
                    color: AppColors.appDrawerTextColor,
                  ),
                  title: Text(
                    'Home',
                    style: TextFontStyle.drawerTitle,
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: ListTile(
                  leading: SvgPicture.asset(
                    'assets/icons/home.svg',
                    height: 25.sp,
                    width: 25.sp,
                    color: AppColors.appDrawerTextColor,
                  ),
                  title: Text(
                    'Home',
                    style: TextFontStyle.drawerTitle,
                  ),
                ),
              ),
              const Spacer(),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'As nossas Redes Sociais',
                        style: TextFontStyle.drawerBottomText1,
                      ),
                      UIHelper.verticalSpaceMedium,
                      Row(
                        children: <Widget>[
                          Image.asset('assets/images/facebook.png'),
                          UIHelper.horizontalSpaceSmall,
                          Image.asset('assets/images/instgram.png'),
                        ],
                      ),
                    ],
                  ),
                  const Spacer(),
                  UIHelper.horizontalSpaceMedium,
                  Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8.w, vertical: 8.h),
                            height: 48.w,
                            width: 48.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.r),
                                color: AppColors.primaryColor),
                            child: Image.asset('assets/images/r_logo.png'),
                          ),
                          UIHelper.horizontalSpaceSmall,
                          Text(
                            'CONTESTA\nNA HORA',
                            style: TextFontStyle.horaText,
                          )
                        ],
                      ),
                    ],
                  ),
                  UIHelper.horizontalSpaceMedium
                ],
              ),
              UIHelper.verticalSpaceLarge,
            ],
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            children: <Widget>[
              Card(
                color: expandedTile
                    ? AppColors.secondaryColor
                    : AppColors.expandedList,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      if (expandedTile) {
                        _controller.forward();
                      } else {
                        _controller.reverse();
                      }
                      expandedTile = !expandedTile;
                    });
                  },
                  child: ListTile(
                    title: Text(
                      'O que é uma contraordenação rodoviária?',
                      style: expandedTile
                          ? TextFontStyle.expandedTitleTrue
                          : TextFontStyle.expandedTitleFalse,
                    ),
                    trailing: (expandedTile)
                        ? const Icon(
                            Icons.expand_more_rounded,
                            color: AppColors.expandedTilebgColor,
                          )
                        : const Icon(
                            Icons.expand_less_rounded,
                            color: AppColors.appDrawerTextColor,
                            size: 25,
                          ),
                  ),
                ),
              ),
              AnimatedContainer(
                curve: Curves.easeInOut,
                duration: const Duration(milliseconds: 300),
                width: double.infinity,
                height: expandedTile ? 500 : 0,
                child: Text(
                    'Segundo   o   artigo   131.º   do   CE   (Código   da   Estrada),   constitui contraordenação rodoviária todo o facto ilícito e censurável que preencha um tipo legal correspondente à violação de norma do CE ou em legislação complementar  e  especial,  cuja  aplicação  esteja  cometida  à  ANSR (Autoridade Nacional de Segurança Rodoviária), e para a qual, se comine uma coima.'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
