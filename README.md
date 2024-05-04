# Ardupilot Rover L298N

## Manual for Ardupilot based Rover with L298N motor driver controlled with simple DC brushed motors

### Components

* RF370 Brushed Motors

<img src="https://github.com/varyashep/ArdupilotRover/blob/main/driver.png" width="300" height="200">

* Pixhawk 2.8.1

![image](./pixhawk.jpg =300x300)

* L298N motor driver

![image](./driver.png =300x300)

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

