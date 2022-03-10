import 'package:contesta_na_hora/constants/text_font_style.dart';
import 'package:contesta_na_hora/helpers/ui_helpers.dart';
import 'package:contesta_na_hora/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants/app_color.dart';
import '../widgets/homecard_widget.dart';

class ContestarSubmitScreen extends StatelessWidget {
  const ContestarSubmitScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/icons/thankyou.svg',
              ),
              UIHelper.verticalSpaceMedium,
              Text(
                'Obrigado',
                style: TextFontStyle.head1,
              ),
              UIHelper.verticalSpaceSmall,
              Text(
                'por submeter o nosso formulário',
                style: TextFontStyle.headsub2,
              ),
              UIHelper.verticalSpaceMedium,
              HomecardWidget(),
              UIHelper.verticalSpaceSmall,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Links Úteis',
                    textAlign: TextAlign.left,
                    style: TextFontStyle.publicationText,
                  ),
                ],
              ),
              UIHelper.verticalSpaceSmall,
              ListView.separated(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              child: Text(
                            'www.joserochadvogados.pt',
                            style: TextFontStyle.links,
                          )),
                          Text(
                            'IR PARA O SITE',
                            style: TextStyle(
                                fontSize: 8.sp,
                                letterSpacing: 1,
                                color: AppColors.primaryColor),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.link,
                              color: AppColors.primaryColor,
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                  separatorBuilder: (context, index) => const Divider(
                        color: AppColors.deviderColor,
                      ),
                  itemCount: 3)
            ],
          ),
        ),
      ),
    );
  }
}
