import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:mollet/helper/constant.dart';
import 'package:mollet/receiver/payment_request.dart';

import '../bottom/bottom_screen.dart';
import '../helper/image.dart';

class PaymentReceiver extends StatefulWidget {
  const PaymentReceiver({Key? key}) : super(key: key);

  @override
  State<PaymentReceiver> createState() => _PaymentReceiverState();
}

class _PaymentReceiverState extends State<PaymentReceiver> {


  TextEditingController amountController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  int price = 0;

  List<Map<String, dynamic>> mapList = [];




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Form(
              key: _formKey,
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
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: amountController,
                    keyboardType: TextInputType.number,
                    // textAlign: TextAlign.right,
                    inputFormatters: [LengthLimitingTextInputFormatter(4)],
                    decoration: InputDecoration(
                      hintText: "Enter your amount",
                      hintStyle: GoogleFonts.poppins(
                        color: AppColor.secondaryColor,
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                            color: AppColor.secondaryColor, width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                              color: AppColor.secondaryColor, width: 2)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                              color: AppColor.secondaryColor, width: 2)),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                              color: AppColor.secondaryColor, width: 2)),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        // ToastMessage.msg("Please enter amount");
                        return "Please enter amount";
                      }
                      // else if (int.parse(value) > 1000) {
                      //   return "amount should not be greater than 1000";
                      //   // ToastMessage.msg(
                      //   //     "amount should not be greater than 1000");
                      // }
                    },
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Center(
                    child: MaterialButton(
                      color: AppColor.secondaryColor,
                      minWidth: MediaQuery.of(context).size.width / 1.2,
                      height: 50,
                      textColor: Colors.white,
                      child: Text(
                        "Request",
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          Helper.moveToScreenwithPush(context, PaymentRequest(
                               amount:amountController.text.toString(),
                               // totalPrice:total.toString(),
                             ));
                          print("prie---------->${amountController.text.toString()}");
                        } else {
                          print("amit-------------------------------");
                        }
                      },
                    ),
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
                  onTap: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) => BottomScreen(
                                  amt: "",
                                  phone: "",
                                )),
                        (Route<dynamic> route) => false);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        ProjectImage.home,
                        height: 30,
                        width: 30,
                      ),
                      SizedBox(
                        width: 10,
                      ),
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
                                color: Colors.white,
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


  //  getData() async{
  //
  //   var box = await Hive.openBox("transaction");
  //
  //   String hiveSavedPrice=box.getAt(0).toString();
  //
  //   setState(() {
  //     price=int.parse(hiveSavedPrice.toString());
  //   });
  //
  //   print("price =============================${box.getAt(0).toString()}");
  //
  // }
  //
  // calculate(price,price2){
  //
  //    int newPrice2=int.parse(price2);
  //
  //    print("newPrice2---------${newPrice2.toString()}");
  //
  //    int total=price+newPrice2;
  //
  //    print('total =====================${total}');
  //    Helper.moveToScreenwithPush(context, PaymentRequest(
  //      amount:amountController.text.toString(),
  //      totalPrice:total.toString(),
  //    ));
  //    // saveData(total);
  //    // newSaveData(total);
  //
  // }
  // newSaveData(total) async{
  //
  //   print("--------------------newSaveData---------------");
  //
  //   var box = await Hive.openBox("transaction");
  //
  //   // box.putAt(0, total);
  //   // box.put(1, 'number');
  //
  //   SessionHelper session = await SessionHelper.getInstance(context);
  //
  //   session.put(SessionHelper.AMOUNT,total.toString());
  //
  //   print("box-------------------${total.toString()}");
  //
  //   box.putAll({'key': 'value',
  //     0:total.toString(),
  //     1:session.get(SessionHelper.NUMBER).toString() ,
  //     2:amountController.text.toString()});
  //
  //   // print("box-------------------${box.values}");
  //
  //   Helper.moveToScreenwithPush(context, PaymentRequest(
  //     amount:amountController.text.toString(),
  //     totalPrice:total.toString(),
  //   ));
  //
  // }
// saveData(total) async{
  //
  //   var box = await Hive.openBox("mollet");
  //
  //   box.putAt(0, total);
  //
  //
  //
  //
  //   print('bodd  ${box.getAt(0)}');
  //   SessionHelper session= await SessionHelper.getInstance(context);
  //   session.put(SessionHelper.AMOUNT, box.getAt(0).toString());
  //
  //
  //   Helper.moveToScreenwithPush(context, PaymentRequest(
  //     amount: box.getAt(0).toString(),
  //     totalPrice: total.toString(),
  //   ));
  // }





}
