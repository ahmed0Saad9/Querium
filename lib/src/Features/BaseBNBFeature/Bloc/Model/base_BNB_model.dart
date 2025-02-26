import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:querium/src/Features/AccountFeature/UI/screens/profile_screen.dart';
import 'package:querium/src/Features/FavoriteFeature/UI/screens/favorite_screen.dart';
import 'package:querium/src/Features/HomeFeature/UI/screens/home_screen.dart';
import 'package:querium/src/Features/UploadPDFFeature/UI/screens/upload_pdf_screen.dart';

class AdminBaseModel {
  final int id;
  final String title;
  final String icon;
  final Widget child;

  AdminBaseModel({
    required this.id,
    required this.child,
    required this.title,
    required this.icon,
  });
}

List<AdminBaseModel> adminBaseModels = [
  AdminBaseModel(
    id: 0,
    title: "Home",
    icon: 'Home',
    child: const HomeScreen(),
  ),
  AdminBaseModel(
    id: 1,
    title: "Upload",
    icon: 'UploadPDF',
    child: const UploadPDFScreen(),
  ),
  AdminBaseModel(
    id: 2,
    title: "Favorite",
    icon: 'Favorite',
    child: const FavoriteScreen(),
  ),
  AdminBaseModel(
    id: 3,
    title: "Profile",
    icon: 'Profile',
    child: const ProfileScreen(),
  )
];
