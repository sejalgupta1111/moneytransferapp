import 'dart:convert';
import 'dart:io';

import 'package:external_path/external_path.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mollet/others/payment_receipt_screen.dart';
import 'package:mollet/others/payment_scan_screen.dart';
import 'package:mollet/others/payment_scan_screen_two.dart';
import 'package:mollet/others/payment_screen.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../bottom/bottom_screen.dart';
import '../helper/constant.dart';
import '../helper/image.dart';



class PaymentConfirmScreen extends StatefulWidget {

  String amt="";
  String det="";

  PaymentConfirmScreen({required this.amt,required this.det});


  @override
  State<PaymentConfirmScreen> createState() => _PaymentConfirmScreenState();
}

class _PaymentConfirmScreenState extends State<PaymentConfirmScreen> {



  String Paynumber="";
  String Getnumber="";
  String amount="";
  String myPhone="";



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  // getUserData();
    myData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Image.asset(
                    ProjectImage.MLogo,
                    height: 120,
                    width: 120,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Paying",
                          style: GoogleFonts.poppins(
                              color: Color(0xFF303030),
                              fontWeight: FontWeight.w500,
                              fontSize: 21),
                          textAlign: TextAlign.center),
                      SizedBox(width: 20,),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              color: AppColor.secondaryColor,
                              width: 1
                            )
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 7,vertical: 7),
                          child: Text(widget.amt,
                              style: GoogleFonts.poppins(
                                  color: AppColor.secondaryColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 21),textAlign: TextAlign.center),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Text("(OFFER RECEIVER To SCAN)",
                      style: GoogleFonts.poppins(
                          color: AppColor.secondaryColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 21),textAlign: TextAlign.center),
                  Text("Debit QRC",
                      style: GoogleFonts.poppins(
                          color: AppColor.secondaryColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 21),textAlign: TextAlign.center),
                  SizedBox(height: 25,),
                  // Image.asset(
                  //   ProjectImage.barCode,
                  //   height: 210,
                  //   fit: BoxFit.fitHeight,
                  //   width: MediaQuery.of(context).size.width,
                  // ),
                  QrImage(
                      // data: '''{
                      // "amount":${widget.amt.toString()},
                      // }''', // Concatenate the amount with a prefix or any necessary formatting
                    data: '''{
                      "amount":${widget.amt.toString()},
                                     
                      "number":${myPhone.toString()}                
                      }''',
                    version: QrVersions.auto,
                    size: 200.0,
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: (){
                          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                              BottomScreen(amt: "",phone: "",)), (Route<dynamic> route) => false);
                        },
                        child: Image.asset(ProjectImage.cross,
                          height: 70,width: 70,
                        ),
                      ),
                      SizedBox(width: 40,),
                      InkWell(
                        onTap: (){
                          Helper.moveToScreenwithPush(context, PaymentReceiptScreen(
                                amount: widget.amt,
                              ));
                          // Helper.moveToScreenwithPushreplaceemt(context, PaymentScanScreenTwo());
                        },
                        child: Image.asset(ProjectImage.right,
                          height: 70,width: 70,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 60,
                  ),

                ],
              ),
            ),
          ),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 65,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                    color: AppColor.secondaryColor),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: (){
                        Helper.popScreen(context);
                      },
                      child: Container(
                        width: 100,
                        child: const Icon(Icons.arrow_back,
                        color: Colors.white,size: 40,),
                      ),
                    ),
                    Container(
                      height: 60,width: 0,
                      child: VerticalDivider(
                        color:Colors.white,
                        width: 2,
                        thickness: 2,
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                            BottomScreen(amt: "",phone: "",)), (Route<dynamic> route) => false);
                      },
                      child: Container(
                        width: 120,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(ProjectImage.home,
                              height: 30,width: 30,
                            ),
                            SizedBox(width: 10,),
                            InkWell(
                              onTap: (){

                                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                                    BottomScreen(
                                      amt: "1000",
                                      phone:myPhone.toString(),
                                    )),
                                        (Route<dynamic> route) => false);

                              },
                              child: Text("Home",
                                  style: GoogleFonts.poppins(
                                      color:Colors.white,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 21),
                                  textAlign: TextAlign.center),
                            ),
                          ],
                        ),
                      ),
                    ),

                  ],
                ),
              ))
        ],
      ),
    );
  }


  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }
  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/new_data.json');
  }

  myData() async {
    try {
      final file = await _localFile;

      // Read the file
      final contents = await file.readAsString();

      print("contents====>${contents.toString()}");
      print("here 1");
      // var encodedString = jsonEncode(contents);
      // // print("here 2==>${encodedString.toString()}");
      // //
      Map<String, dynamic> valueMap = jsonDecode(contents);
      // AllDataModel.fromJson(encodedString);
      //
      print("here 3===>${valueMap['password'].toString()}");
      setState(() {

        myPhone=valueMap['number'].toString();


      });
      // print("here amt===>${valueMap["availableAmount"]}");
    } catch (e) {
      // If encountering an error, return 0
      return 0;
    }
}

//   getUserData() async {
//
//   print("----------getUserData-----------------");
//
//
//
//   SessionHelper session = await SessionHelper.getInstance(context);
//   String num = session.get(SessionHelper.NUMBER).toString();
//
//
//   String path = (await ExternalPath.getExternalStoragePublicDirectory(
//       ExternalPath.DIRECTORY_DOWNLOADS));
//   print(path);
//   File file = await File('${path}/mollet.json');
//   print("-----------file-----------${file.toString()}");
//   // getExternalStoragePublicDirectory(ExternalPath.DIRECTORY_DOWNLOADS);
//   String contents = await file.readAsString();
//   print(contents.toString());
//
//   var ap = jsonDecode(contents);
//
//   // print("id------------------${ap['transaction'].toList()}");
//
//   // ap.map((entry) => (entry['transaction'])).toList();
//   var amit =ap.length.toString();
//
//   setState(() {
//     Getnumber = ap['transaction']['${widget.det}']['number'].toString();
//     Paynumber=num.toString();
//     amount=widget.amt;
//
//
//     print("pay----------${Paynumber.toString()}");
//     print("Getnumber----------${Getnumber.toString()}");
//     print("amount----------${amount.toString()}");
//   });
//
//
//
//
//
//
//
//
// }


}
