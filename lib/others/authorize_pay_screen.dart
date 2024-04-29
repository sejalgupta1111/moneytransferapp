import 'dart:convert';
import 'dart:io';

import 'package:external_path/external_path.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:mollet/bottom/bottom_screen.dart';
import 'package:mollet/helper/constant.dart';
import 'package:mollet/others/paymemt_confirm_screen.dart';
import 'package:mollet/others/payment_receipt_screen.dart';
import 'package:mollet/others/payment_scan_screen.dart';
import 'package:mollet/others/payment_scan_screen_two.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pinput/pinput.dart';

import '../helper/image.dart';
import '../testing/file_storage.dart';




class AuthorizePayScreen extends StatefulWidget {
  String amount = "";
  String frontUserPhone = "";

  AuthorizePayScreen({required this.amount,required this.frontUserPhone });

  @override
  State<AuthorizePayScreen> createState() => _AuthorizePayScreenState();
}

class _AuthorizePayScreenState extends State<AuthorizePayScreen> {


  TextEditingController otpController = TextEditingController();
  int price = 0;

  String pass="";
  String savedPass="";
  String am="";
  Map<String, String> transaction = {};
  Map<String, String> myList = {};


  Map<String,dynamic> newTransaction = {};
  Map<String,dynamic> newTransaction2 = {};

String newSavedPass="";
String newName="";
String newPhone="";

String newAvailableAmount="";
String newTransactionPan="";
List listOfTransPan=[];

