import 'dart:convert';
import 'package:external_path/external_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:mollet/all_data_model.dart';
import 'package:mollet/bottom/bottom_screen.dart';
import 'package:mollet/bottom/home_screen.dart';
import 'package:mollet/helper/image.dart';
import 'package:path_provider/path_provider.dart';
import '../helper/constant.dart';
import '../helper/newSessionHelper.dart';
import '../testing/file_storage.dart';
import 'dart:io';




class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {

  final _formKey = GlobalKey<FormState>();

  bool isValidated = false;
  String savedNumber = '';
  String savedPassword = '';
  String amt = "";

  TextEditingController numberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  List<Map<String, dynamic>> _Users = [];

  String Phone = "";


  List _items = [];

  Map<String, String> myList = {};

  Map<String, String> transaction = {};
AllDataModel? allDataModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _localPath;
    _localFile;
    // _fetchData();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery
            .of(context)
            .size
            .width,
        height: MediaQuery
            .of(context)
            .size
            .height,
        padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 17),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20,),
                Image.asset(ProjectImage.MLogo,
                  height: 120, width: 120,
                ),
                Text("Log In",
                  style: GoogleFonts.poppins(
                      color: Color(0xFF303030),
                      fontWeight: FontWeight.w500,
                      fontSize: 21
                  ),),
                SizedBox(height: 20,),
                Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius:
                    BorderRadius.all(Radius.circular(30)),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 7,
                        offset: Offset(3, 5),
                      ),
                    ],
                  ),
                  child: TextFormField(
                    controller: numberController,
                    textAlign: TextAlign.start,
                    keyboardType: TextInputType.number,
                    inputFormatters: [LengthLimitingTextInputFormatter(10),],
                    decoration: InputDecoration.collapsed(
                      hintText: "Mobile no",
                      hintStyle: GoogleFonts.poppins(fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF585858)
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        ToastMessage.msg("Please enter Mobile number");
                        // return "Please enter Mobile number";
                      } else if (value.length != 10) {
                        // return "Mobile Number must be of 10 digit";
                        ToastMessage.msg("Mobile Number must be of 10 digit");
                      }
                    },),
                ),
                SizedBox(height: 30,),
                Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius:
                    BorderRadius.all(Radius.circular(30)),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 7,
                        offset: Offset(3, 5),
                      ),
                    ],
                  ),
                  child: TextFormField(
                    controller: passwordController,
                    textAlign: TextAlign.start,
                    keyboardType: TextInputType.number,
                    inputFormatters: [LengthLimitingTextInputFormatter(4),],
                    decoration: InputDecoration.collapsed(
                      hintText: "Password",
                      hintStyle: GoogleFonts.poppins(fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF585858)
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        ToastMessage.msg("Please enter password");
                        // return "Please enter password";
                      } else if (value.length != 4) {
                        // return "password must be of 4 digit";
                        ToastMessage.msg("password must be of 4 digit");
                      }
                    },
                  ),
                ),
                SizedBox(height: 50,),
                Center(
                  child: MaterialButton(
                    color: AppColor.secondaryColor,
                    minWidth: MediaQuery
                        .of(context)
                        .size
                        .width / 1.2,
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
                      _buttonSubmit();
                    },
                  ),
                ),
                SizedBox(height: 150,),
                Row(
                  children: [
                    Text(" Privacy Policy",
                      style: GoogleFonts.poppins(
                          color: Color(0xFF787878),
                          fontWeight: FontWeight.w400,
                          fontSize: 11
                      ),
                    ),
                    SizedBox(width: 5,),
                    Container(
                      height: 15, width: 10,
                      child: VerticalDivider(
                        color: Color(0xFFD9D9D9),
                        width: 2,
                        thickness: 1,
                      ),
                    ),
                    SizedBox(width: 3),
                    Text("Disclaimer",
                      style: GoogleFonts.poppins(
                          color: Color(0xFF787878),
                          fontWeight: FontWeight.w400,
                          fontSize: 11
                      ),
                    ),
                    SizedBox(width: 3,),
                    Container(
                      height: 15, width: 10,
                      child: VerticalDivider(
                        color: Color(0xFFD9D9D9),
                        width: 2,
                        thickness: 1,
                      ),
                    ),
                    SizedBox(width: 3),
                    Text("User Guide",
                      style: GoogleFonts.poppins(
                          color: Color(0xFF787878),
                          fontWeight: FontWeight.w400,
                          fontSize: 11
                      ),
                    ),
                    SizedBox(width: 3),
                    Container(
                      height: 15, width: 10,
                      child: VerticalDivider(
                        color: Color(0xFFD9D9D9),
                        width: 2,
                        thickness: 1,
                      ),
                    ),
                    Text("Cookies Notice",
                      style: GoogleFonts.poppins(
                          color: Color(0xFF787878),
                          fontWeight: FontWeight.w400,
                          fontSize: 11
                      ),
                    ),
                  ],
                ),
                Text("user terms & Condition",
                  style: GoogleFonts.poppins(
                      color: Color(0xFF787878),
                      fontWeight: FontWeight.w400,
                      fontSize: 11
                  ),
                ),
                SizedBox(height: 20,),
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                            color: AppColor.secondaryColor,
                            width: 1
                        )
                    ),
                    child: MaterialButton(
                      minWidth: MediaQuery
                          .of(context)
                          .size
                          .width / 1.2,
                      height: 50,
                      textColor: Colors.white,
                      child: Text(
                        "Sign Up",
                        style: const TextStyle(
                            color: Color(0xFF0047CB),
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      onPressed: () {
                        // _fetchData();
                        // amit();
                        // if(savedNumber == numberController.text.toString() &&
                        //     savedPassword == passwordController.text.toString()){
                        //    print("login success");
                        //
                        // }
                        // else{
                        //   print("sign needed");
                        // }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }




  ///////////////READING JSON DATA////////////////////////
  //amit button submit
  // _buttonSubmit() async {
  //   print("----------buttonSubmit-------------");
  //   // if (_formKey.currentState!.validate()) {
  //   //   _formKey.currentState!.save();
  //   //
  //   //   registerUser(numberController.text.toString(),
  //   //       passwordController.text.toString());
  //   // }
  //
  //   if (numberController.text.toString() == "" &&
  //       passwordController.text.toString() == "") {
  //     ToastMessage.msg("Please enter all the value");
  //   }
  //   else if (numberController.text.toString() == "" ||
  //       passwordController.text.toString() == "") {
  //     ToastMessage.msg("please enter all the values");
  //   } else {
  //     if (numberController.text.length < 10 ||
  //         numberController.text.length > 10) {
  //       ToastMessage.msg("number must be of 10 digit");
  //     } else if (passwordController.text.length < 4 ||
  //         passwordController.text.length > 4) {
  //       ToastMessage.msg("password must be of 4 digit");
  //     } else {
  //       if (savedNumber == numberController.text.toString() && savedPassword
  //           == passwordController.text.toString()) {
  //         print("sign not need---------");
  //
  //
  //         Helper.moveToScreenwithPush(context, BottomScreen(
  //           amt: "1000",
  //           phone: numberController.text.toString(),));
  //
  //         print("amt-----------${amt.toString()}");
  //       }
  //       else {
  //         print("sign needed ---------");
  //
  //         put();
  //       }
  //     }
  //   }
  // }

  //pakaj button submit
  _buttonSubmit() async {
    print("----------buttonSubmit-------------");
    // if (_formKey.currentState!.validate()) {
    //   _formKey.currentState!.save();
    //
    //   registerUser(numberController.text.toString(),
    //       passwordController.text.toString());
    // }

    if (numberController.text.toString() == "" &&
        passwordController.text.toString() == "") {
      ToastMessage.msg("Please enter all the value");
    }
    else if (numberController.text.toString() == "" ||
        passwordController.text.toString() == "") {
      ToastMessage.msg("please enter all the values");
    } else {
      if (numberController.text.length < 10 ||
          numberController.text.length > 10) {
        ToastMessage.msg("number must be of 10 digit");
      } else if (passwordController.text.length < 4 ||
          passwordController.text.length > 4) {
        ToastMessage.msg("password must be of 4 digit");
      } else {
        // if (savedNumber == numberController.text.toString() && savedPassword
        //     == passwordController.text.toString()) {
        //   print("sign not need---------");
        //
        //
        //   Helper.moveToScreenwithPush(context, BottomScreen(
        //     amt: "1000",
        //     phone: numberController.text.toString(),));
        //
        //   print("amt-----------${amt.toString()}");
        // }
        // else {
        //   print("sign needed ---------");
        //
        //   put();
        // }
        if((numberController.text=="9191919191" && passwordController.text=="1390")||
            numberController.text=="8181818181" && passwordController.text=="1234"){
          print("successful login");
          put();
        }else{
          ToastMessage.msg("Please enter correct login credential");
        }
      }
    }
  }

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

    print("ap---------------${ap['password'].toString()}");
    print("ap---------------${ap['number'].toString()}");

    setState(() {
      savedPassword = ap['password'].toString();
      savedNumber = ap['number'].toString();
      amt = ap['availableAmount'].toString();

      print("passMatch---------->${savedPassword.toString()}");
      print("numMatch---------->${savedNumber.toString()}");
      print("Amount---------->${amt.toString()}");

      // if(savedPassword.toString()==passwordController.text.toString() &&
      //     savedPassword.toString() ==numberController.text.toString()){
      //   print("Match--------------");
      // }else{
      //   print("Match done----------->");
      // }

    });
  }

  Future<void> put() async {
   // SharedPref sharedPref = SharedPref();

    print("=------------------put----------------");


    var at = jsonEncode(myList);

    print("num---------->${numberController.text.toString()}");
    print("pass---------->${passwordController.text.toString()}");
    List blankList=[];

    myList = {
      "name": "user",
      "number": numberController.text.toString(),
      "password": passwordController.text.toString(),
      "availableAmount": "1000",
      "transaction": "",
    };

    print("myList------------->${myList.toString()}");

    // FileStorage.writeCounter(
    //     at, "mollet.json");
   var newJson= jsonEncode(myList);
    writehere(newJson);



    // SessionHelper sessionHelper = await SessionHelper.getInstance(context);
    //
    // sessionHelper.put(SessionHelper.ALL_DATA,myList.toString());
    // setState(() {
    //   allDataModel!.name="user";
    //
    //
    //   allDataModel!.number=numberController.text.toString();
    //   allDataModel!.password=passwordController.text.toString();
    //   allDataModel!.availableAmount="1000";
    //   sharedPref.save("allDataModel", allDataModel);
    // });




    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
        BottomScreen(
          amt: "1000",
          phone: numberController.text.toString(),
        )),
            (Route<dynamic> route) => false);

    // SessionHelper sessionHelper = await SessionHelper.getInstance(context);
    // sessionHelper.put(SessionHelper.AMOUNT,"1000");
    // sessionHelper.put(SessionHelper.NUMBER, numberController.text.toString());
  }

  Future<void> readJson() async {
    print("----------------readJson---------------");

    final String response = await rootBundle.loadString(
        '/storage/emulated/0/Download');
    final data = await json.decode(response);

    setState(() {
      _items = data["items"];
    });

    print("items-------------->${_items.toString()}");
    print("data-------------->${data.toString()}");
  }


// void loginData() async {
//
//   print("----------Login-----------------");
//
//
//   var box = await Hive.openBox("mollet");
//
//   box.put("number",numberController.text.toString(),);
//   box.put("password",passwordController.text.toString(),);
//   // box.put("Amount","1000",);
//
//
//   print(box.get("number"));
//   print(box.get("password"));
//   // print(box.get("Amount"));
//
//
//
//   // SessionHelper sessionHelper =await SessionHelper.getInstance(context);
//   //
//   // sessionHelper.put(SessionHelper.NUMBER,numberController.text.toString());
//   //
//   // newAmount();
//
//
//
//   // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
//   //      BottomScreen(
//   //        amt: box.get("Amount"),
//   //        phone: box.get("number"),
//   //      )), (Route<dynamic> route) => false);
//
//
//   // Helper.moveToScreenwithPush(context, BottomScreen(amt: box.get("Amount"),
//   //     phone: box.get("number")));
//
// }


// void newAmount() async {
//
//   print("---------------newAmount--------------");
//
//   var box = await Hive.openBox("transaction");
//
//
//   box.put(0, Amount.toString());
//
//   // SessionHelper sessionHelper =await SessionHelper.getInstance(context);
//   // sessionHelper.put(SessionHelper.AMOUNT,"1000");
//
//     // print("newAMount-----------------${box.getAt(0).toString()}");
//
//   // Helper.moveToScreenwithPush(context, BottomScreen(
//   //   amt:"1000",
//   //   phone:numberController.text.toString(),
//   // ));
//
// }

// getUserData() async {
//
//   print("----------getUserData-----------------");
//
//   var box = await Hive.openBox("mollet");
//   //
//   // SessionHelper session = await SessionHelper.getInstance(context);
//   // session.put(SessionHelper.NUMBER,box.getAt(1).toString());
//   //
//   // // print("index--amount----0--${box.getAt(0)}");
//   // // print("index----number-----1--${box.getAt(1)}");
//   // // print("index----password------2---${box.getAt(2)}");
//
//   setState(() {
//     savedNumber = box.get(1).toString();
//     savedPassword = box.get(2).toString();
//   });
//
//
//
//   // print("session amount =========================${session.get(SessionHelper.AMOUNT)}");
//   // print("session number =========================${session.get(SessionHelper.NUMBER)}");
//   // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
//   //     BottomScreen(
//   //       amt:session.get(SessionHelper.AMOUNT).toString() ,
//   //       phone:session.get(SessionHelper.NUMBER).toString(),
//   //     )), (Route<dynamic> route) => false);
//   // Helper.moveToScreenwithPush(context, BottomScreen(
//   //   amt:session.get(SessionHelper.AMOUNT).toString() ,
//   //   phone:session.get(SessionHelper.NUMBER).toString(),
//   // ));
//
//
//
// }

// Future<void> amit() async {
//
//   print("----------------amit---------------");
//
//   var box = await Hive.openBox("mollet");
//
//   box.get(numberController.text.toString(),);
//
//   box.get(passwordController.text.toString());
//
//
//   setState(() {
//     savedNumber=box.getAt(2);
//     savedPassword=box.getAt(3);
//     print("number-----------${box.getAt(2)}");
//     print("password-----------${box.getAt(3)}");
//
//   });
//
//
//
//   // print("savedNumber ========================${savedNumber}");
//   // print("savedPassword ========================${savedPassword}");
//
//   // print("pass--------5------>${ box.get(passwordController.text.toString(),)}");
//
// }

// void userExists(String phone, String password) async {
//   User user = User(phone: phone, password: password);
//   DatabaseHelper dbHelper = DatabaseHelper();
//   var exist = await dbHelper.checkUser(user);
//   print(exist);
//
//
//   ///
//   if (exist == null || exist.length == 0 || exist == []) {
//     print("user doesn't exist");
//   }
//   else {
//     print("user exist");
//     print("amount------------>${user.amount}");
//     print("phone------------>${user.phone}");
//     setState(() {
//       _Users = exist;
//     });
//     print("-------Users---------${_Users}");
//
//    // print("id    ===========${_Users}");
//
//    _Users.forEach((element) async {
//
//      // print(element["id"].toString());
//     Amount=element["amount"].toString();
//     Phone=element["phone"].toString();
//
//     SessionHelper sessionHelper =await SessionHelper.getInstance(context);
//     sessionHelper.put(SessionHelper.AMOUNT,Amount.toString());
//     sessionHelper.put(SessionHelper.NUMBER,Phone.toString());
//     //
//       print("-------Amount--------${Amount.toString()}");
//       print("-------phone--------${Phone.toString()}");
//
//    });
//   //
//   //   print("id   ${exist[User.id.toInt()]}");
//   // print("phone   ${User.phone}");
//   // print("amount   ${User.amount}");
//
//   //
//   // Helper.moveToScreenwithPush(context, BottomScreen(phone: Phone,amt:Amount,));
//
//     // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
//     //     BottomScreen()), (Route<dynamic> route) => false);
//   }
// }
// void deleteUser(String phone, String password) async{
//   User user = User(phone: phone, password: password);
//   DatabaseHelper dbHelper = DatabaseHelper();
//   var exist = await dbHelper.deleteUser(user);
//   print(exist);
//   if(exist ==0){
//     print("user deleted");
//
//   }
//   else{
//     print("user exist");
//   }
//
// }
// void registerUser(String phone, String password) async {
//
//   print("----------------------registerUser-----${phone}, ${password}----------------------");
//
//
//   User user = User(phone: phone, password: password,amount: amt);
//
//   DatabaseHelper dbHelper = DatabaseHelper();
//
//   await dbHelper.insertUser(user);
//   //
//   // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
//   //     BottomScreen()), (Route<dynamic> route) => false);
//
//   print("-------------dbHelper---------------${dbHelper.db.toString()}");
// }
//
// void addColumn() async {
//
//
//
//   DatabaseHelper dbHelper = DatabaseHelper();
//
//   await dbHelper.addColumn();
//
// }
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
