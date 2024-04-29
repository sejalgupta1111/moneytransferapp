import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';

import '../bottom/bottom_screen.dart';
import '../helper/constant.dart';
import '../helper/image.dart';
import 'log_in_screen.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    super.initState();
    loadData();
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(
            ProjectImage.splash,
          ))
        ),
        child:  Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 150,),
              Text("MOLLET APP",
        style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w400,
                color: Color(0xFF303030),
              )),),
            ],
          ),
        ),
        // Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     // Container(
        //     //   child: Image.asset(ProjectImage.splash,
        //     //     height: 180,
        //     //   ),
        //     // ),
        //     // const SizedBox(height: 10,),
        //     // Text("MOLLET APP",
        //     //   style: GoogleFonts.poppins(
        //     //     textStyle: const TextStyle(
        //     //       fontSize: 22,
        //     //       fontWeight: FontWeight.w400,
        //     //       color: Color(0xFF303030),
        //     //     )),),
        //   ],
        // ),
      ),
    );
  }



  Future<Timer> loadData() async {
    return Timer(const Duration(seconds: 5), onDoneLoading);
  }

  onDoneLoading() async {
   // Helper.moveToScreenwithPushreplaceemt(context,  LogInScreen());
    try {
      final file = await _localFile;

      // Read the file
      final contents = await file.readAsString();

      print("contents====>${contents.toString()}");
      print("here 1");

      Map<String, dynamic> valueMap = jsonDecode(contents);
      // AllDataModel.fromJson(encodedString);
      //
      print("here 3===>${valueMap['number'].toString()}");

      setState(() {
       // newSavedPass=valueMap['password'].toString();
        Helper.moveToScreenwithPushreplaceemt(context,  BottomScreen(amt: "1000",phone: valueMap['number'].toString(),));
        print("dekho 2");
      });

      // print("here amt===>${valueMap["availableAmount"]}");
    } catch (e) {
      // If encountering an error, return 0
      Helper.moveToScreenwithPushreplaceemt(context,  LogInScreen());
    //  return 0;
    }

  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }
  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/new_data.json');
  }

}
