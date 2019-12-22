import 'package:flutter/material.dart';

class SensorSemantic {
  // Variables declaration
  String Id;
  String name;
  String type;
  String vendorName;
  String version;
  String power;
  String resolution;
  String maxRange;
  String maxDelay;
  String minDelay;
  String reportingMode;
  String isWakeup;
  String isDynamic;
  String isAdditionalInfoSupported;
  String isDirectChannelTypeSupported;
  String highestDirectReportRateValue;
  String fifoMaxEventCount;
  String fifoReservedEventCount;

  String _getTypeToName(String type) {
    return <String, String>{
      '1': 'Accelerometer',
      '2': 'Magnetic Field',
      '3': 'Orientation',
      '4': 'Gyroscope',
      '5': 'Ambient Light',
      '6': 'Atmospheric Pressure',
      '8': 'Proximity',
      '9': 'Gravity',
      '10': 'Linear Acceleration',
      '11': 'Rotation Vector',
      '12': 'Relative Humidity',
      '13': 'Ambient Temperature',
      '14': 'Uncalibred Magnetic Filed',
      '15': 'Game Rotation Vector',
      '16': 'Uncalibred Gyroscope',
      '17': 'Signifiant Motion',
      '19': 'Step Counter',
      '20': 'Geo Magnetic Rotation Vector',
      '21': 'Heart Rate',
      '28': 'Pose 6DOF',
      '29': 'Stationary Detection',
      '30': 'Motion Detection',
      '31': 'Heart Beat',
      '34': 'Low Latency Off Body Detection',
      '35': 'Uncalibred Accelerometer'
    } [type];
  }

  // Constructor
  SensorSemantic(
      this.Id,
      this.name,
      this.type,
      this.vendorName,
      this.version,
      this.power,
      this.resolution,
      this.maxRange,
      this.maxDelay,
      this.minDelay,
      this.reportingMode,
      this.isWakeup,
      this.isDynamic,
      this.isAdditionalInfoSupported,
      this.isDirectChannelTypeSupported,
      this.highestDirectReportRateValue,
      this.fifoMaxEventCount,
      this.fifoReservedEventCount) {
    type = '${_getTypeToName(type)} ($type)';
  }
}

// Type 1 - Accelerometer
class Accelerometer {
  // Variables declaration
  SensorSemantic sensor;
  String x;
  String y;
  String z;
  // Constructor
  Accelerometer (
    this.sensor,
    this.x,
    this.y,
    this.z
  );
}

// Type 2 - Magnetic Field
class MagneticField {
  // Variables declaration
  SensorSemantic sensor;
  String x;
  String y;
  String z;
  // Constructor
  MagneticField(
    this.sensor,
    this.x,
    this.y,
    this.z
  );
}

// Type 3 - Orientation
class OrientationSensor {
  // Variables declaration
  SensorSemantic sensor;
  String azimuth;
  String pitch;
  String roll;
  // Constructor
  OrientationSensor(
    this.sensor,
    this.azimuth,
    this.pitch,
    this.roll
  );
}

// Type 4 - Gyroscope
class Gyroscope {
  // Variables declaration
  SensorSemantic sensor;
  String x;
  String y;
  String z;
  // Constructor
  Gyroscope(
    this.sensor,
    this.x,
    this.y,
    this.z
  );
}

// Type 5 - Ambient Light
class AmbientLight {
  // Variable declaration
  SensorSemantic sensor;
  String level;
  // Constructor
  AmbientLight(
    this.sensor,
    this.level
  );
}

// Type 6 - Atmospheric Pressure
class AtmosphericPressure {
  // Variable declaration
  SensorSemantic sensor;
  String pressure;
  // Constructor
  AtmosphericPressure(
    this.sensor,
    this.pressure
  );
}

// Type 8 - Proximity
class Proximity {
  // Variable declaration
  SensorSemantic sensor;
  String distance;
  // Constructor
  Proximity(
    this.sensor,
    this.distance
  );
}

// Type 9 - Gravity
class Gravity {
  // Variables declaration
  SensorSemantic sensor;
  String x;
  String y;
  String z;
  // Constructor
  Gravity(
    this.sensor,
    this.x,
    this.y,
    this.z
  );
}

// Type 10 - LinearAcceleration
class LinearAcceleration {
  // Variables declaration
  SensorSemantic sensor;
  String x;
  String y;
  String z;
  // Constructor
  LinearAcceleration(
    this.sensor,
    this.x,
    this.y,
    this.z
  );
}

// Type 11 - RoationVector
class RotationVector {
  // Variables declaration
  SensorSemantic sensor;
  String x;
  String y;
  String z;
  String someVal;
  String estimatedHeadingAccuracy;
  // Constructor
  RotationVector(
    this.sensor,
    this.x,
    this.y,
    this.z,
    this.someVal,
    this.estimatedHeadingAccuracy
  );
}

// Type 12 - Relative Humidity
class RelativeHumidity {
  // Variable Declaration
  SensorSemantic sensor;
  String humidity;
  // Constructor
  RelativeHumidity (
    this.sensor,
    this.humidity
  );
}

// Type 13 - AmbientTemperature
class AmbientTemperature {
  // Variables declaration
  SensorSemantic sensor;
  String temperature;
  // Constructor
  AmbientTemperature(
    this.sensor,
    this.temperature
  );
}

