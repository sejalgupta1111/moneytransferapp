import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:mollet/receiver/payment_account_receiver.dart';
import 'package:mollet/receiver/payment_request_two.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../bottom/bottom_screen.dart';
import '../helper/constant.dart';
import '../helper/image.dart';
import 'new_before_statement.dart';




class PaymentRequest extends StatefulWidget {

   String amount="";
   // String totalPrice = "";

  PaymentRequest({required this.amount,
    // required this.totalPrice
  });

  @override
  State<PaymentRequest> createState() => _PaymentRequestState();
}

class _PaymentRequestState extends State<PaymentRequest> {


int paymentTotal = 0;
String num="";
String newPhone="";
  Map<String, dynamic> myMap = {};
String _scanBarcode = 'Unknown';
String barNumber="";
String barAmount="";

//new
  String newSavedPass="";
  String newName="";


  String newAvailableAmount="";
  String newTransactionPan="";
  Map<String, String> myList = {};

  //12 june
  List listOfTransPan=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  // print("amourb==================${widget.amount}");
    totalPayment();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
                        Text("Payment Request",
                            style: GoogleFonts.poppins(
                                color: Color(0xFF303030),
                                fontWeight: FontWeight.w500,
                                fontSize: 21),
                            textAlign: TextAlign.center),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                            color: AppColor.secondaryColor,
                            width: 1
                        )
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6,vertical: 6),
                      child: Text(widget.amount,
                          style: GoogleFonts.poppins(
                              color: AppColor.secondaryColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 21),textAlign: TextAlign.center),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text("Request QRC",
                      style: GoogleFonts.poppins(
                          color: AppColor.secondaryColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 21),textAlign: TextAlign.center),
                  SizedBox(height: 25,),
                  InkWell(
                    onTap: (){
                      //ye nahi hai
                      // Helper.moveToScreenwithPush(context, PaymentRequestTwo());

                      //ye hai
                      // Helper.moveToScreenwithPush(context, PaymentAccountReceiver(
                      //   // totalPrice: widget.totalPrice,
                      //     amount: widget.amount,
                      // ));
                      // print("widget.amount---------->${widget.amount}");
                    },
                    child: QrImage(
                      data: '''{
                      "amount":${widget.amount.toString()},
                                     
                      "number":${newPhone.toString()}                
                      }''', // Concatenate the amount with a prefix or any necessary formatting
                      version: QrVersions.auto,
                      size: 200.0,
                    ),
                  ),
                  SizedBox(height: 20,),
                  Text("Scan QR Code on Payer Device",
                      style: GoogleFonts.poppins(
                          color: AppColor.secondaryColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 19),
                      textAlign: TextAlign.center),
                  SizedBox(height: 15,),
                  InkWell(
                    onTap: (){
                      scanBarcodeReciever();
                    },
                    child: Image.asset(ProjectImage.LogoB,
                    height: 60,width: 60,
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     InkWell(
                  //       onTap: (){
                  //         Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                  //             BottomScreen()), (Route<dynamic> route) => false);
                  //       },
                  //       child: Image.asset(ProjectImage.cross,
                  //         height: 70,width: 70,
                  //       ),
                  //     ),
                  //     SizedBox(width: 40,),
                  //     InkWell(
                  //       onTap: (){
                  //
                  //         // Helper.moveToScreenwithPushreplaceemt(context, PaymentScanScreenTwo());
                  //       },
                  //       child: Image.asset(ProjectImage.right,
                  //         height: 70,width: 70,
                  //       ),
                  //     )
                  //   ],
                  // )

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
                                      phone: newPhone,
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


   totalPayment() async {
     readHere();

    print("--------------------totalPayment---------------");

    //  var box = await Hive.openBox("transaction");
    //
    //  paymentTotal = int.parse(widget.totalPrice);
    //
    //  box.putAt(0, paymentTotal);
    //
    // print("pay--------------------${paymentTotal.toString()}");

    SessionHelper sessionHelper = await SessionHelper.getInstance(context);
    //
    // myMap{(
    //   "name":"Amit",
    //   "contat":64546
    // )};
   setState(() {
     myMap ['amount'] = widget.amount.toString();
      num = sessionHelper.get(SessionHelper.NUMBER).toString();
   });
     print("number in-sh---------------------${num.toString()}");

  }
Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();

  return directory.path;
}
Future<File> get _localFile async {
  final path = await _localPath;
  return File('$path/new_data.json');
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
    print("here number 3===>${valueMap['number'].toString()}");
    setState(() {
      newPhone=valueMap['number'].toString();
      newSavedPass=valueMap['password'].toString();
      newName=valueMap['name'].toString();


      newAvailableAmount=valueMap['availableAmount'].toString();
      // newTransactionPan=valueMap['transaction'].toString();
      listOfTransPan=jsonDecode(valueMap['transaction']);
    });
    // print("here amt===>${valueMap["availableAmount"]}");
  } catch (e) {
    // If encountering an error, return 0
    return 0;
  }
}

Future<void> scanBarcodeReciever() async {
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
  newUpdateJsonFile();
  // Helper.moveToScreenwithPush(context, PaymentAccountReceiver(
  //   // // totalPrice: widget.totalPrice,
  //   //   amount: widget.amount,
  //   amount: barAmount,
  //   frontUserPayerNumber: barNumber,
  // ));

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

  newUpdateJsonFile() async{
    String remainingAmount=(int.parse(newAvailableAmount)+int.parse(barAmount)).toString();
    print("remainingAmount===>${remainingAmount.toString()}");
    // print("transaction===>${transaction.toString()}");
    // print("transaction===>${widget.frontUserPhone.toString()}");
    var formatter = new DateFormat('yyyy-MM-dd, HH:mm:ss');
    var now = new DateTime.now();
    String formattedDateToday = formatter.format(now);
    print("formattedDateToday===>${formattedDateToday.toString()}");
//old code
    // var newTransaction={
    //   "frontUserNumber":barNumber.toString(),
    //   "amountPaid":barAmount.toString(),
    //   "currentTimeStamp":formattedDateToday.toString(),
    //
    // };
    // var newJsonTrans= jsonEncode(newTransaction);
    // myList = {
    //   "name": newName,
    //   "number": newPhone,
    //   "password": newSavedPass,
    //   "availableAmount":remainingAmount,
    //   "transaction": newJsonTrans.toString(),
    // };
    //
    // print("myList------------->${myList.toString()}");

    //new code
    List listOfTransaction=[];
    if(listOfTransPan.isEmpty){
      listOfTransaction=[{
        "frontUserNumber":barNumber.toString(),
        "amountPaid":barAmount.toString(),
        "currentTimeStamp":formattedDateToday.toString(),
        "whoIsThis":"2",
      }];
      print("list is empty");
    }else{

      List tempList=listOfTransPan;
      tempList.add(
          {
            "frontUserNumber":barNumber.toString(),
            "amountPaid":barAmount.toString(),
            "currentTimeStamp":formattedDateToday.toString(),
            "whoIsThis":"2",
          }
      );
      print("list is not empty");
      // listOfTransaction=[{
      //   "frontUserNumber":widget.frontUserPhone.toString(),
      //   "amountPaid":widget.amount.toString(),
      //   "currentTimeStamp":formattedDateToday.toString(),
      // }];
      listOfTransaction=tempList;

    }


    var newJsonTrans= jsonEncode(listOfTransaction);
    myList = {
      "name": newName,
      "number": newPhone,
      "password": newSavedPass,
      "availableAmount":remainingAmount,
      "transaction": newJsonTrans.toString(),

    };

    print("myList------------->${myList.toString()}");

    var newJson= jsonEncode(myList);
    // writehere(newJson).then( (_) =>
    //     Helper.moveToScreenwithPush(context, PaymentAccountReceiver(
    //       amount: barAmount,
    //       frontUserPayerNumber: barNumber,
    //     ))
    // );
    writehere(newJson).then( (_) =>
        Helper.moveToScreenwithPush(context, NewBeforeStatement(
          amount: barAmount,
          frontUserPayerNumber: barNumber,
        )
        )
    );
  }
  Future<File> writehere(String getFile) async {
    final file = await _localFile;

    // Write the file
    return file.writeAsString('$getFile');
  }
}
