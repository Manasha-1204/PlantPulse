#define AOUT_PIN A0 

const int minMoistureValue = 0;    // Analog reading for very wet soil
const int maxMoistureValue = 1023; // Analog reading for very dry soil

void setup() {
  Serial.begin(115200);
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

  delay(500);
}
