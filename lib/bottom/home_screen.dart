import 'dart:convert';
import 'dart:io';


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:mollet/helper/constant.dart';
import 'package:mollet/others/payment_scan_screen.dart';
import 'package:mollet/others/payment_screen.dart';
import 'package:path_provider/path_provider.dart';
import '../all_data_model.dart';
import '../helper/image.dart';
import '../helper/newSessionHelper.dart';
import '../receiver/payment_receiver.dart';
import '../testing/file_storage.dart';

class HomeScreen extends StatefulWidget {

  String amt="";
  String phone="";

  HomeScreen({required this.amt,required this.phone});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  String _scanBarcode = 'Unknown';
  String barcodeScanRes = 'Unknown';
  String splitAmount = '';

  String amount2="";
  Map<String, dynamic> myMap = {};
  String number2="";

  bool _hashdata= false;

  List _items = [];


  Map<String, String> myList = {};

  String barNumber="";
  String barAmount="";
  String newAvailableAmt="";
  String myNumber="";


@override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();


    // writeJsonFile();
    // readJson();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        // padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // SizedBox(
            //   height: 20,
            // ),
            Container(
              decoration: BoxDecoration(
                color: Color(0xFFF2F2F2)
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                child: Column(
                  children: [
                    Center(
                      child: Image.asset(
                        ProjectImage.MLogo,
                        height: 50,
                        width: 110,),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          ProjectImage.user,
                          height: 30,
                          width: 30,
                        ),
                        SizedBox(width: 10,),
                        Text(myNumber=="9191919191"?"James":"Peter",
                            style: GoogleFonts.poppins(
                                color: Color(0xFF303030),
                                fontWeight: FontWeight.w500,
                                fontSize: 21),
                            textAlign: TextAlign.center),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(myNumber,//number2,
                        style: GoogleFonts.poppins(
                            color: Color(0xFF303030),
                            fontWeight: FontWeight.w500,
                            fontSize: 21),
                        textAlign: TextAlign.center),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Balance",
                            style: GoogleFonts.poppins(
                                color:  Color(0xFF303030),
                                fontWeight: FontWeight.w500,
                                fontSize: 21),
                            textAlign: TextAlign.center),
                        Text(
                            // amount2.toString(),
                            newAvailableAmt.toString(),
                            style: GoogleFonts.poppins(
                                color: Color(0xFF303030),
                                fontWeight: FontWeight.w500,
                                fontSize: 21),
                            textAlign: TextAlign.center),
                        // Image.asset(ProjectImage.cash,
                        //   height: 30,width: 30,
                        // )
                      ],
                    ),
                  ],
                ),
              )
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Text("Mobile No",
            //         style: GoogleFonts.poppins(
            //             color: AppColor.secondaryColor,
            //             fontWeight: FontWeight.w500,
            //             fontSize: 21),
            //         textAlign: TextAlign.center),
            //     Image.asset(ProjectImage.mobile,
            //     height: 30,width: 30,
            //     )
            //   ],
            // ),
            // SizedBox(
            //   height: 30,
            // ),
            // Text("810 565 5055",
            //     style: GoogleFonts.poppins(
            //         color: Color(0xFF303030),
            //         fontWeight: FontWeight.w500,
            //         fontSize: 21),
            //     textAlign: TextAlign.center),
            // SizedBox(
            //   height: 30,
            // ),

            // Text("₹ 0.00",
            //     style: GoogleFonts.poppins(
            //         color: Color(0xFF303030),
            //         fontWeight: FontWeight.w500,
            //         fontSize: 21),
            //     textAlign: TextAlign.center),
            // SizedBox(
            //   height: 30,
            // ),
            // Divider(
            //   color: Color(0xFFDBDBDB),
            //   thickness: 1,
            // ),
            SizedBox(
              height: 120,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    InkWell(
                      onTap: (){
                        // writeJsonFile();
                        scanBarcode();
                        // getData();

                        // Helper.moveToScreenwithPush(context, PaymentScanScreen());
                      },
                      child:
                      // Image.asset(ProjectImage.left,
                      //   height: 100,width: 100,
                      // ),
                      Image.asset(ProjectImage.new_get,
                        height: 100,width: 100,
                      ),
                    ),
                    Text("Pay",
                      style: GoogleFonts.poppins(
                          color: AppColor.secondaryColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 21),
                    )
                  ],
                ),
                SizedBox(width: 50,),
                Column(
                  children: [
                    InkWell(
                      onTap: (){
                        Helper.moveToScreenwithPush(context, PaymentReceiver());
                      },
                      child:

                      // Image.asset(ProjectImage.rig,
                      //   height: 100,width: 100,
                      // ),
                      Image.asset(ProjectImage.new_pay,
                        height: 100,width: 100,
                      ),
                    ),
                    Text("Get",
                      style: GoogleFonts.poppins(
                          color: AppColor.secondaryColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 21),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Future<void> scanBarcode() async {
    // setProgress(true);
    String barcodeScanRes;
    bool scanInvalidWaiter=false;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      _scanBarcode = await FlutterBarcodeScanner.scanBarcode('#ff6666',
        'Cancel', true, ScanMode.BARCODE,

      );
      print(_scanBarcode);

    } on PlatformException {
      _scanBarcode = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    // setState(() {
    //
    //   print('barcodeScanRes = $barcodeScanRes');
    //
    //   // getUserDetails(barcodeScanRes);
    // });
    // print('barcodeScanRes------allValue---------- = ${_scanBarcode}');

   var  splitAmount = jsonDecode(_scanBarcode);

    // splitAmount = jsonDecode(_scanBarcode.toString());
    //
    // print("decode---------------------${splitAmount[a'']}");
    //
    // print('splitAmount---------2------- = ${splitAmount.toString()}');


   // var splitAmount= _scanBarcode.split(':');
    // print('barcodeScanRes---------2------- = ${_scanBarcode[0]}');
    // print('splitAmount---------1------- = ${splitAmount[1]}');

    print('splitAmount---------1------- = ${splitAmount["amount"].toString()}');
    print('splitAmount---------1------- = ${splitAmount["number"].toString()}');


    setState(() {
        barAmount=splitAmount["amount"].toString();
        barNumber=splitAmount["number"].toString();
    });
    print("barNumber----------------->${barNumber.toString()}");
    print("barAmount----------------->${barAmount.toString()}");
    print("newAvailableAmt----------------->${newAvailableAmt.toString()}");

    print("is less----------------->${int.parse(barAmount)>int.parse(newAvailableAmt)}");

    if(int.parse(barAmount)>int.parse(newAvailableAmt)){
      print("here1");
      ToastMessage.msg("Not enough balance");
      print("here2");

      print("here3");
    }else{
      Helper.moveToScreenwithPush(context,
          PaymentScreen(amount: barAmount.toString(),
            Number: barNumber.toString(),
          ));
    }


    //exp

    // CollectionReference _collectionRef =
    // FirebaseFirestore.instance.collection('waiter');

    // Get docs from collection reference
    // QuerySnapshot querySnapshot = await _collectionRef.get();

    // Get data from docs and convert map to List
    // querySnapshot.docs.forEach((element)
    // querySnapshot.docs.forEach((element) {
    // for(var element in  querySnapshot.docs) {
    //   //tempMapOfWaiterDertails[element["waiter_id"]]=element["waiter_name"];
    //   print("id waiter firebase===>${element.id.toString()}");
    //   if (element.id != barcodeScanRes) {
    //     print("Invalid id");
    //     scanInvalidWaiter = true;
    //   } else {
    //     print("no problem");
    //     scanInvalidWaiter = false;
    //     break;
    //   }
    // }
    // });

    //exp end
    if(_scanBarcode=="-1"){
      print("here-1");
      ToastMessage.msg("QR scanning failed");
      Helper.popScreen(context);
      // setProgress(false);
    }else if(scanInvalidWaiter==true){
      ToastMessage.msg("Invalid Waiter ID");
      // setProgress(false);
      //  sendRequestById(barcodeScanRes);
    }else{
      // sendRequestToWaiterFirebase(barcodeScanRes);
      //  sendRequestById(barcodeScanRes);
    }
    //  setProgress(false);




  }


   getData() async {



     print("-------------getData-----------");

     SessionHelper session = await SessionHelper.getInstance(context);
     // String number = session.get(SessionHelper.NUMBER) ?? widget.phone;
     // String amount = session.get(SessionHelper.AMOUNT) ?? widget.amt;

     String number =  widget.phone.toString();
     String amount = widget.amt.toString();

     print("--------widget.phone----------${widget.phone.toString()}");
     print("--------widget.amt----------${widget.amt.toString()}");


     print("------session--number----------${session.get(SessionHelper.NUMBER)}");
     print("------session--amount----------${session.get(SessionHelper.AMOUNT)}");


     setState(() {
       amount2 = amount.toString();
       number2 = number.toString();

       print("amount2----var---------${amount2}");
       print("number2------var-------${number2}");

       // FileStorage.writeCounter(
       //     myList.toString(), "geeksforgeeks.json");
       //  myList = {
       //   "name":"user",
       //   "number":number2.toString(),
       //    "availableAmount":amount2.toString()
       // };
     });
//pankaj code
//      SharedPref sharedPref = SharedPref();
//      var data=await sharedPref.read("allDataModel");

    // setState(() {
    //   AllDataModel allDataModel = AllDataModel.fromJson(data);
    // });
   //  print("allDataModel------var-------${data.toString()}");
     String data = await DefaultAssetBundle.of(context).loadString("assets/data.json");
     final jsonResult = jsonDecode(data); //latest Dart
     print("jsonResult===>${jsonResult.toString()}");
     readHere();


   }

  Future readHere() async {
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
       print("here 3===>${valueMap['availableAmount'].toString()}");
       setState(() {
         newAvailableAmt=valueMap['availableAmount'].toString();
         myNumber=valueMap['number'].toString();
       });
      // print("here amt===>${valueMap["availableAmount"]}");
    } catch (e) {
      // If encountering an error, return 0
      return 0;
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

  // Future<void> readJson() async {
  //
  // print("----------------readJson---------------");
  //
  //   final String response = await rootBundle.loadString('assets/mydata.json');
  //   final data = await json.decode(response);
  //
  //   setState(() {
  //     _items = data["items"];
  //   });
  //
  //   print("items-------------->${_items.toString()}");
  // }
  //
  //
  //
  // Future writeJsonFile() async {
  //
  //     print("----------------writeJson---------------");
  //
  //     Map<String, dynamic> myMap = {
  //       "items": [
  //         {
  //           "Name": "Pankaj",
  //           "Number": "8989591439",
  //           "Add":"Indore"
  //         }
  //       ]
  //     };
  //
  //     print("1---------");
  //
  //     final jsonString = json.encode(myMap);
  //
  //     print("2------------");
  //
  //     final file = File('C:/Users/hp/mydata.json');
  //     print("3------------");
  //
  //
  //      file.writeAsString(jsonString);
  //     print("4------------");
  //
  // }



}
