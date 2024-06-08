#include <Arduino.h>
#include <ESP8266WiFi.h>
#include <FirebaseESP8266.h>

#define FIREBASE_HOST "esp-to-firebase-test-default-rtdb.firebaseio.com"
#define FIREBASE_AUTH "AIzaSyBhzvYTeSylVYEkpR9XrANH3yOwnobto3E"

#define USER_EMAIL "amrithanandini2003@gmail.com"
#define USER_PWD "plantpulse"
#define RELAY_PIN D1 // The ESP8266 pin connected to the IN pin of relay

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

  pinMode(RELAY_PIN, OUTPUT);
}


bool readMotorStatus() {
  if (Firebase.getBool(firebaseData, "/Motor")) {
    if (firebaseData.dataType() == "boolean") {
      return firebaseData.boolData();
    }
  } else {
    Serial.println("Failed to get motor status: " + firebaseData.errorReason());
  }
  return false; // default to off in case of error
}

// The loop function repeats indefinitely
void loop() {
  bool motorStatus = readMotorStatus();
  
  if (motorStatus) {
    digitalWrite(RELAY_PIN, LOW); // turn on pump (active-low relay)
    Serial.println("Motor is ON");
  } else {
    digitalWrite(RELAY_PIN, HIGH);  // turn off pump (active-low relay)
    Serial.println("Motor is OFF");
  }
  delay(4000); // check status every 4 seconds
}