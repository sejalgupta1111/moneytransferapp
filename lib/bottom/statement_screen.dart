import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';

import '../helper/constant.dart';
import '../helper/image.dart';

class StatementScreen extends StatefulWidget {
 // const StatementScreen({Key? key}) : super(key: key);
  String phone="";
  StatementScreen({required this.phone});

  @override
  State<StatementScreen> createState() => _StatementScreenState();
}

class _StatementScreenState extends State<StatementScreen> {
  String phone="";
  String availBal="";
  List listOfTransaction=[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readHere();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Image.asset(
                  ProjectImage.MLogo,
                  height: 50,
                  width: 110,
                ),
              ),
              SizedBox(
                height: 25,
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
                  Text(phone=="9191919191"?"James":"Peter",
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
              Text(
                "Mobile No. ${phone}",
                style: GoogleFonts.poppins(
                    color: Color(0xFF303030),
                    fontWeight: FontWeight.w500,
                    fontSize: 21),
              ),
              SizedBox(
                height: 10,
              ),

              Text("Balance : ${availBal}",
                  style: GoogleFonts.poppins(
                      color: Color(0xFF303030),
                      fontWeight: FontWeight.w500,
                      fontSize: 21),
                  textAlign: TextAlign.center),
              SizedBox(
                height: 20,
              ),
              //list code
              listOfTransaction.isEmpty?
              Container(
                height: 50,
                child: Text(
                  "No Transactions yet!",
                  style: GoogleFonts.poppins(
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                      fontSize: 16),
                ),
              )
              :
              Container(


                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: listOfTransaction.length,
                    shrinkWrap: true,
                    reverse: true,
                    physics: NeverScrollableScrollPhysics(),

                    itemBuilder: (context, index) {
                      var data=listOfTransaction[index];
                      return  Container(
                       // height: 100,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  data["frontUserNumber"].toString()=="9191919191"?"James":"Peter",
                                  style: GoogleFonts.poppins(
                                      color: Color(0xFF303030),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20),
                                ),
                                Text(
                                  data["amountPaid"],
                                  style: GoogleFonts.poppins(
                                      color: Color(0xFF303030),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  data["frontUserNumber"].toString(),
                                  style: GoogleFonts.poppins(
                                      color: Color(0xFF303030),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18),
                                ),

                                // MaterialButton(
                                //   color: data["whoIsThis"]=="1" ?Colors.red:Colors.green,
                                //   minWidth: 35,
                                //   height: 35,
                                //   textColor: Colors.white,
                                //   child: Text(
                                //     data["whoIsThis"]=="1" ?"Pay":"Get",
                                //     style: TextStyle(
                                //         fontSize: 16,
                                //         fontWeight: FontWeight.bold),
                                //   ),
                                //   shape: RoundedRectangleBorder(
                                //       borderRadius: BorderRadius.circular(10)),
                                //   onPressed: () {},
                                // ),
                                 Container(
                                  width: 100.0,
                                  padding:  EdgeInsets.symmetric(horizontal: 14, vertical: 6 ),

                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: data["whoIsThis"]=="1" ?Colors.red:Colors.green,

                                  ),
                                  child:  Column(
                                      children: [
                                         Text( data["whoIsThis"]=="1" ?"Paid":"Received",
                                           style: GoogleFonts.poppins(
                                               color:Colors.white,
                                             fontSize: 15,
                                               fontWeight: FontWeight.bold
                                             ),),

                                      ]
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  data["currentTimeStamp"].toString(),
                                  style: GoogleFonts.poppins(
                                      color: Colors.grey,

                                      fontSize: 12),
                                ),
                                SizedBox()
                              ],
                            ),
                            Divider(
                              thickness: 1,
                              color: Colors.grey,
                            )
                          ],
                        ),
                      );
                    }),
              ),


              // Container(
              //   child: Column(
              //     children: [
              //       Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         children: [
              //           Text(
              //             "sam",
              //             style: GoogleFonts.poppins(
              //                 color: Color(0xFF303030),
              //                 fontWeight: FontWeight.w500,
              //                 fontSize: 20),
              //           ),
              //           Text(
              //             "1000\₹",
              //             style: GoogleFonts.poppins(
              //                 color: Color(0xFF303030),
              //                 fontWeight: FontWeight.w500,
              //                 fontSize: 18),
              //           ),
              //         ],
              //       ),
              //       Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         children: [
              //           Text(
              //             "8989591439",
              //             style: GoogleFonts.poppins(
              //                 color: Color(0xFF303030),
              //                 fontWeight: FontWeight.w500,
              //                 fontSize: 18),
              //           ),
              //           MaterialButton(
              //             color: Colors.red,
              //             minWidth: 35,
              //             height: 35,
              //             textColor: Colors.white,
              //             child: Text(
              //               "Pay",
              //               style: TextStyle(
              //                   fontSize: 16,
              //                   fontWeight: FontWeight.bold),
              //             ),
              //             shape: RoundedRectangleBorder(
              //                 borderRadius: BorderRadius.circular(10)),
              //             onPressed: () {},
              //           ),
              //         ],
              //       ),
              //       Divider(
              //         thickness: 1,
              //         color: Colors.grey,
              //       )
              //     ],
              //   ),
              // ),



              // Container(
              //   child: Column(
              //     children: [
              //       Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         children: [
              //           Text(
              //             "sam",
              //             style: GoogleFonts.poppins(
              //                 color: Color(0xFF303030),
              //                 fontWeight: FontWeight.w500,
              //                 fontSize: 20),
              //           ),
              //           Text(
              //             "1000\₹",
              //             style: GoogleFonts.poppins(
              //                 color: Color(0xFF303030),
              //                 fontWeight: FontWeight.w500,
              //                 fontSize: 18),
              //           ),
              //         ],
              //       ),
              //       Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         children: [
              //           Text(
              //             "8989591439",
              //             style: GoogleFonts.poppins(
              //                 color: Color(0xFF303030),
              //                 fontWeight: FontWeight.w500,
              //                 fontSize: 18),
              //           ),
              //           MaterialButton(
              //             color: Colors.green,
              //             minWidth: 35,
              //             height: 35,
              //             textColor: Colors.white,
              //             child: Text(
              //               "Get",
              //               style: TextStyle(
              //                   fontSize: 16,
              //                   fontWeight: FontWeight.bold),
              //             ),
              //             shape: RoundedRectangleBorder(
              //                 borderRadius: BorderRadius.circular(10)),
              //             onPressed: () {},
              //           ),
              //         ],
              //       ),
              //       Divider(
              //         thickness: 1,
              //         color: Colors.grey,
              //       )
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
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


      if(valueMap['transaction']==""){
        setState(() {
          availBal=valueMap['availableAmount'].toString();
          phone=valueMap['number'].toString();
          //listOfTransaction=tempDecode;
        });
      }else{
        var tempDecode=jsonDecode(valueMap['transaction']);
        print("in stmt tempdecode===>${tempDecode.toString()}");
        setState(() {
          availBal=valueMap['availableAmount'].toString();
          phone=valueMap['number'].toString();
          listOfTransaction=tempDecode;
        });
      }
      // listOfTransaction.forEach((element) {
      //   print("in list===>${element.toString()}");
      // });
       print("here bal===>${valueMap['availableAmount'].toString()}");
       print("here availBal===>${availBal}");
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
}
