import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:querium/src/Features/AccountFeature/UI/screens/profile_screen.dart';
import 'package:querium/src/Features/HomeFeature/UI/screens/home_screen.dart';
import 'package:querium/src/Features/UploadPDFFeature/UI/screens/upload_pdf_screen.dart';

class AdminBaseModel {
  final int id;
  final String title;
  final String selectedIcon;
  final Widget child;
  bool active;

  AdminBaseModel({
    required this.id,
    required this.child,
    required this.title,
    required this.selectedIcon,
    this.active = false,
  });
}

List<AdminBaseModel> adminBaseModels = [
  AdminBaseModel(
    id: 0,
    title: "",
    selectedIcon: 'Home',
    child: const HomeScreen(),
  ),
  AdminBaseModel(
    id: 1,
    title: "",
    selectedIcon: 'UploadPDF',
    child: const UploadPDFScreen(),
  ),
  AdminBaseModel(
    id: 2,
    title: "",
    selectedIcon: 'Favorite',
    child: const SizedBox(),
  ),
  AdminBaseModel(
    id: 3,
    title: "",
    selectedIcon: 'Profile',
    child: const ProfileScreen(),
  )
];
