import 'package:contesta_na_hora/constants/app_color.dart';
import 'package:contesta_na_hora/constants/text_font_style.dart';
import 'package:contesta_na_hora/helpers/ui_helpers.dart';
import 'package:contesta_na_hora/networks/api_acess.dart';
import 'package:contesta_na_hora/widgets/loading_indicators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants/app_consotants.dart';
import '../helpers/appbarname_helper.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  void initState() {
    super.initState();
    appBarName(name: "Contactos", context: context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
            child: StreamBuilder(
              stream: getProfileRXobj.getProfileData,
              builder: (context, AsyncSnapshot profiledata) {
                if (profiledata.hasData) {
                  Map data = profiledata.data;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                              child: Text(
                            data['phone'] ?? '',
                            style: TextFontStyle.number,
                          )),
                          InkWell(
                            onTap: () {},
                            child: SvgPicture.asset(AssetIcons.whatsapp),
                          ),
                          UIHelper.horizontalSpaceSmall,
                          InkWell(
                            onTap: () {},
                            child: SvgPicture.asset(AssetIcons.call),
                          ),
                        ],
                      ),
                      UIHelper.verticalSpaceMedium,
                      UIHelper.customDivider(),
                      UIHelper.verticalSpaceMedium,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            data['email'] ?? '',
                            style: TextFontStyle.number,
                          ),
                          const Spacer(),
                          InkWell(
                            onTap: () {
                              launch(data['email']);
                            },
                            child: SvgPicture.asset('assets/icons/mail.svg'),
                          ),
                        ],
                      ),
                      UIHelper.customDivider(),
                      UIHelper.verticalSpaceMedium,
                      Text(
                        data['office_one_city'] ?? '',
                        style: TextFontStyle.headsub1,
                      ),
                      UIHelper.verticalSpaceMedium,
                      Text(
                        data['office_one_address'] ?? '',
                        style: TextFontStyle.sub2.copyWith(
                            color: AppColors.publicationTextColor,
                            fontWeight: FontWeight.normal),
                      ),
                      UIHelper.verticalSpaceMedium,
                      SizedBox(
                        height: 200.h,
                        width: double.infinity,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.r),
                          child: Image.network(
                              'https://media.wired.com/photos/59269cd37034dc5f91bec0f1/191:100/w_1280,c_limit/GoogleMapTA.jpg'),
                        ),
                      ),
                      UIHelper.verticalSpaceSmall,
                      UIHelper.customDivider(),
                      UIHelper.verticalSpaceSmall,
                      Text(
                        data['office_two_city'] ?? '',
                        style: TextFontStyle.headsub1,
                      ),
                      UIHelper.verticalSpaceSmall,
                      Text(
                        data['office_two_address'] ?? '',
                        style: TextFontStyle.sub2.copyWith(
                            color: AppColors.publicationTextColor,
                            fontWeight: FontWeight.normal),
                      ),
                      UIHelper.verticalSpaceSmall,
                      SizedBox(
                        height: 200.h,
                        width: double.infinity,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.r),
                          child: Image.network(
                              'https://media.wired.com/photos/59269cd37034dc5f91bec0f1/191:100/w_1280,c_limit/GoogleMapTA.jpg'),
                        ),
                      ),
                      UIHelper.verticalSpaceSmall,
                      UIHelper.customDivider(),
                      UIHelper.verticalSpaceSmall,
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 15.w,
                        ),
                        height: 50.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          color: AppColors.primaryColor,
                        ),
                        child: Row(
                          children: [
                            const Text(
                              'As nossas Redes Sociais',
                              style: TextFontStyle.socialLink,
                            ),
                            const Spacer(),
                            InkWell(
                              onTap: () {},
                              child: Image.asset(
                                AssetIcons.facebook,
                                color: Colors.white,
                              ),
                            ),
                            UIHelper.horizontalSpaceSmall,
                            InkWell(
                              onTap: () {},
                              child: SvgPicture.asset(
                                AssetIcons.instgramPrimary,
                              ),
                            ),
                          ],
                        ),
                      ),
                      UIHelper.verticalSpaceLarge,
                      UIHelper.verticalSpaceSmall,
                    ],
                  );
                } else if (profiledata.hasError) {
                  return const SizedBox.shrink();
                }
                return SizedBox(
                  height: MediaQuery.of(context).size.height - 100,
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: loadingIndicatorCircle(context: context),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
