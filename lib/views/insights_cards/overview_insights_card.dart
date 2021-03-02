import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ofa_v0/views/insights_cards/insight.dart';
import 'package:ofa_v0/views/loadingjson.dart';

class OverviewInsightCard extends InsightsCard {
  final String insightKey = "overview-insight";
  final InsightsArguments insightsArguments;

  OverviewInsightCard(this.insightsArguments);

  @override
  Widget build(BuildContext context) {
    var data = this.insightsArguments.insights.getInsight(insightKey);
    List<Map<String, dynamic>> apps =
        data["apps"] as List<Map<String, dynamic>>;
    //TODO Let the tile take up the whole screen when expanded (user should still be able to scroll to other tiles) and collapse other tiles
    return Theme(
      data: Theme.of(context).copyWith(
          unselectedWidgetColor: Colors.white, accentColor: Colors.white),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: ListTileTheme(
          dense: true, //TODO See if this needs to be here
          contentPadding: EdgeInsets.symmetric(horizontal: 4),
          child: ExpansionTile(
            title: Text(
              "Apps that share your information (${apps.length})",
              style: TextStyle(color: Colors.white),
            ),
            children: <Widget>[
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: (apps.length > 2) ? apps.length - 2 : 0,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 4),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          border: Border.all(
                            color: Colors.white,
                            width: 1,
                          )),
                      child: ListTile(
                        leading: Image(
                          image: AssetImage('assets/images/3_todo.png'),
                          width: 44,
                          height: 44,
                        ),
                        title: Text(
                          apps[index]["name"],
                          style: TextStyle(color: Colors.white),
                        ),
                        subtitle: Text(
                          apps[index]["count"].toString() + ' Events',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
