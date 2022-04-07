import 'package:contesta_na_hora/constants/text_font_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_color.dart';

class PopupWidget extends StatefulWidget {
  TextEditingController multa;
  PopupWidget({required this.multa, Key? key}) : super(key: key);

  @override
  State<PopupWidget> createState() => _PopupWidgetState();
}

class _PopupWidgetState extends State<PopupWidget> {
  String _value = "Selecionar tipo de multa";

  // List<String> list = [
  //   'Álcool',
  //   'Condução sem carta / Habilitação Legal',
  //   'Excesso de Velocidade',
  //   'Telemóvel',
  //   'Falta de inspeção',
  //   'Alteração Características do Veículo',
  //   'Outras',
  // ];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.w, horizontal: 10.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: AppColors.expandedList),
      height: 46.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            _value,
          ),
          PopupMenuButton<String>(
            icon: const Icon(
              Icons.keyboard_arrow_down_rounded,
              color: AppColors.secondaryColor,
            ),
            iconSize: 25.r,
            onSelected: (String value) {
              setState(() {
                _value = value;
                widget.multa.text = value;
              });
            },
            color: AppColors.secondaryColor,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            offset: const Offset(0, kToolbarHeight - 12),
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Text(
                  'Álcool',
                  style: TextFontStyle.popUpselectedText,
                ),
                value: 'Álcool',
              ),
              const PopupMenuDivider(),
              PopupMenuItem(
                child: Text(
                  'Condução sem carta / Habilitação Legal',
                  style: TextFontStyle.popUpselectedText,
                ),
                value: 'Condução sem carta / Habilitação Legal',
              ),
              const PopupMenuDivider(),
              PopupMenuItem(
                child: Text(
                  'Excesso de Velocidade',
                  style: TextFontStyle.popUpselectedText,
                ),
                value: 'Excesso de Velocidade',
              ),
              const PopupMenuDivider(),
              PopupMenuItem(
                child: Text(
                  'Nenhum serviço adicional',
                  style: TextFontStyle.popUpselectedText,
                ),
                value: "Nenhum serviço adicional ",
              ),
              const PopupMenuDivider(),
              PopupMenuItem(
                child: Text(
                  'Nenhum serviço adicional',
                  style: TextFontStyle.popUpselectedText,
                ),
                value: "Nenhum serviço adicional ",
              ),
              const PopupMenuDivider(),
              PopupMenuItem(
                child: Text(
                  'Nenhum serviço adicional',
                  style: TextFontStyle.popUpselectedText,
                ),
                value: "Nenhum serviço adicional ",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
