import 'package:shared_preferences/shared_preferences.dart';

class OnboardingService {


  static const String onboardingKey = 'isOnboardingCompleted';

  // Set onboarding completed
  static Future<void> setOnboardingCompleted() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(onboardingKey, true);
  }

  // Check if onboarding is completed
  static Future<bool> isOnboardingCompleted() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(onboardingKey) ?? false; // Default to false
  }
}