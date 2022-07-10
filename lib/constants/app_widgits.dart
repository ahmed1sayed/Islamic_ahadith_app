import 'package:flutter/material.dart';

import 'colors.dart';

Widget backColor(int flex1,int flex2) =>
    Column(
      children: [
        Expanded(flex: flex1, child: Container(color: AppColors.offWhite,),
        ),
        Expanded(flex: flex2, child: Container(color: Colors.white,))
      ],
    );