import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:planto/Model/diseaseProvider.dart';
import 'package:planto/widgets/planto_bar.dart';
import 'package:planto/widgets/recent_item.dart';
import 'package:provider/provider.dart';

class RecentSearch extends StatefulWidget {
  @override
  _RecentSearchState createState() => _RecentSearchState();
}

class _RecentSearchState extends State<RecentSearch> {
  var _isInit = true;
  var _isloading = false;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isloading = true;
      });
      Provider.of<Disease>(context).findRecentSearch().then((_) {
        _isloading = false;
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final diseaseData = Provider.of<Disease>(context);
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60), child: PlantoBar()),
      body: _isloading
          ? Center(
              child: CupertinoActivityIndicator(),
            )
          : Padding(
              padding: EdgeInsets.only(top: 5, left: 10, right: 10),
              child: GridView.builder(
                itemCount: diseaseData.diseases.length,
                itemBuilder: (_, i) => Column(
                  children: [
                    RecentItem(diseaseData.diseases[i].name.toString()),
                  ],
                ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.5 / 1.5,
                    crossAxisSpacing: 30,
                    mainAxisSpacing: 0),
              ),
            ),
    );
  }
}
