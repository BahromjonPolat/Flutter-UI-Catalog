import 'package:flutter/material.dart';

Drawer _telegramDrawer() => Drawer(
      child: ListView(
        children: [
          /// Telegram Drawer user haqida ma'lumotni ko`rsatadigan tepa qismi
          _drawerHeader(),

          /// Menular qismi
          _setCategory("New Group", Icons.group_outlined),
          _setCategory("New Secret Chat", Icons.lock_outline),
          _setCategory("New Channel", Icons.campaign_outlined),
          _setDivider(),
          _setCategory("Contacts", Icons.person_outline_outlined),
          _setCategory("Folders", Icons.folder_outlined),
          _setCategory("People Neraby", Icons.location_on_outlined),
          _setCategory("Saved Messages", Icons.bookmark_border),
          _setCategory("Calls Messages", Icons.local_phone_outlined),
          _setCategory("Settings", Icons.settings_suggest_outlined),
          _setDivider(),
          _setCategory("Plus Settings", Icons.add_circle_outline_rounded),
          _setCategory("Categories", Icons.folder_open_outlined),
          _setCategory("Invite friends", Icons.person_add_alt),
        ],
      ),
    );

Drawer get telegramDrawer => _telegramDrawer();

Divider _setDivider() => Divider();

UserAccountsDrawerHeader _drawerHeader() => UserAccountsDrawerHeader(
      accountName: Text("Bahromjon"),
      accountEmail: Text("+998931881333"),
      currentAccountPicture: CircleAvatar(
        backgroundImage: AssetImage("assets/images/logo.jpg"),
      ),
      decoration: BoxDecoration(color: Colors.teal),
      otherAccountsPictures: [
        CircleAvatar(
          child: Icon(
            Icons.dark_mode,
            color: Colors.white,
          ),
          backgroundColor: Colors.transparent,
        )
      ],
    );

ListTile _setCategory(String title, IconData icon) => ListTile(
      leading: Icon(
        icon,
        color: Colors.teal,
      ),
      title: Text(title),
      onTap: () {},
    );
