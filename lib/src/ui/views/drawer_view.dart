import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:optical_label_manager/src/ui/pages/create-my-qr_page.dart';

class DrawerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top
      ),

      child: Drawer(child: SingleChildScrollView(
        child: Column(children: [
          _DrawerListTile(
            title: 'Scan',
            icon: CupertinoIcons.viewfinder,
          ),

          _DrawerListTile(
            title: 'Scan Image',
            icon: CupertinoIcons.doc_richtext,
          ),

          _DrawerListTile(
            title: 'Favorites',
            icon: CupertinoIcons.heart,
          ),

          _DrawerListTile(
            title: 'History',
            icon: Icons.history,
          ),

          _DrawerListTile(
            title: 'My QR',
            icon: CupertinoIcons.qrcode,
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => CreateMyQrPage()
            )),
          ),

          _DrawerListTile(
            title: 'Create QR',
            icon: CupertinoIcons.barcode,
          ),

          _DrawerListTile(
            title: 'Settings',
            icon: Icons.settings,
          ),

          _DrawerListTile(
            title: 'Share',
            icon: Icons.share,
          )
        ]),
      )),
    );
  }
}

class _DrawerListTile extends InkWell {
  _DrawerListTile({
    String title,
    IconData icon,
    Function onTap
  }): super(
    child: Container(
      padding: const EdgeInsets.fromLTRB(15, 13, 0, 13),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade300),
        )
      ),
      child: Row(children: [
        Icon(icon, color: Colors.grey),
        SizedBox(width: 15),
        Text(title, style: TextStyle(fontSize: 15))
      ]),
    ),
    onTap: onTap
  );
}
