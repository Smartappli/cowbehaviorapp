import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'SensorSemantic.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'dart:io';

void main() => runApp(CowBehaviorMain());

class CowBehaviorMain extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cow Behavior App',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

SensorSemantic getInstanceOfSensorSemantic(Map<String, String> data) {
  return SensorSemantic (
    data['Id'],
    data['name'],
    data['type'],
    data['vendorName'],
    data['version'],
    data['power'],
    data['resolution'],
    data['maxRange'],
    data['maxDelay'],
    data['minDelay'],
    data['reportingMode'],
    data['isWakeup'],
    data['isDynamic'],
    data['isAdditionalInfoSupported'],
    data['isDirectChannelTypeSupported'],
    data['highestDirectReportRateValue'],
    data['fifoMaxEventCount'],
    data['fifoReservedEventCount']
  );
}

class _MyHomePageState extends State<MyHomePage> {
  static String _methodChannelName = 'eu.smartappli.cowbehavior.androidMethodChannel';
  static String _eventChannelName = 'eu.smartappli.cowbehavior.androidEventChannel';
  static MethodChannel _methodChannel;
  static EventChannel _eventChannel;

  List<Accelerometer> _listAccelerometer = [];                            // Type 1
  List<MagneticField> _listMagnetometer = [];                             // Type 2
  List<OrientationSensor> _listOrientationSensor = [];                    // Type 3
  List<Gyroscope> _listGyroscope = [];                                    // Type 4
  List<AmbientLight> _listAmbientLight = [];                              // Type 5
  List<AtmosphericPressure> _listAtmosphericPressure = [];                // Type 6
  List<Proximity> _listProximity = [];                                    // Type 8
  List<Gravity> _listGravity = [];                                        // Type 9
  List<LinearAcceleration> _listLinearAcceleration = [];                  // Type 10
  List<RotationVector> _listRotationVector = [];                          // Type 11
  List<RelativeHumidity> _listRelativeHumidity = [];                      // Type 12
  List<AmbientTemperature> _listAmbientTemperature = [];                  // Type 13
  List<UncalibratedMagneticField> _listUncalibratedMagneticField = [];    // Type 14
  List<GameRotationVector> _listGameRotationVector = [];                  // Type 15
  List<UncalibratedGyroscope> _listUncalibratedGyroscope = [];            // Type 16
  List<SignifiantMotion> _listSignifiantMotion = [];                      // Type 17
  List<StepCounter> _listStepCounter = [];                                // Type 19
  List<GeoMagneticRotationVector> _listGeoMagneticRotationVector = [];    // Type 20
  List<HeartRate> _listHeartRate = [];                                    // Type 21
  List<Pose6DOF> _listPose6DOF = [];                                      // Type 28
  List<StationaryDetection> _listStationaryDetection = [];                // Type 29
  List<MotionDetection> _listMotionDetection = [];                        // Type 30
  List<HeartBeat> _listHeartBeat = [];                                    // Type 31
  List<LowLatencyOffBodyDetection> _listLowLatencyOffBodyDetection = [];  // Type 34

