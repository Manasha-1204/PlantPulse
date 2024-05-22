#include <ESP8266WiFi.h>

const char* WIFI_SSID = "laptop";
const char* WIFI_PASSWORD = "abcdefgh";

void setup() {
  Serial.begin(115200);
  WiFi.mode(WIFI_STA);
  WiFi.disconnect();
  delay(100);

  // Connect to Wi-Fi
  WiFi.begin(WIFI_SSID, WIFI_PASSWORD);
  Serial.print("Connecting to ");
  Serial.print(WIFI_SSID);
  while (WiFi.status() != WL_CONNECTED) {
    Serial.print(WiFi.status());
    Serial.print(".");
    delay(500);
  }
  Serial.println();
  Serial.print("Connected, IP Address: ");
  Serial.println(WiFi.localIP());
}

void loop() {
  delay(2000);
}