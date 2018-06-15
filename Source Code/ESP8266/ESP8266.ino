#include <ESP8266WiFi.h>

short wifiStatus;

const char* ssid     = "hope you're okay";
const char* password = "takecare";  

WiFiServer server(80);


  void setup() {
     
    Serial.begin(115200);
    delay(200);
    wifiStatus = WiFi.status();
      
    Serial.println();
    Serial.println();
    Serial.print("CONNECTING TO: ");
    Serial.println(ssid);
      
    WiFi.begin(ssid, password);
      
    while (WiFi.status() != WL_CONNECTED) {
      delay(500);
      Serial.print(".");
    }          
  }   
     
  void loop() {
    wifiStatus = WiFi.status();

    if (wifiStatus == WL_CONNECTED) {
      Serial.println("");
      Serial.print("DEVICE IS NOW CONNECTED TO: ");  
      Serial.println(ssid);
      Serial.print("WITH IP ADDRESS: ");
      Serial.println(WiFi.localIP());  
    } else {
      Serial.println("");
      Serial.println("RE-ESTABLISHING CONNECTION");
    } 
    delay(3000);
}
