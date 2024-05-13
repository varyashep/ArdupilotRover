# Ardupilot Rover L298N

## Manual for Ardupilot based Rover with L298N motor driver controlled by simple DC brushed motors

### Components

* RF370 Brushed Motors

<img src="https://github.com/varyashep/ArdupilotRover/blob/main/motor.jpg" width="300" height="200">

* Pixhawk 2.4.8

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

This rover is made on a tracked platform so both motors are set for driving. Since we needed our rover to work correctly in auto and guided modes, we've decided to set MOT_PWM_TYPE to BrushedWithBipolar (all the parameters listed below).
This motor type allows us to handle every relay state correctly. 

RC sticks mode is set to 1. By setting RCMAP parameters (listed below) we've managed to use only 1 stick (right one). These can vary depending on your transmitter.
<br/>
RCMAP_PITCH,3
<br/>
RCMAP_ROLL,4
<br/>
RCMAP_THROTTLE,2
<br/>
RCMAP_YAW,1

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

<img src="https://github.com/varyashep/ArdupilotRover/blob/main/aux(1).jpg" width="300" height="300">

In Mission Planner upload the RoverCode.lua script to the scripts folder and reboot the Pixhawk. 

### Code Details

Left and right motor receive values from SERVO channels 2 and 4 (73 and 74 stand for Throttle Left and Throttle Right respectively) using SRV_Channels:get_ouput_pwm function. 

Since Trim is set to 1500, that's the value when relays are off. If value is more or less than 1500, rover moves either back or forward.

