# fertilizer_recommendation_system
## Abstract
This project aims to create a system utilizing Internet of Things (IoT) devices that will assist farmers in monitoring soil data to optimize their crop yields. By utilizing IoT devices, farmers can obtain real-time data on soil moisture, pH levels, and nutrient content. This data will be processed through the system to recommend crops and fertilizers that are best suited for the specific soil conditions. This will allow farmers to make informed decisions about their crops and increase their productivity while reducing waste. Overall, this system has the potential to revolutionize the agricultural industry by improving crop yields and reducing the environmental impact of farming practices.

## Getting Started
### Prerequisites
- Android Studio
- Java
- Gradle
- Dart
- Flutter
- Firebase CLI
- Flask

Check https://docs.flutter.dev/get-started/install/linux for flutter installation.
Check https://dart.dev/get-dart for dart installation.

### Installation
- Installing Android Studio and Java
```
sudo apt update
sudo apt install openjdk -11 - jdk
java -- version
sudo snap install android - studio -- classic
```
- Installing Flutter
```
  sudo apt update
  sudo apt upgrade
  sudo apt install snap
  sudo snap install flutter -- classic
  nano ~/ bashrc
  // add the flutter environmental variables
  export PATH =" $PATH : ‘ pwd ‘/ flutter / bin "
  source ~/ bashrc
  flutter -- version
  flutter doctor
```
- Installing Dart
```
sudo apt - get update
sudo apt - get install apt - transport - https
wget -qO - https :// dl - ssl . google . com / linux /
linux_signing_key . pub | sudo gpg -- dearmor -o / usr / share / keyrings / dart . gpg

echo ’ deb [ signed - by =/ usr / share / keyrings / dart . gpg arch = amd64 ] https :// storage . googleapis . com / download . dartlang . org / linux / debian stable main ’ | sudo tee / etc / apt / sources . list . d / dart_stable . list

sudo apt - get update
sudo apt - get install dart
nano ~/ bashrc
export PATH =" $PATH :/ usr / lib / dart / bin "
source ~/ bashrc
```
- Installing Firebase CLI and Connecting Flutter with Firebase project
```
// Now navigate to the flutter project using cd <project - name >
// Installing Firebase CLI and Connecting Flutter project with // the project created in Firebase Console
flutter pub add firebase_core
dart pub global activate flutterfire_cli
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
sudo apt install curl
curl - sL https :// firebase . tools | bash
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
firebase login
flutterfire configure
// create a project in firebase by give < project name >
```

## Running the project
1. Clone this repository.
2. Navigate to the directory and follow the steps below to run the flutter code and flask code:
```
// To run flutter code
cd fertilizer_recommendation_system
flutter run

// To run Flask Server(the actual recommendation part of the application navigate to the Server.py and run it)
/home/usman619/anaconda3/bin/python server.py
 * Serving Flask app 'server'
 * Debug mode: off
WARNING: This is a development server. Do not use it in a production deployment. Use a production WSGI server instead.
 * Running on all addresses (0.0.0.0)
 * Running on http://127.0.0.1:5000
 * Running on http://192.168.100.16:5000
Press CTRL+C to quit
{'N': '90', 'P': '42', 'K': '43', 'temp': '20', 'humidity': '82', 'ph': '6.5', 'rainfall': '203'}
convert to float {'N': 90.0, 'P': 42.0, 'K': 43.0, 'temp': 20.0, 'humidity': 82.0, 'ph': 6.5, 'rainfall': 203.0}
/home/usman619/anaconda3/lib/python3.11/site-packages/sklearn/base.py:465: UserWarning: X does not have valid feature names, but DecisionTreeClassifier was fitted with feature names
  warnings.warn(
Prediction: ['rice']
```
