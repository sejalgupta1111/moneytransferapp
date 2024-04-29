import 'dart:convert';
import 'dart:io';

import 'package:external_path/external_path.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import '../bottom/bottom_screen.dart';
import '../helper/constant.dart';
import '../helper/image.dart';




class PaymentAccountReceiver extends StatefulWidget {

  String amount="";
  String frontUserPayerNumber="";
  // String totalPrice = "";

  PaymentAccountReceiver({required this.amount,required this.frontUserPayerNumber,
    // required this.totalPrice
  });

  @override
  State<PaymentAccountReceiver> createState() => _PaymentAccountReceiverState();
}

class _PaymentAccountReceiverState extends State<PaymentAccountReceiver> {



  String totalAmount = "";

  int paymentTotal = 0;

  int totalAm=0;
  int  totalPayment=0;


  String am ="";
//pankaj
  String lbNew="";
  String pltNew="";
  String ltNew="";
  String availBalNew="";
  String frontUserNumber="";

  String newSavedPass="";
  String newName="";
  String newPhone="";

  String newAvailableAmount="";
  String newTransactionPan="";
  String currentTimestamp="";
  Map<String, String> myList = {};
  String payOrGet="";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //1 totalPayment2();
   // _fetchData();
    myBalanceData();

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
                  Text("Account Balance",
                      style: GoogleFonts.poppins(
                          color: Color(0xFF303030),
                          fontWeight: FontWeight.w500,
                          fontSize: 21),
                      textAlign: TextAlign.center),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Ledger Balance",
                          style: GoogleFonts.poppins(
                              color: Color(0xFF303030),
                              fontWeight: FontWeight.w400,
                              fontSize: 18),
                          textAlign: TextAlign.center),
                      Text(lbNew,
                          style: GoogleFonts.poppins(
                              color: Color(0xFF303030),
                              fontWeight: FontWeight.w400,
                              fontSize: 18),
                          textAlign: TextAlign.center),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Pre-Last Transaction",
                          style: GoogleFonts.poppins(
                              color: Color(0xFF303030),
                              fontWeight: FontWeight.w400,
                              fontSize: 18),
                          textAlign: TextAlign.center),
                      Text(pltNew,
                          style: GoogleFonts.poppins(
                              color: Color(0xFF303030),
                              fontWeight: FontWeight.w400,
                              fontSize: 18),
                          textAlign: TextAlign.center),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Last Transaction",
                          style: GoogleFonts.poppins(
                              color: Color(0xFF303030),
                              fontWeight: FontWeight.w400,
                              fontSize: 18),
                          textAlign: TextAlign.center),
                      Text(ltNew,
                          style: GoogleFonts.poppins(
                              color: Color(0xFF303030),
                              fontWeight: FontWeight.w400,
                              fontSize: 18),
                          textAlign: TextAlign.center),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Available Balance",
                          style: GoogleFonts.poppins(
                              color: AppColor.secondaryColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 18),
                          textAlign: TextAlign.center),
                      Text(availBalNew,
                          style: GoogleFonts.poppins(
                              color: AppColor.secondaryColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 18),
                          textAlign: TextAlign.center),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Image.asset(ProjectImage.image,
                    height: 150,width: 150,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Divider(
                          indent: 10.0,
                          endIndent: 10.0,
                          thickness: 1,
                          color: AppColor.secondaryColor,
                        ),
                      ),
                      Text("Statement",
                        style: GoogleFonts.poppins(
                            color: AppColor.secondaryColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w500
                        ),),
                      Expanded(
                        child: Divider(
                          indent: 10.0,
                          endIndent: 10.0,
                          thickness: 1,
                          color: AppColor.secondaryColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("${currentTimestamp}",
                          style: GoogleFonts.poppins(
                              color: AppColor.secondaryColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 14),
                          textAlign: TextAlign.center),
                      Text(frontUserNumber=="9191919191"?" James ":" Peter ",
                          style: GoogleFonts.poppins(
                              color: AppColor.secondaryColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 14),
                          textAlign: TextAlign.center),
                      Text(payOrGet=="1"?" DR ":" CR ",
                          style: GoogleFonts.poppins(
                              color: AppColor.secondaryColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 14),
                          textAlign: TextAlign.center),
                      Text(ltNew,
                          style: GoogleFonts.poppins(
                              color: AppColor.secondaryColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 14),
                          textAlign: TextAlign.center),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                ],
              ),
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
                        BottomScreen(amt: totalPayment.toString(),phone: "",)), (Route<dynamic> route) => false);
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
                                phone: "9191919191",
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

  // Future<void> calculate() async {
  //
  //
  //   var box = await Hive.openBox("mollet");
  //
  //   String total = box.getAt(0);
  //
  //   print("total----------${total}");
  //
  //   setState(() {
  //
  //     totalAmount = total.toString();
  //
  //     print("total----------1----${totalAmount}");
  //   });
  //
  // }
  void _fetchData() async {

    print("----------------_fetchData---------------");

    String path = (await ExternalPath.getExternalStoragePublicDirectory(
        ExternalPath.DIRECTORY_DOWNLOADS));
    print(path);
    File file = await File('${path}/mollet.json');
    print("-----------file-----------${file.toString()}");
    // getExternalStoragePublicDirectory(ExternalPath.DIRECTORY_DOWNLOADS);
    String contents = await file.readAsString();
    print(contents.toString());

    var ap = jsonDecode(contents);

    print("ap---password------------${ap['password'].toString()}");
    print("ap----availableAmount-----------${ap['availableAmount'].toString()}");

    setState(() {

      am = ap['availableAmount'].toString();


      print("Amount---------->${am.toString()}");
    });
    totalPayment2();
  }


  totalPayment2() async {

    print("--------------------totalPayment---------------");

    // var box = await Hive.openBox("transaction");

    // print("totalPrice----------------->${widget.totalPrice}");
    // paymentTotal = int.parse(widget.totalPrice);
    paymentTotal = int.parse(am.toString());

    // box.putAt(0, paymentTotal);

    print("paymentTotal--------------------${paymentTotal.toString()}");
    newSaveData(paymentTotal);

    // SessionHelper session = await SessionHelper.getInstance(context);
    //
    // myMap{(
    //   "name":"Amit",
    //   "contat":64546
    // )};
    // setState(() {
    //   myMap ['amount'] = widget.amount.toString();
    //   myMap ['number'] = session.get(SessionHelper.NUMBER.toString());
    // });
    // print("myMap----------------------${myMap.toString()}");

  }

  newSaveData(total) async{

    print("--------------------newSaveData---------------");

    // var box = await Hive.openBox("transaction");

    totalPayment =   int.parse(widget.amount.toString()) + int.parse(total.toString());

    print("==================totalPayment--------${totalPayment.toString()}");

    SessionHelper session = await SessionHelper.getInstance(context);

    session.put(SessionHelper.AMOUNT,totalPayment.toString());

    // print("box-------------------${total.toString()}");

    // box.putAll({'key': 'value',
    //   0:total.toString(),
    //   1:session.get(SessionHelper.NUMBER).toString() ,
    //   2:widget.amount});

    // print("box-------------------${box.values}");

    // calculateAmount(total);

  }


