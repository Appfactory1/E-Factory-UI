import 'package:app_shoe_shop/models/history_model.dart';
import 'package:app_shoe_shop/pages/progress_tracking.dart';
import 'package:app_shoe_shop/widgets/Drawer.dart';
import 'package:flutter/material.dart';

class History extends StatefulWidget {
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  List<HistoryCard> historyList = HistoryCard.historyList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,

        // leading: Icon(
        //   FlutterIcons.menu,
        //   color: Colors.black,
        // ),
      ),
      drawer: MyDrawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            Text(
              "History",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 4,
                    childAspectRatio: 0.78),
                itemCount: historyList.length,
                primary: false,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                      child: _buildCard(
                          historyList[index].name,
                          historyList[index].status,
                          historyList[index].image,
                          historyList[index].stages,
                          historyList[index].price,
                          index));
                }),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(String name, String status, String image, List stages,
      double price, int cardIndex) {
    return Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        elevation: 7.0,
        child: Column(
          children: <Widget>[
            price == null ? SizedBox(height: 20) : SizedBox(height: 13.0),
            Stack(children: <Widget>[
              Container(
                height: 70.0,
                width: 70.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40.0),
                    color: Colors.green,
                    image: DecorationImage(
                        image: AssetImage("assets/${image}"),
                        fit: BoxFit.cover)),
              ),
            ]),
            price == null ? SizedBox(height: 16) : SizedBox(height: 10.0),
            Text(
              name,
              style: TextStyle(
                fontFamily: 'Quicksand',
                fontWeight: FontWeight.bold,
                fontSize: 17.0,
              ),
            ),
            price == null ? SizedBox(height: 5) : SizedBox(height: 2),
            Text(status,
                style: TextStyle(
                  fontFamily: 'Quicksand',
                  fontWeight: FontWeight.bold,
                  fontSize: 12.0,
                  color: status == 'Active'
                      ? Colors.blue[200]
                      : status == 'Completed' ? Colors.green : Colors.grey,
                )),
            price == null ? Container() : SizedBox(height: 5),
            price == null
                ? Container()
                : Text(
                    'RS ${price.toString()}',
                    style: TextStyle(
                        fontFamily: 'Quicksand',
                        fontWeight: FontWeight.bold,
                        fontSize: 17.0,
                        color: Colors.green),
                  ),
            price == null ? SizedBox(height: 15) : SizedBox(height: 10),
            Expanded(
                child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => ProgressTrack(status: status, stages: stages),
                ));
              },
              child: Container(
                width: 175.0,
                decoration: BoxDecoration(
                  color: status == 'Active' ? Colors.green : Colors.grey,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10.0),
                      bottomRight: Radius.circular(10.0)),
                ),
                child: Center(
                  child: Text(
                    'Track Order',
                    style:
                        TextStyle(color: Colors.white, fontFamily: 'Quicksand'),
                  ),
                ),
              ),
            )),
          ],
        ),
        margin: cardIndex.isEven
            ? EdgeInsets.fromLTRB(0, 0.0, 5.0, 10.0)
            : EdgeInsets.fromLTRB(5.0, 0.0, 0, 10.0));
  }
}
