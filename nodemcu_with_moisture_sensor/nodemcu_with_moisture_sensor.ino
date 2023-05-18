#include <ESP8266WiFi.h>
#include <FirebaseESP8266.h>

// Enter your own WiFi network credentials
// Enter your own WiFi network credentials
const char* ssid = "PTCL-17";
const char* password = "894dd4bc";

// Enter your own Firebase project credentials
#define FIREBASE_HOST "testingmoisturedata-default-rtdb.firebaseio.com"
#define FIREBASE_AUTH "rzxqC7cS0OLNVj4pptp9qqHUXpArNKDLcU2CrSEj"

// Pin connected to the moisture sensor
const int moistureSensorPin = A0;

// Firebase database path for storing moisture data
const String moistureDataPath = "/moistureData";

void setup() {
  Serial.begin(9600);
  delay(10);

  // Connect to WiFi network
  Serial.println();
  Serial.print("Connecting to ");
  Serial.println(ssid);
  WiFi.begin(ssid, password);

  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }

  Serial.println("");
  Serial.println("WiFi connected");
  Serial.println("IP address: ");
  Serial.println(WiFi.localIP());

  // Initialize Firebase
  Firebase.begin(FIREBASE_HOST, FIREBASE_AUTH);
}

void loop() {
  // Read sensor data from the moisture sensor
  int sensorValue = analogRead(moistureSensorPin);

  // Map the sensor value to a range (0-100) representing moisture percentage
  int moisturePercentage = map(sensorValue, 0, 1023, 0, 100);

  // Print the moisture percentage value
  Serial.print("Moisture Percentage: ");
  Serial.print(moisturePercentage);
  Serial.println("%");

  // Store the moisture data in Firebase
  Firebase.setInt(moistureDataPath, moisturePercentage);

  // Wait for some time before reading and uploading data again
  delay(1000);
}