void calculateAmount(total) async {

  print("=============calculateAmount===Rec=========");
  // print("totalPrice----------------->${widget.totalPrice}");
  // print("=============widget.amount====${widget.amount.toString()}");


  // var box = await Hive.openBox("transaction");
  //
  // print("============box====${box.getAt(0).toString()}");

  SessionHelper sessionHelper =await SessionHelper.getInstance(context);



  setState(()  {



    print("==================totalPayment--------${totalPayment.toString()}");
    sessionHelper.put(SessionHelper.AMOUNT,totalPayment.toString());

  });


  print("==sessionAMount--------------------${sessionHelper.get(SessionHelper.AMOUNT)}");
  // newSaveData(totalPayment);

}

//pankaj

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }
  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/new_data.json');
  }

  myBalanceData() async {

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
      print("here 3===>${valueMap['transaction'].toString()}");
      // var transTemp=valueMap['transaction'];
      // print("here transTemp===>${transTemp.toString()}");
      // Map<String, dynamic> transMap = jsonDecode(transTemp);
      // print("here transTemp===>${transMap["amountPaid"].toString()}");
      // print("here transTemp===>${transMap["frontUserNumber"].toString()}");

      //12 june
      var tempDecode=jsonDecode(valueMap['transaction']);
      print("here here===>${tempDecode.toString()}");
      print("here here 2===>${tempDecode.last.toString()}");
      var lastTempDecode=tempDecode.last;
      print("here here 3===>${lastTempDecode["currentTimeStamp"].toString()}");
      print("here 3===>${valueMap['transaction'].toString()}");
      setState(() {

        // myPhone=valueMap['number'].toString();


        // pltNew=valueMap['availableAmount'].toString();
        // ltNew=transMap["amountPaid"].toString();
        // availBalNew=(int.parse(valueMap['availableAmount'].toString())+int.parse(transMap["amountPaid"].toString())).toString();
        // lbNew=availBalNew;
        // frontUserNumber=transMap["frontUserNumber"].toString();
        // currentTimeStamp=transMap["currentTimeStamp"].toString();

        //12 june
        lbNew=valueMap['availableAmount'].toString();
        pltNew=(int.parse(valueMap['availableAmount'].toString())-int.parse(lastTempDecode["amountPaid"].toString())).toString();
        ltNew=lastTempDecode["amountPaid"].toString();
        availBalNew=valueMap['availableAmount'].toString();
        frontUserNumber=lastTempDecode["frontUserNumber"].toString();
        currentTimestamp=lastTempDecode["currentTimeStamp"].toString();
        payOrGet=lastTempDecode["whoIsThis"].toString();
      });
      print("ye dekho===>");
      print("here 11===>${valueMap['availableAmount'].toString()}");
      print("here 12===>${lastTempDecode["amountPaid"].toString()}");
      print("here 13===>${lastTempDecode["frontUserNumber"].toString()}");
      print("availBalNew after assign===>${availBalNew}");
      print("pltNew after assign===>${pltNew}");
      print("ltNew after assign===>${ltNew}");
      print("frontUserNumber after assign===>${frontUserNumber}");
      print("currentTimestamp after assign===>${currentTimestamp}");

      // print("here amt===>${valueMap["availableAmount"]}");
    } catch (e) {
      // If encountering an error, return 0
      return 0;
    }
  }


  Future<File> writehere(String getFile) async {
    final file = await _localFile;

    // Write the file
    return file.writeAsString('$getFile');
  }
}
