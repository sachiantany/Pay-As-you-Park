import 'dart:convert';

import 'package:another_flushbar/flushbar_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pay_as_you_park/constants/strings.dart';
import 'package:pay_as_you_park/drawer/drawer.dart';
import 'package:pay_as_you_park/model/packages.dart';
import 'package:pay_as_you_park/model/subscription.dart';
import 'package:pay_as_you_park/services/subscription_service.dart';
import 'package:pay_as_you_park/store/driver/diver_store.dart';
import 'package:pay_as_you_park/utils/routes/routes.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:confirm_dialog/confirm_dialog.dart';


class PackagesScreen extends StatefulWidget {

  final DriverStore user;

  static const String routeName = '/packages';

  PackagesScreen({Key? key, required this.user}) : super(key: key);
  @override
  _PackagesScreenState createState() => _PackagesScreenState();
}

class _PackagesScreenState extends State<PackagesScreen> {

  List<Packages> listModel =  [];
  var loading = false;

  Future<Null> getData() async{
    setState(() {
      loading = true;
    });

    //final responseData = await SubscriptionService().getSubscriptionHistory(widget.user.userEmail);
    final responseData = await http.get(Uri.parse("https://pay-as-you-park-mobile-server.herokuapp.com/package/"));
    if(responseData!=null){
      print(responseData);
      final data = jsonDecode(responseData.body);
      print(data);
      setState(() {
        for(Map i in data){
          listModel.add(Packages.fromJson(i));
        }
        loading = false;
      });
    }
  }

  void _showToast(message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.SNACKBAR,
        timeInSecForIosWeb: 1);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: _buildAppBar(),
        drawer: GuestDrawer(user: widget.user),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Expanded(
                child: loading ? Center (child: CircularProgressIndicator()) : ListView.builder(
                    itemCount: listModel.length,
                    itemBuilder: (context, i){
                      final nDataList = listModel[i];
                      return Container(
                          child: InkWell(
                              onTap: () async {
                                  if(await confirm(
                                    context,
                                    title: Text("Confirm subscription"),
                                    content: Text("Confirm whether to active package"),
                                    textOK: Text("Confirm"),
                                    textCancel: Text("Cancel")
                                  )){
                                    await SubscriptionService().subscribe(widget.user.userEmail, nDataList.name, nDataList.minutes+nDataList.bonus, nDataList.price, nDataList.minutes+nDataList.bonus);
                                    _showSuccessMessage("Package Activated");
                                    return;
                                  }
                                  return print('cancel');
                              },
                              child: subscriptionCard(nDataList.name,nDataList.minutes,nDataList.price,nDataList.bonus)
                          )
                      );
                    })
            )
          ]),
        ));
  }

  Widget subscriptionCard(String packageName, int minutes, int price,int bonus){

    return new Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      elevation: 10.0,
      margin: EdgeInsets.all(15.0),

      child: new Container(
        padding:  new EdgeInsets.all(14.0),

        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: <Widget>[
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child:new Text(
                  packageName +' (Rs '+price.toString()+')',
                  style: new TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
                ),
              ],
            ),

            SizedBox(height: 10.0,),


            new Text(
              'Package Limit :'+minutes.toString() + ' minutes',
              style: new TextStyle(
                  fontSize: 15.0,
                  fontStyle: FontStyle.italic
              ),
              textAlign: TextAlign.center,
            ),

            SizedBox(height: 10.0,),

            new Text(
              'Bonus :'+bonus.toString() + ' minutes',
              style: new TextStyle(
                  fontSize: 15.0,
                  fontStyle: FontStyle.italic
              ),
              textAlign: TextAlign.center,
            ),


          ],
        ),
      ),
    );
  }


  // app bar methods:-----------------------------------------------------------
  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: Text('Packages'),
      actions: _buildActions(context),
    );
  }

  List<Widget> _buildActions(BuildContext context) {
    return <Widget>[
      _buildLogoutButton(),
    ];
  }

  Widget _buildLogoutButton() {
    return IconButton(
      onPressed: () {
        Navigator.of(context).pushReplacementNamed(Routes.login);
      },
      icon: Icon(
        Icons.power_settings_new,
      ),
    );
  }

  _showSuccessMessage(String message) {
    if (message.isNotEmpty) {
      Future.delayed(Duration(milliseconds: 0), () {
        if (message.isNotEmpty) {
          FlushbarHelper.createSuccess(
            message: message,
            title: message,
            duration: Duration(seconds: 3),
          )
            ..show(context);
        }
      });
    }

    return SizedBox.shrink();
  }
}
