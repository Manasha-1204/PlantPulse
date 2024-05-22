#include <ESP8266WiFi.h>

void setup(){
  Serial.begin(115200);
  WiFi.mode(WIFI_STA);
  WiFi.disconnect();
  delay(100);

  Serial.println("Setup done");
}

void loop(){
  int n = WiFi.scanNetworks();
  Serial.println("scan done");
  if (n==0){
    Serial.println("no networks");
  } else {
    Serial.print(n);
    Serial.println("networks found");
    for (int i=0; i<n; ++i){
      Serial.print(i + 1);
      Serial.print(": ");
      Serial.print (WiFi.SSID(i));
      Serial.print(" (");
      Serial.print(WiFi.RSSI(i));
      Serial.print(")");
      Serial.println((WiFi.encryptionType(i) == AUTH_OPEN) ?" ":"*");
      delay(10);
    }
  }
  Serial.println("");
  delay(5000);
}