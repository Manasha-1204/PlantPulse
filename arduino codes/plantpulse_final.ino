#include <Arduino.h>
#include <ESP8266WiFi.h>
#include <FirebaseESP8266.h>
#include <DHT.h>

#define AOUT_PIN A0 
const int minMoistureValue = 0;    // Analog reading for very wet soil
const int maxMoistureValue = 1023; // Analog reading for very dry soil

#define RELAY_PIN D1 // The ESP8266 pin connected to the IN pin of relay
#define DHTPIN 4  // Pin connected to the DHT11 data pin
#define DHTTYPE DHT11 
DHT dht(DHTPIN, DHTTYPE);

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

  pinMode(RELAY_PIN, OUTPUT);
  digitalWrite(RELAY_PIN, HIGH);  // turn off pump (active-low relay)
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

void sendSoilMoistureData(){
  int sensorValue = analogRead(AOUT_PIN); // Read the analog value from sensor
  
  // Map the sensor value to a percentage (0% to 100%)
  int moisturePercent = map(sensorValue, minMoistureValue, maxMoistureValue, 100, 0);

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
}

void sendDHTdata(){
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


void loop() {
  sendDHTdata();
  sendSoilMoistureData();
  bool motorStatus = readMotorStatus();
  
  if (motorStatus) {
    digitalWrite(RELAY_PIN, LOW); // turn on pump (active-low relay)
  } else {
    digitalWrite(RELAY_PIN, HIGH);  // turn off pump (active-low relay)
  }
  delay(2000); // check status every 2 seconds
}