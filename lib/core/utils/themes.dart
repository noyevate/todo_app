import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/colors.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.lightBackground,
    brightness: Brightness.light,
    textTheme: const TextTheme(
          displayLarge: TextStyle(
            color: Colors.black,
            fontSize: 45,
            fontWeight: FontWeight.bold,
            fontFamily: 'Metropolis'
          ),
          titleMedium: TextStyle(
            color: Colors.grey,
            fontSize: 16,
            fontWeight: FontWeight.w300,
            fontFamily: 'Metropolis'
          ),
          displayMedium: TextStyle(
            color: Colors.white,
            fontSize: 21,
            fontFamily: 'Metropolis'
          ),
          displaySmall: TextStyle(
            color: Color.fromARGB(255, 234, 234, 234),
            fontSize: 14,
            
            fontWeight: FontWeight.w400,
            fontFamily: 'Metropolis'
          ),
          headlineMedium: TextStyle(
            color: Colors.grey,
            fontSize: 15,
            fontFamily: 'Metropolis'
          ),
          headlineSmall: TextStyle(
            color: Colors.grey,
            fontSize: 12,
            fontFamily: 'Metropolis'
          ),
          titleSmall: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontFamily: 'Metropolis'
          ),
          titleLarge: TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.w300,
            fontFamily: 'Metropolis'
          ),
        ),
      );
  

  static final darkTheme = ThemeData(
    primaryColor: AppColors.primaryColor,
    
    scaffoldBackgroundColor: AppColors.darkBackground,
    brightness: Brightness.dark,
    textTheme: const TextTheme(
          displayLarge: TextStyle(
            color: Colors.grey,
            fontSize: 45,
            fontWeight: FontWeight.bold,
            fontFamily: 'Metropolis'
          ),
          titleMedium: TextStyle(
            color: Colors.grey,
            fontSize: 16,
            fontWeight: FontWeight.w300,
            fontFamily: 'Metropolis'
          ),
          displayMedium: TextStyle(
            color: Colors.white,
            fontSize: 21,
            fontFamily: 'Metropolis'
          ),
          displaySmall: TextStyle(
            color: Color.fromARGB(255, 234, 234, 234),
            fontSize: 14,
            
            fontWeight: FontWeight.w400,
            fontFamily: 'Metropolis'
          ),
          headlineMedium: TextStyle(
            color: Colors.grey,
            fontSize: 15,
            fontFamily: 'Metropolis'
          ),
          headlineSmall: TextStyle(
            color: Colors.grey,
            fontSize: 12,
            fontFamily: 'Metropolis'
          ),
          titleSmall: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontFamily: 'Metropolis'
          ),
          titleLarge: TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.w300,
            fontFamily: 'Metropolis'
          ),
        ),
      );
  
}