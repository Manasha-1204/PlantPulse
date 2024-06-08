#include <ESP8266WiFi.h>
#include <FirebaseESP8266.h>

#define AOUT_PIN A0 
const int minMoistureValue = 0;    // Analog reading for very wet soil
const int maxMoistureValue = 1023; // Analog reading for very dry soil

#define FIREBASE_HOST "esp-to-firebase-test-default-rtdb.firebaseio.com"
#define FIREBASE_AUTH "AIzaSyBhzvYTeSylVYEkpR9XrANH3yOwnobto3E"

#define USER_EMAIL "amrithanandini2003@gmail.com"
#define USER_PWD "plantpulse"
const char* WIFI_SSID = "laptop";
const char* WIFI_PASSWORD = "abcdefgh";

FirebaseData firebaseData;
FirebaseAuth firebaseAuth;
FirebaseConfig firebaseConfig;

void setup() {
  Serial.begin(115200);
  WiFi.mode(WIFI_STA);
  WiFi.disconnect();

  // Connect to Wi-Fi
  WiFi.begin(WIFI_SSID, WIFI_PASSWORD);
  Serial.print("Connecting to ");
  Serial.print(WIFI_SSID);
  while (WiFi.status() != WL_CONNECTED) {
    Serial.print(".");
    delay(500);
  }
  Serial.println();
  Serial.print("Connected, IP Address: ");
  Serial.println(WiFi.localIP());

  // Configure Firebase
  firebaseConfig.database_url = FIREBASE_HOST;
  firebaseConfig.api_key = FIREBASE_AUTH;

  // User sign in
  firebaseAuth.user.email = USER_EMAIL;
  firebaseAuth.user.password = USER_PWD;
  
  // Uncomment the line below if you want to see Firebase debugging info
  // firebaseConfig.debug = true;

  Firebase.begin(&firebaseConfig, &firebaseAuth);
  Firebase.reconnectWiFi(true);
}

void loop() {
  int sensorValue = analogRead(AOUT_PIN); // Read the analog value from sensor
  
  // Map the sensor value to a percentage (0% to 100%)
  int moisturePercent = map(sensorValue, minMoistureValue, maxMoistureValue, 0, 100);

  Serial.print("Moisture: ");
  Serial.print(sensorValue);
  Serial.print(" -> ");
  Serial.print(moisturePercent);
  Serial.println("%");

  if (Firebase.setInt(firebaseData, "/SoilMoisture", moisturePercent)) {
    Serial.println("Soil Moisture data sent successfully");
  } else {
    Serial.print("Failed to send soil moisture data: ");
    Serial.println(firebaseData.errorReason());
  }

  delay(5000);
}
