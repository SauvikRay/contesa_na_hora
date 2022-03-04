import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_color.dart';

class TextFontStyle{

//Initialising Constractor
  TextFontStyle._();

     //Bold Text1 
     static final head1 = TextStyle(fontSize:24.sp,fontWeight: FontWeight.bold,color:AppColors.secondaryColor);
     //HeadSub Text
     static final headsub1= TextStyle(fontSize:24.sp,fontWeight: FontWeight.w600,color:AppColors.primaryColor);
     static final headsub2= TextStyle(fontSize:18.sp,fontWeight: FontWeight.bold,color:AppColors.primaryColor);
     //Home Screen Text
     //Card1 Style
     static final card1TitleText = TextStyle(fontSize:18.sp,fontWeight: FontWeight.bold,color:Colors.white);
     static final card1SubTitleBoldText = TextStyle(fontSize:13.sp,fontWeight: FontWeight.bold,color:Colors.white);
     static final cardButtonText = TextStyle(fontSize:12.sp,fontWeight: FontWeight.bold,color:Colors.white);
      //Card2 Style
     static final card2Title1Text = TextStyle(fontSize:18.sp,fontWeight: FontWeight.bold,color:AppColors.secondaryColor);
     static final card2Title2Text = TextStyle(fontSize:17.sp,fontWeight: FontWeight.bold,color:Colors.white);
     
     // Publicações 
      static final publicationText = TextStyle(fontSize:14.sp,fontWeight: FontWeight.bold,letterSpacing: 0.8,color:Colors.white);
      static final publicationListText = TextStyle(fontSize:14.sp,fontWeight: FontWeight.normal,letterSpacing: 0.8,color:Colors.white);
      static final verTudoText = TextStyle(fontSize:12.sp,fontWeight: FontWeight.normal,letterSpacing: 0.8,color:Colors.white);
      static final publicationDateText = TextStyle(fontSize: 12.sp, letterSpacing: 0.8, color: AppColors.dateColor);
      static final publicationHeadText = TextStyle(fontSize: 24.sp, letterSpacing: 0.8, color: AppColors.publicationTextColor);
      static final publicationDetailText = TextStyle(fontSize: 12.sp, letterSpacing: 0.8, color: AppColors.publicationTextColor);

      //Contestar/Submeter Multa Screen
      static final bodyText = TextStyle( fontSize: 14.sp,color: Colors.black,letterSpacing: 1);
      
      //popupMenu
      static final selectionText = TextStyle( fontSize: 14.sp,color: Colors.black,letterSpacing: 1);
      static final popUpselectedText = TextStyle( fontSize: 14.sp,color: Colors.white,letterSpacing: 1);
      static final submitButtonText = TextStyle( fontSize: 14.sp,color: Colors.white,fontWeight: FontWeight.bold,letterSpacing: 1);

      //usefull Link
      static final usefulLink= TextStyle(fontSize: 14.sp,color: AppColors.secondaryColor,letterSpacing: 0.8,fontWeight: FontWeight.normal);
      static final links= TextStyle(fontSize: 12.sp,color: AppColors.linkColor,letterSpacing: 0.8,);
      static final site= TextStyle(fontSize: 8.sp,color: AppColors.primaryColor,letterSpacing: 0.8,);

//Bottom NAvigation Text
  static final sub1 = TextStyle( fontSize: 12.sp, fontWeight: FontWeight.normal,color: AppColors.linkColor);
  static final sub2 = TextStyle( fontSize: 12.sp, fontWeight: FontWeight.bold,color: AppColors.primaryColor);



}