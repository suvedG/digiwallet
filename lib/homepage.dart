import 'package:configcat_client/configcat_client.dart';
import 'package:dwalletdemo/dialogs.dart';
import 'package:dwalletdemo/main.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  
  late ConfigCatClient client;

  late RefreshController _refreshController;
  //Boolean for List of Services
  late bool electricity;
  late bool flight;
  late bool insurance;
  late bool topup;

  @override
  void initState() {
    _refreshController = RefreshController(initialRefresh: false);
    client = getit<ConfigCatClient>();
    getValues();
    super.initState();
  }

  _onRefresh()async{
    await Future.delayed(const Duration(milliseconds: 1000));
    getValues();
    _refreshController.refreshCompleted();
  }

  getValues() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    electricity =
        await client.getValue(key: 'electricityToggle', defaultValue: false);
    flight = await client.getValue(key: 'flightToggle', defaultValue: false);
    insurance =
        await client.getValue(key: 'insuranceToggle', defaultValue: false);
    topup = await client.getValue(key: 'topupToggle', defaultValue: false);
    if(mounted) setState(() {});
    _refreshController.loadComplete();
    
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text("Digi Wallet"),
        ),
        body: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 50,
                      width: size.width,
                      color: Colors.teal[900],
                      child: const Center(
                        child: Text(
                          "Pay Utilities",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: SmartRefresher(
                      enablePullDown: true,
                      header: const WaterDropHeader(waterDropColor: Colors.teal,),
                      controller: _refreshController,
                      onLoading: getValues,
                      onRefresh: _onRefresh,
                      child: GridView.count(
                        shrinkWrap: true,
                        crossAxisCount: 3,
                        padding: const EdgeInsets.all(5),
                        children: [
                          InkWell(
                              onTap: () {
                                electricity==false?  Dialogs.showTop(
                                      context: context,
                                      message:
                                          "Service Temporarily Disabled"):
                                  Dialogs.showDiag(
                                    context: context, title: "Electricity Bill",
                                    field1: "Customer ID",
                                    field2: "Enter Your Customer ID",
                                    field3: "Amount",
                                    field4: "Enter Your Due Amount");
                                
                              },
                              child: const GridTile(
                                footer: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    "Electricity",
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                child: Icon(
                                  Icons.power,
                                  color: Colors.black,
                                  size: 35,
                                ),
                              )),
                          InkWell(
                              onTap: () {
                               flight==false? Dialogs.showTop(
                                      context: context,
                                      message:
                                          "Service Temporarily Disabled"):
                                          Dialogs.showFlightDiag(
                                    context: context, title: "Book Flight",
                                    field1: "From",
                                    field2: "Enter Your Departure Location",
                                    field3: "To",
                                    field4: "Enter Your Destination",
                                    field5: "Date",
                                    field6: "Enter Your Travel Date");
                              },
                              child: const GridTile(
                                footer: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    "Flight",
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                child: Icon(
                                  Icons.flight_sharp,
                                  color: Colors.black,
                                  size: 35,
                                ),
                              )),
                          InkWell(
                              onTap: () {
                                insurance==false?  Dialogs.showTop(
                                      context: context,
                                      message:
                                          "Service Temporarily Disabled"):
                                  Dialogs.showDiag(
                                    context: context, title: "Electricity Bill",
                                    field1: "Insurance ID",
                                    field2: "Enter Your Policy ID",
                                    field3: "Amount",
                                    field4: "Enter Your Due Amount");
                              },
                              child: const GridTile(
                                footer: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    "Insurance",
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                child: Icon(
                                  Icons.security,
                                  color: Colors.black,
                                  size: 35,
                                ),
                              )),
                          InkWell(
                              onTap: () {
                                topup==false?  Dialogs.showTop(
                                      context: context,
                                      message:
                                          "Service Temporarily Disabled"):
                                  Dialogs.showDiag(
                                    context: context, title: "Topup",
                                    field1: "Wallet ID",
                                    field2: "Enter Your Wallet ID",
                                    field3: "Amount",
                                    field4: "Enter Your Topup Amount");
                              },
                              child: const GridTile(
                                footer: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    "Topup",
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                child: Icon(
                                  Icons.account_balance_wallet_rounded,
                                  color: Colors.black,
                                  size: 35,
                                ),
                              )),
                        ],
                      ),
                    ),
                  ),
                ],
              ));
  }
}
