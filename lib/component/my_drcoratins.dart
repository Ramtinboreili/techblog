
import 'package:flutter/cupertino.dart';
import 'package:techblog/component/color_Manager.dart';

class MyDecorations{

 MyDecorations._();

 static BoxDecoration mainGradient =    const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(28)),
                gradient: LinearGradient(
                    colors: GradientColors.bottomNav,
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight));
}