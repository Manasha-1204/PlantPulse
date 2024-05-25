#include <Arduino.h>
#include <ESP8266WiFi.h>
#include <FirebaseESP8266.h>
#include <DHT.h>

// Set these to run your project
#define FIREBASE_HOST "esp-to-firebase-test-default-rtdb.firebaseio.com"
#define FIREBASE_AUTH "AIzaSyBhzvYTeSylVYEkpR9XrANH3yOwnobto3E"

#define USER_EMAIL "amrithanandini2003@gmail.com"
#define USER_PWD "plantpulse"
#define DHTPIN 4  // Set the pin connected to the DHT11 data pin
#define DHTTYPE DHT11 // DHT 11 

DHT dht(DHTPIN, DHTTYPE);
const char* WIFI_SSID = "laptop";
const char* WIFI_PASSWORD = "abcdefgh";

FirebaseData firebaseData;
FirebaseAuth firebaseAuth;
FirebaseConfig firebaseConfig;

void setup() {
  Serial.begin(115200);
  WiFi.mode(WIFI_STA);
  WiFi.disconnect();
  dht.begin();  // Reads DHT sensor data

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
  delay(600000); // Delay for 600,000 milliseconds (10 minutes)

  // Reading temperature or humidity takes about 250 milliseconds!
  // Sensor readings may also be up to 2 seconds 'old' (it's a very slow sensor)
  float humidity = dht.readHumidity();
  float temperature = dht.readTemperature();

  // Check if any reads failed and exit early (to try again)
  if (isnan(humidity) || isnan(temperature)) {
    Serial.println("Failed to read from DHT sensor!");
    return;
  }

  // Print the humidity and temperature
  Serial.print("Humidity: ");
  Serial.print(humidity);
  Serial.print(" %\t");
  Serial.print("Temperature: ");
  Serial.print(temperature);
  Serial.println(" *C");

  // Push data to Firebase
  if (Firebase.setFloat(firebaseData, "/DHT11/Humidity", humidity)) {
    Serial.println("Humidity data sent successfully");
  } else {
    Serial.print("Failed to send humidity data: ");
    Serial.println(firebaseData.errorReason());
  }

  if (Firebase.setFloat(firebaseData, "/DHT11/Temperature", temperature)) {
    Serial.println("Temperature data sent successfully");
  } else {
    Serial.print("Failed to send temperature data: ");
    Serial.println(firebaseData.errorReason());
  }
}