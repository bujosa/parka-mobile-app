import 'package:ParkA/components/SearchBar/search_bar.dart';
import 'package:ParkA/pages/Search/search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DummySearch extends StatelessWidget {
  const DummySearch({Key key, this.buttonToggle}) : super(key: key);

  final VoidCallback buttonToggle;

  @override
  Widget build(BuildContext context) {
    Size currentScreen = MediaQuery.of(context).size;
    return Container(
      child: GestureDetector(
        child: SearchBar(
          hintText: "Buscar...",
          height: currentScreen.height * 0.05,
          enabled: false,
        ),
        onTap: () async {
          buttonToggle();
          var bottomSheetController =
              Scaffold.of(context).showBottomSheet((context) => SearchPage());
          await bottomSheetController.closed;
          buttonToggle();
        },
      ),
    );
  }
}