  Future<void> getSensorsList() async {
    Map<String, List<dynamic>> sensorCount;
    try {
      Map<dynamic, dynamic> tmp =  await _methodChannel.invokeMethod('getSensorList');
      sensorCount = Map<String, List<dynamic>>.from(tmp);
      sensorCount.forEach((String key, List<dynamic> value) {
        switch(key) {
          case '1': // Accelerometer
            if (value.length > 0) {
              value.forEach((dynamic element) {
                _listAccelerometer.add(Accelerometer(
                  getInstanceOfSensorSemantic(
                    Map<String, String>.from(element)),
                    'NA',
                    'NA',
                    'NA'
                ));
              });
            }
            break;

          case '2':
            if (value.length > 0) {
              value.forEach((dynamic element) {
                _listMagnetometer.add(MagneticField(
                  getInstanceOfSensorSemantic(
                    Map<String, String>.from(element)),
                    'NA',
                    'NA',
                    'NA'
                ));
              });
            }
            break;

          case '3':
            if (value.length > 0) {
              value.forEach((dynamic element) {
                _listOrientationSensor.add(OrientationSensor(
                  getInstanceOfSensorSemantic(
                    Map<String, String>.from(element)),
                    'NA',
                    'NA',
                    'NA'
                ));
              });
            }
            break;

          case '4':
            if (value.length > 0) {
              value.forEach((dynamic element) {
                _listGyroscope.add(Gyroscope(
                  getInstanceOfSensorSemantic(
                    Map<String, String>.from(element)),
                    'NA',
                    'NA',
                    'NA'
                ));
              });
            }
            break;

          case '5':
            if (value.length > 0) {
              value.forEach((dynamic element) {
                _listAmbientLight.add(AmbientLight(
                  getInstanceOfSensorSemantic(
                    Map<String, String>.from(element)),
                    'NA'
                ));
              });
            }
            break;

          case '6':
            if (value.length > 0) {
              value.forEach((dynamic element) {
                _listAtmosphericPressure.add(AtmosphericPressure(
                  getInstanceOfSensorSemantic(
                    Map<String, String>.from(element)),
                    'NA'
                ));
              });
            }
            break;

          case '8':
            if (value.length > 0) {
              value.forEach((dynamic element) {
                _listProximity.add(Proximity(
                  getInstanceOfSensorSemantic(
                    Map<String, String>.from(element)),
                    'NA'
                ));
              });
            }
            break;

          case '9':
            if (value.length > 0) {
              value.forEach((dynamic element) {
                _listGravity.add(Gravity(
                  getInstanceOfSensorSemantic(
                    Map<String, String>.from(element)),
                    'NA',
                    'NA',
                    'NA'
                ));
              });
            }
            break;

          case '10':
            if (value.length > 0) {
              value.forEach((dynamic element) {
                _listLinearAcceleration.add(LinearAcceleration(
                  getInstanceOfSensorSemantic(
                    Map<String, String>.from(element)),
                    'NA',
                    'NA',
                    'NA'
                ));
              });
            }
            break;

          case '11':
            if (value.length > 0) {
              value.forEach((dynamic element) {
                _listRotationVector.add(RotationVector(
                  getInstanceOfSensorSemantic(
                    Map<String, String>.from(element)),
                    'NA',
                    'NA',
                    'NA',
                    'NA',
                    'NA'
                ));
              });
            }
            break;

          case '12':
            if (value.length > 0) {
              value.forEach((dynamic element) {
                _listRelativeHumidity.add(RelativeHumidity(
                  getInstanceOfSensorSemantic(
                    Map<String, String>.from(element)),
                    'NA'
                ));
              });
            }
            break;

          case '13':
            if (value.length > 0) {
              value.forEach((dynamic element) {
                _listAmbientTemperature.add(AmbientTemperature(
                  getInstanceOfSensorSemantic(
                    Map<String, String>.from(element)),
                    'NA'));
              });
            }
            break;

          case '14':
            if (value.length > 0) {
              value.forEach((dynamic element) {
                _listUncalibratedMagneticField.add(UncalibratedMagneticField(
                  getInstanceOfSensorSemantic(
                    Map<String, String>.from(element)),
                    'NA',
                    'NA',
                    'NA',
                    'NA',
                    'NA',
                    'NA'
                ));
              });
            }
            break;

          case '15':
            if (value.length > 0) {
              value.forEach((dynamic element) {
                _listGameRotationVector.add(GameRotationVector(
                  getInstanceOfSensorSemantic(
                    Map<String, String>.from(element)),
                    'NA',
                    'NA',
                    'NA',
                    'NA',
                    'NA'
                ));
              });
            }
            break;

          case '16':
            if (value.length > 0) {
              value.forEach((dynamic element) {
                _listUncalibratedGyroscope.add(UncalibratedGyroscope(
                  getInstanceOfSensorSemantic(
                    Map<String, String>.from(element)),
                    'NA',
                    'NA',
                    'NA',
                    'NA',
                    'NA',
                    'NA'
                ));
              });
            }
            break;
        }
      });
    } on PlatformException {}
    setState(() {

    });
  }

  @override
  void initState() {
    super.initState();
    _methodChannel = MethodChannel(_methodChannelName);
    _eventChannel = EventChannel(_eventChannelName);
    getSensorsList();
    _eventChannel.receiveBroadcastStream().listen(_onData, onError: _onError);
  }

