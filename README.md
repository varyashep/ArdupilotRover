# Ardupilot Rover L298N

## Manual for Ardupilot based Rover with L298N motor driver controlled by simple DC brushed motors

### Components

* RF370 Brushed Motors

<img src="https://github.com/varyashep/ArdupilotRover/blob/main/motor.jpg" width="300" height="200">

* Pixhawk 2.8.1

<img src="https://github.com/varyashep/ArdupilotRover/blob/main/pixhawk.jpg" width="300" height="300">

* L298N motor driver

<img src="https://github.com/varyashep/ArdupilotRover/blob/main/driver.png" width="300" height="300">

* GPS module Ublox NEO-M8N

* Telemetry module ReadyToSky FPV 3DR 433/915 MHz 

* Receiver Flysky FS-iA6B 2.4 

### Wiring 

| L298N pin  |  Pixhawk pin/device   |
|------------|-----------------------|
|     IN1    |  AUX3                 |
|     IN2    |  AUX4                 |
|     IN3    |  AUX5                 |
|     IN4    |  AUX6                 |
|     GND    |  Any output rail GND  |
|     ENA    |  PWM1                 |
|     ENB    |  PWM2                 |
|   motorA   |  Driving motor        |
|   motorB   |  Driving motor        |
|   Vcc+GND  |  Power module output  |


### Ardupilot Setup

|     Key/Value    |     Comments    |
|---|---|
| MOT_PWM_TYPE,4 | Set motor’s type to BrushedBiPolar |
| RELAY_PIN,50 | AUX1 (reserved) |
| RELAY_PIN,51 | AUX2 (reserved) |
| RELAY_PIN3,52 | AUX3 |
| RELAY_PIN4,53 | AUX4 |
| RELAY_PIN5,54 | AUX5 |
| RELAY_PIN6,55 | AUX6 |
| SCR_ENABLE,1 | Enable LUA scripting |
| SERVO1_FUNCTION,73 | Throttle Left |
| SERVO1_MAX,2000 |  |
| SERVO1_MIN,1000 |  |
| SERVO1_REVERSED,0 |  |
| SERVO1_TRIM,1500 |  |
| SERVO3_FUNCTION,74 | Throttle Right |
| SERVO3_MAX,2000 |  |
| SERVO3_MIN,1000 |  |
| SERVO3_REVERSED,0 |  |
| SERVO3_TRIM,1500 | |
| SERVO9_FUNCTION,-1 | AUX1 GPIO mode (reserved) |
| SERVO10_FUNCTION,-1 | AUX2 (reserved) |
| SERVO11_FUNCTION,-1 | AUX3 |
| SERVO12_FUNCTION,-1 | AUX4 |
| SERVO13_FUNCTION,-1 | AUX5 |
| SERVO14_FUNCTION,-1 | AUX6 |