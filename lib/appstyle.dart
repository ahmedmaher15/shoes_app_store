import 'package:flutter/cupertino.dart';

import 'package:google_fonts/google_fonts.dart';

TextStyle appstyle(double size,Color color,FontWeight fW){
return GoogleFonts.poppins(fontSize: size,color: color,fontWeight: fW);
}
TextStyle appstylewithHt(double size,Color color,double ht,FontWeight fW){
  return GoogleFonts.poppins(fontSize: size,color: color,fontWeight: fW,height: ht);
}