  void _onData(dynamic event) {
    Map<String, String> receivedData = Map<String,String>.from(event);
    switch (receivedData['type']) {
      case '1': // Accelerometer
        _listAccelerometer.forEach((item) {
          if (isAMatch(item.sensor, receivedData)) {
            List<String> sensorFeed = receivedData['values'].split(';');
            setState(() {
              item.x = sensorFeed[0];
              item.y = sensorFeed[1];
              item.z = sensorFeed[2];
            });
          }
        });
        break;

      case '2': // Magnetic Field
        _listMagnetometer.forEach((item) {
          if (isAMatch(item.sensor, receivedData)) {
            List<String> sensorFeed = receivedData['values'].split(';');
            setState(() {
              item.x = sensorFeed[0];
              item.y = sensorFeed[1];
              item.z = sensorFeed[2];
            });
          }
        });
        break;

      case '3': // OrientationSensor
        _listOrientationSensor.forEach((item) {
          if (isAMatch(item.sensor, receivedData)) {
            List<String> sensorFeed = receivedData['values'].split(';');
            setState(() {
              item.azimuth = sensorFeed[0];
              item.pitch = sensorFeed[1];
              item.roll = sensorFeed[2];
            });
          }
        });
        break;

      case '4': // Gyroscope
        _listGyroscope.forEach((item) {
          if (isAMatch(item.sensor, receivedData)) {
            List<String> sensorFeed = receivedData['values'].split(';');
            setState(() {
              item.x = sensorFeed[0];
              item.y = sensorFeed[1];
              item.z = sensorFeed[2];
            });
          }
        });
        break;

      case '5': // Ambient Light
        _listAmbientLight.forEach((item) {
          if (isAMatch(item.sensor, receivedData)) {
            List<String> sensorFeed = receivedData['values'].split(';');
            setState(() {
              item.level = sensorFeed[0];
            });
          }
        });
        break;

      case '6': // Atmospherique Pressure
        _listAtmosphericPressure.forEach((item) {
          if (isAMatch(item.sensor, receivedData)) {
            List<String> sensorFeed = receivedData['values'].split(';');
            setState(() {
              item.pressure = sensorFeed[0];
            });
          }
        });
        break;

      case '8': // Proximity Sensor
        _listProximity.forEach((item) {
          if (isAMatch(item.sensor, receivedData)) {
            List<String> sensorFeed = receivedData['values'].split(';');
            setState(() {
              item.distance = sensorFeed[0];
            });
          }
        });
        break;

      case '9': // Gravity
        _listGravity.forEach((item) {
          if (isAMatch(item.sensor, receivedData)) {
            List<String> sensorFeed = receivedData['values'].split(';');
            setState(() {
              item.x = sensorFeed[0];
              item.y = sensorFeed[1];
              item.z = sensorFeed[2];
            });
          }
        });
        break;

      case '10': // Linear Acceleration
        _listLinearAcceleration.forEach((item) {
          if (isAMatch(item.sensor, receivedData)) {
            List<String> sensorFeed = receivedData['values'].split(';');
            setState(() {
              item.x = sensorFeed[0];
              item.y = sensorFeed[1];
              item.z = sensorFeed[2];
            });
          }
        });
        break;

      case '11': // Rotation Vector
        _listRotationVector.forEach((item) {
          if (isAMatch(item.sensor, receivedData)) {
            List<String> sensorFeed = receivedData['values'].split(';');
            setState(() {
              item.x = sensorFeed[0];
              item.y = sensorFeed[1];
              item.z = sensorFeed[2];
              if (sensorFeed.length == 4) {
                item.someVal = sensorFeed[3];
              } else if (sensorFeed.length == 5) {
                item.estimatedHeadingAccuracy = sensorFeed[4];
              }
            });
          }
        });
        break;

      case '12': // Relative Humidity
        _listRelativeHumidity.forEach((item) {
          if (isAMatch(item.sensor, receivedData)) {
            List<String> sensorFeed = receivedData['values'].split(';');
            setState(() {
              item.humidity = sensorFeed[0];
            });
          }
        });
        break;

      case '13':
        _listAmbientTemperature.forEach((item) {
          if (isAMatch(item.sensor, receivedData)) {
            List<String> sensorFeed = receivedData['values'].split(';');
            setState(() {
              item.temperature = sensorFeed[0];
            });
          }
        });
        break;

      case '14': // Uncalibrated Magnetic Field Sensor
        _listUncalibratedMagneticField.forEach((item) {
          if (isAMatch(item.sensor, receivedData)) {
            List<String> sensorFeed = receivedData['values'].split(';');
            setState(() {
              item.xUncalibrated = sensorFeed[0];
              item.yUncalibrated = sensorFeed[1];
              item.zUncalibrated = sensorFeed[2];
              item.estimatedXBias = sensorFeed[3];
              item.estimatedYBias = sensorFeed[4];
              item.estimatedZBias = sensorFeed[5];
            });
          }
        });
        break;

      case '15': // GameRotationVector
        _listGameRotationVector.forEach((item) {
          if (isAMatch(item.sensor, receivedData)) {
            List<String> sensorFeed = receivedData['values'].split(';');
            setState(() {
              item.x = sensorFeed[0];
              item.y = sensorFeed[1];
              item.z = sensorFeed[2];
              item.someVal;
              item.estimatedHeadingAccuracy;
            });
          }
        });
        break;

      case '16': // UncalibratedGyroscope
        _listUncalibratedGyroscope.forEach((item) {
          if (isAMatch(item.sensor, receivedData)) {
            List<String> sensorFeed = receivedData['values'].split(';');
            setState(() {
              item.angularSpeedAroundX = sensorFeed[0];
              item.angularSpeedAroundY = sensorFeed[1];
              item.angularSpeedAroundY = sensorFeed[2];
              item.estimatedDriftAroundX = sensorFeed[3];
              item.estimatedDriftAroundY = sensorFeed[4];
              item.estimatedDriftAroundZ = sensorFeed[5];
            });
          }
        });
        break;

      case '17': // Signifiant Motion Sensor
        _listSignifiantMotion.forEach((item) {
          if (isAMatch(item.sensor, receivedData)) {
            List<String> sensorFeed = receivedData['values'].split(';');
            setState(() {
              item.isInMotion = sensorFeed[0];
            });
          }
        });
        break;

      case '19': // Step Counter
        _listStepCounter.forEach((item) {
          if (isAMatch(item.sensor, receivedData)) {
            List<String> sensorFeed = receivedData['values'].split(';');
            setState(() {
              item.step = sensorFeed[0];
            });
          }
        });
        break;

      case '20': // GeoMagneticRotationVector
        _listGeoMagneticRotationVector.forEach((item) {
          if (isAMatch(item.sensor, receivedData)) {
            List<String> sensorFeed = receivedData['values'].split(';');
            setState(() {
              item.x = sensorFeed[0];
              item.y = sensorFeed[1];
              item.z = sensorFeed[2];
              if (sensorFeed.length == 4) {
                item.someVal = sensorFeed[3];
              } else if (sensorFeed.length == 5) {
                item.estimatedHeadingAccuracy = sensorFeed[4];
              }
            });
          }
        });
        break;

      case '21': // Heart Rate
        _listHeartRate.forEach((item) {
          if (isAMatch(item.sensor, receivedData)) {
            List<String> sensorFeed = receivedData['values'].split(';');
            setState(() {
              item.rate = sensorFeed[0];
            });
          }
        });
        break;

      case '28': // Pose 6DOF
        _listPose6DOF.forEach((item) {
          if (isAMatch(item.sensor, receivedData)) {
            List<String> sensorFeed = receivedData['values'].split(';');
            setState(() {
              item.xSinTheta = sensorFeed[0];
              item.ySinTheta = sensorFeed[1];
              item.zSinTheta = sensorFeed[2];
              item.cosTheta = sensorFeed[3];
              item.xTranslation = sensorFeed[4];
              item.yTranslation = sensorFeed[5];
              item.zTranslation = sensorFeed[6];
              item.xDeltaQuaternion = sensorFeed[7];
              item.yDeltaQuaternion = sensorFeed[8];
              item.zDeltaQuaternion = sensorFeed[9];
              item.cosDeltaQuaternion = sensorFeed[10];
              item.xDeltaTranslation = sensorFeed[11];
              item.yDeltaTranslation = sensorFeed[12];
              item.zDeltaTranslation = sensorFeed[13];
              item.sequenceNumber = sensorFeed[14];
            });
          }
        });
        break;

      case '29': // Stationary Detection
        _listStationaryDetection.forEach((item) {
          if (isAMatch(item.sensor, receivedData)) {
            List<String> sensorFeed = receivedData['values'].split(';');
            setState(() {
              item.isImmobile = sensorFeed[0];
            });
          }
        });
        break;

      case '30': // Motion Detection
        _listMotionDetection.forEach((item) {
          if (isAMatch(item.sensor, receivedData)) {
            List<String> sensorFeed = receivedData['values'].split(';');
            setState(() {
              item.isInMotion = sensorFeed[0];
            });
          }
        });
        break;

      case '31': // Heart Beat
        _listHeartBeat.forEach((item) {
          if (isAMatch(item.sensor, receivedData)) {
            List<String> sensorFeed = receivedData['values'].split(';');
            setState(() {
              item.confidence = sensorFeed[0];
            });
          }
        });
        break;

      case '34': // Low Latency Off Body Detection
        _listLowLatencyOffBodyDetection.forEach((item) {
          if (isAMatch(item.sensor, receivedData)) {
            List<String> sensorFeed = receivedData['values'].split(';');
            setState(() {
              item.offBodySate = sensorFeed[0];
            });
          }
        });
        break;

      case '35': // UncalibratedAccelerometer

        break;
    }
  }

  void _onError(dynamic error) {}

  bool isAMatch(SensorSemantic data, Map<String, String> receivedData) {
    return (data.name == receivedData['name'] && data.vendorName == receivedData['vendorName'] && data.version == receivedData['version']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(
        title: Text(
          'CowBehavior',
          style: TextStyle(color: Colors.black),
        ), backgroundColor: Colors.lightBlue,
      ),
    body: ListView(padding:EdgeInsets.all(6.0)));
  }
}