// Type 14 - Uncalibrated Magnetic Field
class UncalibratedMagneticField {
  // Variables declaration
  SensorSemantic sensor;
  String xUncalibrated;
  String yUncalibrated;
  String zUncalibrated;
  String estimatedXBias;
  String estimatedYBias;
  String estimatedZBias;
  // Constructor
  UncalibratedMagneticField(
    this.sensor,
    this.xUncalibrated,
    this.yUncalibrated,
    this.zUncalibrated,
    this.estimatedXBias,
    this.estimatedYBias,
    this.estimatedZBias
  );
}

// Type 15 - GameRotationVector
class GameRotationVector {
  // Variables declaration
  SensorSemantic sensor;
  String x;
  String y;
  String z;
  String someVal;
  String estimatedHeadingAccuracy;
  // Constructor
  GameRotationVector(
    this.sensor,
    this.x,
    this.y,
    this.z,
    this.someVal,
    this.estimatedHeadingAccuracy
  );
}

// Type 16 - UncalibratedGyroscope
class UncalibratedGyroscope {
  // Variables declaration
  SensorSemantic sensor;
  String angularSpeedAroundX;
  String angularSpeedAroundY;
  String angularSpeedAroundZ;
  String estimatedDriftAroundX;
  String estimatedDriftAroundY;
  String estimatedDriftAroundZ;
  // Constructor
  UncalibratedGyroscope(
    this.sensor,
    this.angularSpeedAroundX,
    this.angularSpeedAroundY,
    this.angularSpeedAroundZ,
    this.estimatedDriftAroundX,
    this.estimatedDriftAroundY,
    this.estimatedDriftAroundZ
  );
}

// Type 17 - Signifiant Motion
class SignifiantMotion {
  // Variable déclaration
  SensorSemantic sensor;
  String isInMotion;
  // Constructor
  SignifiantMotion(
    this.sensor,
    this.isInMotion
  );
}

// Type 19 - Step Counter
class StepCounter {
  // Variables déclaration
  SensorSemantic sensor;
  String step;
  StepCounter(
    this.sensor,
    this.step
  );
}

// Type 20 - GeoMagneticRotationVector
class GeoMagneticRotationVector {
  // Variables declaration
  SensorSemantic sensor;
  String x;
  String y;
  String z;
  String someVal;
  String estimatedHeadingAccuracy;
  // Constructor
  GeoMagneticRotationVector(
    this.sensor,
    this.x,
    this.y,
    this.z,
    this.someVal,
    this.estimatedHeadingAccuracy
  );
}

//Type 21 - Heart Rate
class HeartRate {
  // Variable declaration
  SensorSemantic sensor;
  String rate;
  //Constructor
  HeartRate(
    this.sensor,
    this.rate
  );
}

// Type 28 - Pose 6DOF
class Pose6DOF {
  // Variables Declaration
  SensorSemantic sensor;
  String xSinTheta;
  String ySinTheta;
  String zSinTheta;
  String cosTheta;
  String xTranslation;
  String yTranslation;
  String zTranslation;
  String xDeltaQuaternion;
  String yDeltaQuaternion;
  String zDeltaQuaternion;
  String cosDeltaQuaternion;
  String xDeltaTranslation;
  String yDeltaTranslation;
  String zDeltaTranslation;
  String sequenceNumber;
  // Constructor
  Pose6DOF(
    this.sensor,
    this.xSinTheta,
    this.ySinTheta,
    this.zSinTheta,
    this.cosTheta,
    this.xTranslation,
    this.yTranslation,
    this.zTranslation,
    this.xDeltaQuaternion,
    this.yDeltaQuaternion,
    this.zDeltaQuaternion,
    this.cosDeltaQuaternion,
    this.xDeltaTranslation,
    this.yDeltaTranslation,
    this.zDeltaTranslation,
    this.sequenceNumber
  );
}

// Type 29 - Stationary Detection
class StationaryDetection {
  // Variable declaration
  SensorSemantic sensor;
  String isImmobile;
  // Constructor
  StationaryDetection(
    this.sensor,
    this.isImmobile
  );
}

// Type 30 - Motion Detection
class MotionDetection {
  // Variables declaration
  SensorSemantic sensor;
  String isInMotion;
  // Constructor
  MotionDetection(
    this.sensor,
    this.isInMotion
  );
}

// Type 31 - Heart Beat
class HeartBeat {
  // Variables declaration
  SensorSemantic sensor;
  String confidence;
  // Constructor
  HeartBeat(
    this.sensor,
    this.confidence
  );
}

// Type 34 - Low Latency Off Body Detection
class LowLatencyOffBodyDetection {
  // Variables declaration
  SensorSemantic sensor;
  String offBodySate;
  // Constructor
  LowLatencyOffBodyDetection (
    this.sensor,
    this.offBodySate
  );
}

// Type 35 - UncalibratedAccelerometer
class UncalibratedAccelerometer {
  // Variable declaration
  SensorSemantic sensor;
  String xUncalibrated;
  String yUncalibrated;
  String zUncalibrated;
  String estimatedXBias;
  String estimatedYBias;
  String estimatedZBias;
  // Constructor
  UncalibratedAccelerometer(
    this.sensor,
    this.xUncalibrated,
    this.yUncalibrated,
    this.zUncalibrated,
    this.estimatedXBias,
    this.estimatedYBias,
    this.estimatedZBias
  );
}