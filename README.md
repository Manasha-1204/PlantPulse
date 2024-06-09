![Plant Pulse B2](https://github.com/Manasha-1204/PlantPulse/assets/111682039/5c9e02d3-4102-42d5-9b91-4b2f3ad4490b)
Welcome to **PlantPulse** – a precision agriculture project using IoT, remote sensing, and machine learning to optimize farming practices.

## Project Overview

PlantPulse is designed to monitor environmental conditions and automate irrigation in real-time. Using an array of sensors and communication modules, this system collects data on soil moisture, temperature, and humidity, processes it, and takes appropriate actions to maintain optimal growing conditions. The project integrates hardware components like NodeMCU ESP 8266, soil moisture sensors, a water pump, and DHT11 temperature and humidity sensors with software tools like Firebase and Flutter.

View our presentation [here!](https://www.canva.com/design/DAGHV7HmvDI/uGV4J3Odjr541LO5ZRu4Cw/view?utm_content=DAGHV7HmvDI&utm_campaign=designshare&utm_medium=link&utm_source=editor)

## Repository Structure

- **arduino_codes/**: Contains the Arduino sketches for reading sensor data and controlling the water pump.
- **plantapp/**: Contains the Flutter application code for real-time monitoring and manual control of the irrigation system.

## Tech Stack

<img src="https://skillicons.dev/icons?i=arduino,flutter,firebase,androidstudio,python,tensorflow,figma,gcp" />


### Hardware
- **ESP 8266 Wi-Fi Module**
- **Soil Moisture Sensor**
- **DHT11 Temperature and Humidity Sensor**
- **Water Pump**
- **Relay Module**

## Getting Started

### Prerequisites

To run this project, you will need:

- ESP 8266 Wi-Fi module
- Soil moisture sensor
- DHT11 temperature and humidity sensor
- Water pump
- Firebase account
- Flutter SDK
- Android Studio
- Arduino IDE

### Hardware Setup

1. **Connect the Sensors:**
   - Connect the soil moisture sensor to the Arduino analog input.
   - Connect the DHT11 sensor to the Arduino digital input.

2. **Connect the ESP 8266:**
   - Connect the ESP 8266 to the Arduino for Wi-Fi communication.

3. **Connect the Water Pump:**
   - Connect the water pump to the Arduino digital output through a relay module for switching.

### Software Setup

1. **Arduino Code:**
   - Navigate to the `arduino_codes` folder.
   - Open the `.ino` file in the Arduino IDE.
   - Update the Wi-Fi credentials and Firebase details in the code.
   - Upload the code to the Arduino Mega 2560.

2. **Flutter Application:**
   - Navigate to the `plantapp` folder.
   - Open the project in your preferred IDE (e.g., Android Studio, VS Code).
   - Configure the Firebase integration in the `lib` folder by adding your `google-services.json` file.
   - Run the Flutter app on an Android or iOS device.

3. **Machine Learning Model:**
   - Navigate to the `crop_recommendation_ml_model` folder.
   - Follow the instructions in the `README.md` within the folder to set up and run the crop recommendation model.

## Usage

1. **Real-time Monitoring:**
   - Launch the Flutter app on your mobile device.
   - Monitor real-time soil moisture, temperature, and humidity data.

2. **Automated Irrigation:**
   - The Arduino system will automatically activate the water pump when soil moisture levels fall below a set threshold.

3. **Manual Control:**
   - Use the Flutter app to manually control the water pump if needed.

4. **Crop Recommendation:**
   - Use the machine learning model to get crop recommendations based on the environmental data collected.

## Contributors 🤝
<table style="border: none;">
<tr>
<td align="center" width="200"><pre><a href="https://github.com/Manasha-1204Manasha-1204"><img src="https://avatars.githubusercontent.com/u/121673101?v=4" width="200" alt="Profile" /><br><sub>@Manasha-1204</sub></a></pre></td>
<td align="center" width="200"><pre><a href="https://github.com/amri-tah"><img src="https://avatars.githubusercontent.com/u/111682039?v=4" width="200" alt="Profile" /><br><sub>@amri-tah</sub></a></pre></td>
<td align="center" width="200"><pre><a href="https://github.com/sudheerkumarchowdary"><img src="https://avatars.githubusercontent.com/u/98307666?v=4" width="200" alt="Profile" /><br><sub>@sudheerkumarchowdary</sub></a>
<td align="center" width="200"><pre><a href="https://github.com/BURUGURAHUL"><img src="https://avatars.githubusercontent.com/u/121683096?v=4" width="200" alt="Profile" /><br><sub>@BURUGURAHUL</sub></a></pre></td>
</tr>
</table>


## Contributing

We welcome contributions to enhance the functionality of PlantPulse. If you have ideas or improvements, please submit a pull request.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Contact

For any queries or support, please contact us at [amrithanandini2003@gmail.com](mailto:amrithanandini2003@gmail.com).

Thank you for using PlantPulse! Let's revolutionize agriculture together.
