import 'package:contesta_na_hora/constants/app_color.dart';
import 'package:contesta_na_hora/constants/text_font_style.dart';
import 'package:contesta_na_hora/helpers/ui_helpers.dart';
import 'package:contesta_na_hora/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../controller/contasa.dart';
import '../helpers/contasa_helper.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/app_drawer.dart';
import '../widgets/custome_textfield.dart';
import '../widgets/popup_item_widget.dart';

class ContestarScreen extends StatefulWidget {
  const ContestarScreen({Key? key}) : super(key: key);

  @override
  State<ContestarScreen> createState() => _ContestarScreenState();
}

class _ContestarScreenState extends State<ContestarScreen> {
  final TextEditingController _nameTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _phoneNumberTextController =
      TextEditingController();
  final TextEditingController _messageTextController = TextEditingController();
  final TextEditingController _uploadTextController = TextEditingController();

  bool _value = false;

  @override
  void initState() {
    super.initState();
    appBarName(name: "Contestar/Submeter Multa", context: context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Tipo de Multa',
                style: TextFontStyle.contestarBodyText,
              ),
              UIHelper.verticalSpaceSmall,
              const PopupWidget(),
              UIHelper.verticalSpaceSmall,
              Text(
                'Preencha os dados',
                style: TextFontStyle.contestarBodyText,
              ),
              Form(
                child: Column(
                  children: [
                    UIHelper.verticalSpaceMedium,
                    CustomNumberFormField(
                      hintText: "ex:Sauvik Ray",
                      labelText: "Name",
                      textEditingController: _nameTextController,
                      inputType: TextInputType.name,
                    ),
                    UIHelper.verticalSpaceSmall,
                    CustomNumberFormField(
                      hintText: "ex:test01@test.com",
                      labelText: "E-mail",
                      textEditingController: _emailTextController,
                      inputType: TextInputType.emailAddress,
                    ),
                    UIHelper.verticalSpaceSmall,
                    CustomNumberFormField(
                      hintText: "ex:011-88XXXXXXX",
                      labelText: "Contacto Telefónico",
                      textEditingController: _phoneNumberTextController,
                      inputType: TextInputType.number,
                    ),
                    UIHelper.verticalSpaceSmall,
                    CustomNumberFormField(
                      hintText: "ex:Sauvik Ray is a good boy",
                      labelText: "Mensagem",
                      textEditingController: _messageTextController,
                      inputType: TextInputType.text,
                      fieldHeight: 80.h,
                      maxline: 3,
                    ),
                    UIHelper.verticalSpaceSmall,
                    CustomNumberFormField(
                      hintText: "ex:file size should not exit 100 k",
                      labelText: "Upload de Doumentos",
                      textEditingController: _nameTextController,
                      inputType: TextInputType.name,
                    ),
                    UIHelper.verticalSpaceMedium,
                    Row(
                      children: [
                        customCheckBox(),
                        UIHelper.horizontalSpaceSmall,
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Concordo com a ',
                                style: TextFontStyle.termsCondition,
                              ),
                              TextSpan(
                                text: 'política de privacidade',
                                style: TextFontStyle.termsConditionBold,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    UIHelper.verticalSpaceMedium,
                    customeButton(
                      name: "Submeter Multa",
                      height: 50.h,
                      color: AppColors.secondaryColor,
                      borderRadius: 20.r,
                      minWidth: double.infinity,
                      textStyle: TextFontStyle.submitButtonText,
                      onCallBack: () {},
                      context: context,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  InkWell customCheckBox() {
    return InkWell(
      onTap: () {
        setState(() {
          _value = !_value;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
        height: 20.h,
        width: 20.h,
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: AppColors.linkColor),
          borderRadius: BorderRadius.circular(4.r),
        ),
        child: (_value == true)
            ? Container(
                height: 11.h,
                width: 11.h,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(4.r),
                ),
              )
            : Container(),
      ),
    );
  }
}
