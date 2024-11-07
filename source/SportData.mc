import Toybox.ActivityRecording;
import Toybox.Application;
import Toybox.Activity;
import Toybox.Lang;
import Toybox.Time;
import Toybox.System;
import Toybox.Sensor;

class SportData {

    private var timer;
    
    private var session;
    private var isStarted;
    protected var name;
    protected var sport;
    protected var subSport;


    private var info;
    private var sensor;
    private var deviceSettings;

    // helper variables
    private var lapTimestamp;
    private var lastLapTime;
    private var lapDistanceStamp;
    private var lastLapDistance;
    private var avgLapTime;
    private var lapCount;
    private var lapTime;
    private var lapDistance;

    var autoLapDetected;



    function initialize() {
        session = null;
        isStarted = false;
        name = Properties.getValue("Name");
        sport = Properties.getValue("Sport");
        subSport = Properties.getValue("SubSport");


        lapTimestamp = 0;
        lastLapTime = 0;

        lapDistanceStamp = 0;
        lastLapDistance = 0;

        lapTime = 0;
        lapDistance = 0;

        avgLapTime = 0;
        lapCount = 0;

        autoLapDetected = false;


        if(timer == null) {
            timer = new Timer.Timer();
            timer.start(method(:update), 1000, true);
        }
        
        update();

        deviceSettings = System.getDeviceSettings();
    }


    function update() as Void {
        info = Activity.getActivityInfo();
        sensor = Sensor.getInfo();


        if(info != null && info.timerTime != null) {
            lapTime = info.timerTime - lapTimestamp;
        }
        if(info != null && info.elapsedDistance != null) {
            lapDistance = info.elapsedDistance - lapDistanceStamp;
        }


        if(Properties.getValue("LapActivated") && Properties.getValue("AutoLapActivated") && lapDistance >= Properties.getValue("AutoLapValue")) {
            lap();
            autoLapDetected = true;
        }



    }

    function isRecording() as Boolean {
        if(session != null) {
            return session.isRecording();
        }
        return false;
    }

    function isRecordingStarted() as Boolean {
        return isStarted;
    }

    function create() {
        name = Properties.getValue("Name");
        sport = Properties.getValue("Sport");
        subSport = Properties.getValue("SubSport");


        if(!isStarted) {
            session = ActivityRecording.createSession({          // set up recording session
                 :name=>name,                              // set session name
                 :sport=>sport,                // set sport type
                 :subSport=>subSport          // set sub sport type
           });
        }
    }

    function start() {
        //update();

        if(session == null) {
            create();
        }
        
        if(!isRecording()) {
            isStarted = true;
            return session.start();
        }
        return false;
    }

    function stop() {
        //update();

        if(session != null && isRecording()) {
            return session.stop();
        }
        return false;
    }

    function save() {
        //update();

        if(session != null && isStarted && !isRecording()) {
            var ret_val = session.save();
            initialize();
            return ret_val;
        }
        return false;
    }

    function lap() {
        //update();

        if(session != null && isStarted && isRecording()) {
            if(info != null) {
                if(info.timerTime != null) {
                    lastLapTime = info.timerTime - lapTimestamp;
                    lapTimestamp = info.timerTime;
                    avgLapTime = (avgLapTime*lapCount + lastLapTime) / (lapCount + 1);
                }
                
                if(info.elapsedDistance != null) {
                    lastLapDistance = info.elapsedDistance - lapDistanceStamp;
                    lapDistanceStamp = info.elapsedDistance;
                }
            }
            lapCount += 1;
            return session.addLap();
        }
        return false;
    }

    function discard() {
        //update();

        if(session != null && isStarted && !isRecording()) {
            var ret_val = session.discard();
            initialize();
            return ret_val;
        }
        return false;
    }







