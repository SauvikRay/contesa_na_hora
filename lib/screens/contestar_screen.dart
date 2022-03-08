import 'package:contesta_na_hora/constants/app_color.dart';
import 'package:contesta_na_hora/constants/text_font_style.dart';
import 'package:contesta_na_hora/helpers/ui_helpers.dart';
import 'package:contesta_na_hora/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/app_bar_widget.dart';
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

  bool _groupValue = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const MainAppBarWidget(
          text: 'Contestar/Submeter Multa',
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              ListTile(
                leading: const Text('home'),
                onTap: () {},
              ),
            ],
          ),
        ),
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
                    UIHelper.horizontalSpaceSmall,
                    Row(
                      children: [
                        Radio(
                          activeColor: AppColors.primaryColor,
                          value: 1,
                          groupValue: _groupValue,
                          onChanged: (value) {},
                        ),
                        RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: 'Concordo com a ',
                                style: TextStyle(color: Colors.black),
                              ),
                              TextSpan(
                                text: 'política de privacidade',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    customeButton(
                      name: "Submeter Multa",
                      onCallBack: () {},
                      context: context,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
