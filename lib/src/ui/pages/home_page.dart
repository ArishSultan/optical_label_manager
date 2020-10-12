import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:optical_label_manager/src/ui/pages/create-optical-label_page.dart';
import 'package:optical_label_manager/src/ui/views/favorites_view.dart';
import 'package:optical_label_manager/src/ui/views/history_view.dart';
import 'package:optical_label_manager/src/ui/views/scanner_view.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    ScannerView(),
    FavoritesView(),
    Text(''),
    // HistoryPage(),
    HistoryView(),
    ScannerView()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: _widgetOptions.elementAt(_currentIndex),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
          child: Icon(CupertinoIcons.add),
          onPressed: () {
            Navigator.of(context).push(CupertinoPageRoute(
                builder: (context) => CreateOpticalLabelPage(),
                fullscreenDialog: true));
          } // => navigateTo(context, CreateOpticalLabelPage())
          ),
      bottomNavigationBar: BottomAppBar(
        notchMargin: 10,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: CircularNotchedRectangle(),
        child: CupertinoTabBar(
          currentIndex: _currentIndex,
          onTap: (index) => setState(() => _currentIndex = index),
          backgroundColor: Theme.of(context).brightness == Brightness.dark
              ? CupertinoColors.darkBackgroundGray
              : null,
          items: [
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.viewfinder)),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.heart),
                activeIcon: Icon(CupertinoIcons.heart_fill)),
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.add, size: 0)),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.square_favorites)),
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.settings))
          ],
        ),
      ),
    );

    return Stack(children: [
      CupertinoTabScaffold(
        backgroundColor: CupertinoColors.tertiarySystemFill,
        tabBar: _CustomBottomBar(),
        tabBuilder: (BuildContext context, int index) {
          return ScannerView();
        },
      ),
      Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: FloatingActionButton(
            onPressed: () {},
            child: Text('a'),
          ),
        ),
      )
    ]);

    // return Scaffold(
    //   drawer: DrawerView(),
    //   body: ScannerView(),
    //
    //   extendBody: true,
    //   floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    //   floatingActionButton: SizedBox(
    //     width: 56, height: 56,
    //     child: Tooltip(
    //       message: 'Create new Optical Label',
    //       child: FlatButton(
    //         shape: CircleBorder(),
    //         textColor: Colors.white,
    //         child: Icon(CupertinoIcons.add),
    //         color: Theme.of(context).primaryColor,
    //         onPressed: () {
    //           showModalBottomSheet(
    //             context: context,
    //             shape: RoundedRectangleBorder(
    //               borderRadius: BorderRadius.only(
    //                 topLeft: Radius.circular(20),
    //                 topRight: Radius.circular(20)
    //               )
    //             ),
    //             clipBehavior: Clip.antiAlias,
    //             builder: (context) => CreateOpticalLabelBottomSheet()
    //           );
    //         }
    //       ),
    //     ),
    //   ),
    //   bottomNavigationBar: BottomAppBar(
    //     elevation: 5,
    //     notchMargin: 7,
    //     clipBehavior: Clip.antiAliasWithSaveLayer,
    //     shape: CircularNotchedRectangle(),
    //
    //   ),
    // );
  }
}

class _CustomBottomBar extends CupertinoTabBar {
  _CustomBottomBar()
      : super(items: [
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.viewfinder)),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.heart)),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.add, size: 0)),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.square_favorites)),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.settings))
        ]);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
        notchMargin: 100,
        clipBehavior: Clip.antiAlias,
        shape: CircularNotchedRectangle(),
        child: super.build(context));
  }
}