    function getMetric(request as Number) as Array<String> {
        if(info == null) {
            return ["0", "null"];
        }

        if([].indexOf(request) != -1 && sensor == null) { // contains the requests that need Toybox.Sensor
            return ["0", "null"];
        }

        // info is not null
        switch(request) {
            case 0: //timer
                return [formatTime(info.timerTime), WatchUi.loadResource(Rez.Strings.Timer)] as Array<String> ;
            case 1: //lap timer
                return [formatTime(lapTime), WatchUi.loadResource(Rez.Strings.LapTimer)] as Array<String>;
            case 2: //last lap
                return [formatTime(lastLapTime), WatchUi.loadResource(Rez.Strings.LastLapTimer)] as Array<String>;
            case 3: //avg lap time
                return [formatTime(avgLapTime), WatchUi.loadResource(Rez.Strings.AverageLap)] as Array<String>;
            case 4: //elapsed time
                if(info.startTime == null) {
                    return ["00:00", WatchUi.loadResource(Rez.Strings.ElapsedTime)] as Array<String>;
                }
                return [formatTime(Time.now().subtract(info.startTime).value() * 1000), WatchUi.loadResource(Rez.Strings.ElapsedTime)] as Array<String>;
            case 5: //distance
                return [formatDistance(info.elapsedDistance), WatchUi.loadResource(Rez.Strings.Distance)] as Array<String>;
            case 6: //lap distance
                return [formatDistance(lapDistance), WatchUi.loadResource(Rez.Strings.LapDistance)] as Array<String>;
            case 7: //last lap distance
                return [formatDistance(lastLapDistance), WatchUi.loadResource(Rez.Strings.LastLapDistance)] as Array<String>;
            case 8: //pace
                return [formatPace(info.currentSpeed), WatchUi.loadResource(Rez.Strings.Pace)] as Array<String>;
            case 9: //average pace
                if(info.timerTime == null || info.elapsedDistance == null) {
                    return ["--:--", WatchUi.loadResource(Rez.Strings.AveragePace)] as Array<String>;
                }
                return [formatPace(1000.0 * info.elapsedDistance / info.timerTime), WatchUi.loadResource(Rez.Strings.AveragePace)] as Array<String>;
            case 10: //average lap pace
                if(lapTime <= 0) {
                    return ["--:--", WatchUi.loadResource(Rez.Strings.AverageLapPace)] as Array<String>;
                }
                return [formatPace( 1000.0 * lapDistance.toFloat() / lapTime.toFloat() ), WatchUi.loadResource(Rez.Strings.AverageLapPace)] as Array<String>;
            case 11: //last lap pace
                if(lastLapTime <= 0) {
                    return ["--:--", WatchUi.loadResource(Rez.Strings.LastLapPace)] as Array<String>;
                }
                return [formatPace( 1000.0 * lastLapDistance / lastLapTime ), WatchUi.loadResource(Rez.Strings.LastLapPace)] as Array<String>;
            case 12: //max pace
                return [formatPace(info.maxSpeed), WatchUi.loadResource(Rez.Strings.MaxPace)] as Array<String>;
            case 13: //speed
                return [formatSpeed(info.currentSpeed), WatchUi.loadResource(Rez.Strings.Speed)] as Array<String>;
            case 14: //average speed
                if(info.timerTime == null || info.elapsedDistance == null) {
                    return ["0.0", WatchUi.loadResource(Rez.Strings.AverageSpeed)] as Array<String>;
                }
                return [formatSpeed(1000.0 * info.elapsedDistance / info.timerTime), WatchUi.loadResource(Rez.Strings.AverageSpeed)] as Array<String>;
            case 15: //average lap speed
                if(lapTime <= 0) {
                    return ["0.0", WatchUi.loadResource(Rez.Strings.AverageLapSpeed)] as Array<String>;
                }
                return [formatSpeed( 1000.0 * lapDistance.toFloat() / lapTime.toFloat() ), WatchUi.loadResource(Rez.Strings.AverageLapSpeed)] as Array<String>;
            case 16: //last lap speed
                if(lastLapTime <= 0) {
                    return ["--:--", WatchUi.loadResource(Rez.Strings.LastLapSpeed)] as Array<String>;
                }
                return [formatSpeed( 1000.0 * lastLapDistance / lastLapTime ), WatchUi.loadResource(Rez.Strings.LastLapSpeed)] as Array<String>;
            case 17: //max speed
                return [formatSpeed(info.maxSpeed), WatchUi.loadResource(Rez.Strings.MaxSpeed)] as Array<String>;
            case 18: //heart rate
                return [formatValue(info.currentHeartRate, "%.0d"), WatchUi.loadResource(Rez.Strings.HeartRate)] as Array<String>;
            case 19: //average heart rate
                return [formatValue(info.averageHeartRate, "%.0d"), WatchUi.loadResource(Rez.Strings.AverageHeartRate)] as Array<String>;
            




        }




        return ["--", "null"];
    }






