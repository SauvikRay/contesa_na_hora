import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_color.dart';
import '../constants/text_font_style.dart';
import 'custom_button.dart';

class HomecardWidget extends StatelessWidget {
  const HomecardWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
      color: AppColors.secondaryColor,
      child: Row(
        children: <Widget>[
          Flexible(
            flex: 2,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.r),
                bottomLeft: Radius.circular(15.r),
              ),
              child: Image.network(
                'https://images.unsplash.com/photo-1498084393753-b411b2d26b34?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=400&q=80',
                height: 200.h,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Flexible(
              flex: 4,
              child: SizedBox(
                height: 200.h,
                child: Padding(
                  padding: EdgeInsets.only(left: 15.w, top: 10.h, right: 10.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 65.h,
                        child: Text(
                          'Recebeu uma multa? Conteste na hora!',
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.fade,
                          style: TextFontStyle.card1TitleText,
                        ),
                      ),
                      SizedBox(
                        height: 65.h,
                        child: Text(
                          'Somos a sua equipa de advogados com valências em direito rodoviário.',
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.fade,
                          style: TextFontStyle.card1SubTitleBoldText,
                        ),
                      ),
                      customeButton(
                          name: "Contestar agora",
                          color: AppColors.primaryColor,
                          height:30.h,
                          minWidth: 100.w,
                          textStyle: TextFontStyle.cardButtonText,
                          onCallBack: () {},
                          context: context)
                    ],
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
