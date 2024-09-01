import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:loop/controller/auth_controller.dart';

// Primary app color: A bold, attention-grabbing purple
const Color kPrimaryColor = Color(0xFF8E44AD);

// Background color: A dark theme for better video viewing
const Color kBackgroundColor = Color(0xFF121212);

// Accent colors
const Color kAccentColor1 = Color(0xFF1ABC9C); // Turquoise for interactions
const Color kAccentColor2 = Color(0xFFE74C3C); // Red for notifications/likes

// Text colors
const Color kTextColorPrimary = Color(0xFFFFFFFF); // White for primary text
const Color kTextColorSecondary = Color(0xFFBDBDBD); // Light gray for secondary text

// UI element colors
const Color kIconColorActive = Color(0xFFFFA500);   // Orange for active icons
const Color kIconColorInactive = Color(0xFF757575); // Gray for inactive icons

// Overlay color for video controls
const Color kVideoOverlayColor = Color(0x66000000); // Semi-transparent black
//Firebase
final firebaseAuth = FirebaseAuth.instance;
final firebaseStorage = FirebaseStorage.instance;
final firebaseFireStore = FirebaseFirestore.instance;
//get
final authController = AuthController.instance;