    // Helper functions

    private function formatTime(param_time as Number or Null) as String {
        if(param_time == null || param_time == 0) {
            return "00:00";
        }
        var timerSeconds = param_time/1000;
    	var timerMinutes  = timerSeconds/60;
    	var timerHours = timerMinutes/60;
    	var timerSecondsNormalized = timerSeconds - (timerMinutes * 60);
    	var timerMinutesNormalized = timerMinutes - (timerHours * 60);
    	if(timerMinutesNormalized < 10) {
    		timerMinutesNormalized = "0" + timerMinutesNormalized as String;
    	}
        if(timerSecondsNormalized < 10) {
    		timerSecondsNormalized = "0" + timerSecondsNormalized as String;
    	}
    	
    	//print the values
    	if (timerHours < 1) {
    		return (timerMinutesNormalized + ":" + timerSecondsNormalized);
    	}
    	return(timerHours + ":" + timerMinutesNormalized + ":" + timerSecondsNormalized);
    }


    private function formatDistance(param_distance as Float or Null) as String {
        if(param_distance == null || param_distance <= 0) {
    		return "0";
    	}
        
        var unit = deviceSettings.distanceUnits;
        if( [32, 43, 44, 23].indexOf(Properties.getValue("Sport")) != -1 ) { // nautical miles
            unit = 2;
        }

        if(unit == System.UNIT_METRIC) {
            if(param_distance < 1000) {
                return(param_distance.toNumber().toString());
            }
            return (param_distance/1000.0d).format("%.2f").toString();
        }
        else if(unit == System.UNIT_STATUTE) {
            if(param_distance < 1609.34) {
                return((param_distance * 1.09361).toNumber().toString());
            }
            return (param_distance * 0.000621371d).format("%.2f").toString();
        }
        else/*if(unit == 2)*/ { // nautical miles
            return (param_distance * 0.000539957d).format("%.2f").toString();
        }

        
    }



    private function formatPace(param_speed as Float or Null) as String {
        if(param_speed == null || param_speed < 0.5) {
    		return "--:--";
    	}

        var unit = Properties.getValue("PaceUnits");

        if(unit == System.UNIT_STATUTE) {
    		param_speed = 60/(param_speed*2.23694);
    	} else {
    		param_speed = 60.0/(param_speed*3.6);
    	}
		
        var paceMin = Math.floor(param_speed).toNumber();
        var paceSec = ((param_speed-paceMin)*60).toNumber();
       	if(paceSec < 10) {
        	paceSec = "0" + paceSec.toString();
        }
        return(paceMin.toString() + ":" + paceSec.toString());
    }



    private function formatSpeed(param_speed as Float or Null) as String {
        if(param_speed == null || param_speed <= 0) {
    		return "0.0";
    	}

        var unit = Properties.getValue("SpeedUnits");

        if(unit == System.UNIT_METRIC) {
            return (param_speed * 3.6).format("%.1f").toString();
        }

        return (param_speed * 2.23694).format("%.1f").toString();
    }



    private function formatTemperature(param_temperature as Float or Null) as String {
        if(param_temperature == null || param_temperature <= 0) {
    		return "--";
    	}

        var unit = Properties.getValue("TemperatureUnits");

        if(unit == System.UNIT_METRIC) {
            return (param_temperature).format("%.1f").toString();
        }

        return ((param_temperature * 1.8) + 32).format("%.1f").toString();
    }



    private function formatValue(param_value as Float or Null, param_format as String) as String {
        if(param_value == null) {
    		return "--";
    	}


        return (param_value).format(param_format).toString();
    }




}