  int details=0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getData();
  //  idGet();
    readHere();
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
                Text("AUTHORIZE PAYMENT",
                    style: GoogleFonts.poppins(
                        color: Color(0xFF303030),
                        fontWeight: FontWeight.w400,
                        fontSize: 21),
                    textAlign: TextAlign.center),
                SizedBox(
                  height: 50,
                ),
                Container(
                  margin:EdgeInsets.symmetric(horizontal: 10) ,
                  width: MediaQuery.of(context).size.width,
                  child: Pinput(
                    length: 4,
                    controller: otpController,
                    forceErrorState: true,
                    errorText: '',
                    defaultPinTheme: PinTheme(
                        width: 60,
                        textStyle: TextStyle(color: Colors.black,fontSize: 22),
                        height: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.transparent,
                            border: Border.all(color: AppColor.secondaryColor)
                        )
                    ),
                    keyboardType: TextInputType.number,
                    // controller: otpController,
                    validator: (pin) {
                      if (pin!.length < 4){
                        return 'Pin can not be less than 4 digit';
                      }else if((newPhone=="9191919191" && otpController.text=="1390")||
                          newPhone=="8181818181" && otpController.text=="1234"){

                      }

                    }
                  ),
                ),
                SizedBox(height: 50,),
                Center(
                  child: MaterialButton(
                    color: AppColor.secondaryColor,
                    minWidth: MediaQuery.of(context).size.width / 1.2,
                    height: 50,
                    textColor: Colors.white,
                    child: Text(
                      "Submit",
                      style: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    onPressed: () {

                          setState(() {
                            // if(savedPass == otpController.text){
                            //   updateJsonFile();
                            //
                            //   // calculate(price, widget.amount);
                            // }
                            // else{
                            //   ToastMessage.msg("please check your password");
                            // }
                            if(newSavedPass == otpController.text){
                              // updateJsonFile();

                              newUpdateJsonFile();
                            }
                            else{
                              ToastMessage.msg("please check your password");
                            }
                          });
                    },
                  ),
                ),
              ],
            ),
          ),
          Positioned(
              bottom: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 65,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                    color: AppColor.secondaryColor),
                child: InkWell(
                  onTap: (){
                    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                        BottomScreen(amt: "",phone: "",)), (Route<dynamic> route) => false);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
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
              ))
        ],
      ),
    );
  }

  // void getData() async {
  //
  //   print("---------Authorize-----------getData--------");
  //
  //   // var box = await Hive.openBox("mollet");
  //
  //   print("pass----------->${ box.getAt(1)}");
  //
  //   setState(() {
  //     // price = int.parse(am.toString());
  //     pass = box.getAt(1);
  //   });
  // }
  // Future<void> calculate(int price,String price2 ) async {
  //
  //   print("price2----+++++---${price+int.parse(price2)}");
  //
  //   int total = price-int.parse(price2);
  //
  //   print("total----------1----${total}");
  //
  //   var box = await Hive.openBox("mollet");
  //
  //   box.putAt(0,total.toString());
  //   dataSave(total);
  //   print("total price----------------->${box.getAt(0)}");
  //
  //
  //   Helper.moveToScreenwithPush(context, PaymentConfirmScreen(
  //     amt: widget.amount,
  //   ));
  //
  // }
  //
  // void dataSave(total) async{
  //   SessionHelper session = await SessionHelper.getInstance(context);
  //   session.put(SessionHelper.AMOUNT,total.toString());
  //
  //   print("new amount ================${session.get(SessionHelper.AMOUNT)}");
  //
  // }



  void put() {
    print("=------------------put----------------");


    var at = jsonEncode(myList);

    // print("num---------->${numberController.text.toString()}");
    // print("pass---------->${passwordController.text.toString()}");


    myList = {
      // "name": "user",
      // "number": numberController.text.toString(),
      // "password": passwordController.text.toString(),
      // "availableAmount": "1000",
      "transaction": transaction.toString(),
    };

    print("myList------------->${myList.toString()}");

    FileStorage.writeCounter(
        at, "mollet.json");



  }

  void updateJsonFile() async {
    print("--------------updateJsonFile------------");

    Directory appDocDir = await getApplicationDocumentsDirectory();
    var at = jsonEncode(myList);
    // File jsonFile = File("${appDocDir.path}/mollet.json");

    //update
    // final jsonAsString = jsonFile.readAsString();
    // transaction = transaction.fromJson(jsonDecode(jsonAsString));

    // var upDate = jsonEncode(jsonAsString.toString());



    newTransaction['$details'] = newTransaction2;

    newTransaction2['number'] = '8989591439';
    newTransaction2['amount'] = '${widget.amount}';


    myList = {
        "name": "user",
        "number": "8989591439",
        "password": "1234",
        "availableAmount": "1000",
      "transaction":newTransaction.toString()
    };


    FileStorage.writeCounter(
        at, "mollet.json");
    setState(() {});

    Helper.moveToScreenwithPush(context, PaymentConfirmScreen(
      amt: widget.amount,
      det:details.toString(),
    ));
  }

  newUpdateJsonFile() async{
    String remainingAmount=(int.parse(newAvailableAmount)-int.parse(widget.amount)).toString();
    print("remainingAmount===>${remainingAmount.toString()}");
    print("transaction===>${transaction.toString()}");
    print("listOfTransPan===>${listOfTransPan.toString()}");
    print("transaction===>${widget.frontUserPhone.toString()}");
    var formatter = new DateFormat('yyyy-MM-dd, HH:mm:ss');
    var now = new DateTime.now();
    String formattedDateToday = formatter.format(now);
    print("formattedDateToday===>${formattedDateToday.toString()}");
    var newTransaction={};
    List listOfTransaction=[];
    if(listOfTransPan.isEmpty){
      listOfTransaction=[{
        "frontUserNumber":widget.frontUserPhone.toString(),
        "amountPaid":widget.amount.toString(),
        "currentTimeStamp":formattedDateToday.toString(),
        "whoIsThis":"1",
      }];
      print("list is empty");
    }else{

      List tempList=listOfTransPan;
      tempList.add(
          {
            "frontUserNumber":widget.frontUserPhone.toString(),
            "amountPaid":widget.amount.toString(),
            "currentTimeStamp":formattedDateToday.toString(),
            "whoIsThis":"1",
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

    // FileStorage.writeCounte
    // r(
    //     at, "mollet.json");
    var newJson= jsonEncode(myList);
    writehere(newJson).then((_) =>
        Helper.moveToScreenwithPush(context, PaymentConfirmScreen(
          amt: widget.amount,
          det:details.toString(),
        ))
    );
  }


//back up
//   newUpdateJsonFile() async{
//     String remainingAmount=(int.parse(newAvailableAmount)-int.parse(widget.amount)).toString();
//     print("remainingAmount===>${remainingAmount.toString()}");
//     print("transaction===>${transaction.toString()}");
//     print("transaction===>${widget.frontUserPhone.toString()}");
//     var formatter = new DateFormat('yyyy-MM-dd, HH:mm:ss');
//     var now = new DateTime.now();
//     String formattedDateToday = formatter.format(now);
//     print("formattedDateToday===>${formattedDateToday.toString()}");
//     var newTransaction={};
//     List listOfTransaction=[];
//     newTransaction={
//       "frontUserNumber":widget.frontUserPhone.toString(),
//       "amountPaid":widget.amount.toString(),
//       "currentTimeStamp":formattedDateToday.toString(),
//     };
//
//
//     var newJsonTrans= jsonEncode(newTransaction);
//     myList = {
//       "name": newName,
//       "number": newPhone,
//       "password": newSavedPass,
//       "availableAmount":remainingAmount,
//       "transaction": newJsonTrans.toString(),
//     };
//
//     print("myList------------->${myList.toString()}");
//
//     // FileStorage.writeCounte
//     // r(
//     //     at, "mollet.json");
//     var newJson= jsonEncode(myList);
//     writehere(newJson).then((_) =>
//         Helper.moveToScreenwithPush(context, PaymentConfirmScreen(
//           amt: widget.amount,
//           det:details.toString(),
//         ))
//     );
//   }


  void idGet() async {

    print("------------------idGet-----------");

    String path = (await ExternalPath.getExternalStoragePublicDirectory(
        ExternalPath.DIRECTORY_DOWNLOADS));
    print(path);
    File file = await File('${path}/mollet.json');
    print("-----------file-----------${file.toString()}");
    // getExternalStoragePublicDirectory(ExternalPath.DIRECTORY_DOWNLOADS);
    String contents = await file.readAsString();
    print(contents.toString());

    var ap = jsonDecode(contents);

   // print("id------------------${ap['transaction'].toList()}");

    // ap.map((entry) => (entry['transaction'])).toList();
    var amit =ap.length.toString();
    setState(() {
      savedPass = "1234";
     details = int.parse(amit)+1;
    });
    print("details---------------->${details.toString()}");
    print("savedPass---------------->${savedPass.toString()}");
  }


  Future readHere() async {
    print("readHere---------------->");
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
      print("here 4 ===>${valueMap['transaction'].toString()}");
      setState(() {
        newSavedPass=valueMap['password'].toString();
        newName=valueMap['name'].toString();
        newPhone=valueMap['number'].toString();
        print("dekho 0");
        newAvailableAmount=valueMap['availableAmount'].toString();
        // newTransactionPan=valueMap['transaction'].toString();
        print("dekho 1");
        print("${valueMap['transaction'].runtimeType}");
        print("${listOfTransPan.runtimeType}");
        // listOfTransPan=valueMap['transaction'];
        listOfTransPan=jsonDecode(valueMap['transaction']);
        print("dekho 2");
      });
      print("here 5====listOfTransPan==in read==${listOfTransPan.toString()}");
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
  Future<File> writehere(String getFile) async {
    final file = await _localFile;

    // Write the file
    return file.writeAsString('$getFile');
  }
}
