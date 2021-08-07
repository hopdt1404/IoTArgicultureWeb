package components.autoController;

import Connector.MQTTConnector;
import DAO.*;
import Utilities.Helper;
import components.OnControlListener;
import components.controller.Controller;
import model.*;
import org.json.simple.JSONObject;
import sun.util.calendar.LocalGregorianCalendar;

import java.time.LocalTime;
import java.util.List;

public class DeviceControlUnit extends Controller implements Comparable<DeviceControlUnit>{
    private String locateId;
    private Float upperThreshold;
    private Float lowerThreshold;
    private Integer currentSoilMoisture;
    private WeatherForecast weatherForecast;
    private LocalTime latestIrrigationTime;
    private Float amountOfWater;
    private Boolean isAuto;
    private Boolean isOn;
    private Float pumpSpeed;
    private Float relativeError = 2F;
    private Float moistureSetting;
    public DeviceControlUnit(){
        // Todo Set Device => sensing
        super(77309411329L);
        // Todo set Locate ID
        locateId = "353412"; //Hanoi
        // test, trong thực tế sẽ là giờ tròn, tức X h 00 m, minute = 1 vi de update WeatherForecast truoc
        latestIrrigationTime = LocalTime.now().withNano(0).withSecond(0).withMinute(1);
        pumpSpeed=3.66F; //ml/s
        upperThreshold=70F;
        lowerThreshold=60F;
        isAuto=true;
        isOn=true;
        SensingDao sensingDao = new SensingDao();
        System.out.println("sensingDao");
        System.out.println(sensingDao);
        DeviceDao deviceDao = new DeviceDao();
        System.out.println("deviceDao");
        System.out.println(deviceDao);
        // Todo: Error Sensing ID
        System.out.println("getDeviceId()");
        System.out.println(getDeviceId());
        Sensing sensing = sensingDao.getNewestSensingByPlotId(deviceDao.getPlotIdById(getDeviceId()));
        currentSoilMoisture=sensing.getSoilMoisture().intValue();
        System.out.println("DeviceControlUnit line 39");
        System.out.println("SoilMoisture: "+currentSoilMoisture);
        DeviceControlUnit currentDCU=this;
        final String topic = "/iot_agriculture/controlling/"+ Helper.convertDeviceIdToFarmId(currentDCU.getDeviceId());
        currentDCU.setOnControlListener(new OnControlListener() {
            @Override
            public void onReceivedControllingData(Float irrigationPeriodTime) {
                super.onReceivedControllingData(irrigationPeriodTime);
                final MQTTConnector mqttConnector;
                mqttConnector = new MQTTConnector();
                mqttConnector.connect();
                JSONObject jsonObject = new JSONObject();
                jsonObject.put("timeToWater",irrigationPeriodTime);
                jsonObject.put("deviceId",currentDCU.getDeviceId());
                mqttConnector.publishMessage(jsonObject.toJSONString(),topic);
                mqttConnector.disconnect();
            }
        });
    }
    public DeviceControlUnit(Long deviceId) {
        super(deviceId);
        // Todo: Locate Dinamic
        locateId = "353412"; //Hanoi
        latestIrrigationTime = LocalTime.now().withNano(0).withSecond(0).withMinute(1);// test, trong thực tế sẽ là giờ tròn, tức X h 00 m
        pumpSpeed=3.66F; //ml/s
        // Todo Upper threshold
        upperThreshold=70F;
        lowerThreshold=60F;
        isAuto=true;
        isOn=true;
        SensingDao sensingDao = new SensingDao();
        DeviceDao deviceDao = new DeviceDao();
        Sensing sensing = sensingDao.getNewestSensingByPlotId(deviceDao.getPlotIdById(getDeviceId()));
        System.out.println("DeviceControlUnit line 84");
        System.out.println("SoilMoisture: " + sensing.getSoilMoisture());
        currentSoilMoisture = sensing.getSoilMoisture().intValue();
        // get Upper threshold lower threshold
        System.out.println("Before getSoilMoistureAgriculturePlant");
        AgriculturePlant agriculturePlant = this.getSoilMoistureAgriculturePlant(deviceId);
        if (agriculturePlant != null) {
            Float temperature = agriculturePlant.getTemperature();
            this.moistureSetting = agriculturePlant.getMoisture();
            this.upperThreshold = this.moistureSetting + this.relativeError;
            this.lowerThreshold = this.moistureSetting - this.relativeError;
        }
        System.out.println("this.moistureSetting");
        System.out.println(this.moistureSetting);
        System.out.println("this.upperThreshold");
        System.out.println(this.upperThreshold);
        System.out.println("this.lowerThreshold");
        System.out.println(this.lowerThreshold);


        System.out.println("After getSoilMoistureAgriculturePlant");
        DeviceControlUnit currentDCU=this;
        final String topic = "/iot_agriculture/controlling/"+ Helper.convertDeviceIdToFarmId(currentDCU.getDeviceId());
        currentDCU.setOnControlListener(new OnControlListener() {
            @Override
            public void onReceivedControllingData(Float irrigationPeriodTime) {
                super.onReceivedControllingData(irrigationPeriodTime);
                final MQTTConnector mqttConnector;
                mqttConnector = new MQTTConnector();
                mqttConnector.connect();
                JSONObject jsonObject = new JSONObject();
                jsonObject.put("timeToWater",irrigationPeriodTime);
                jsonObject.put("deviceId",currentDCU.getDeviceId());
                mqttConnector.publishMessage(jsonObject.toJSONString(),topic);
                mqttConnector.disconnect();
            }
        });
    }

//    public void setLocateID(String locateID) {
//        this.locateID = locateID;
//    }

    public void updateCurrentSoilMoisture(){
        SensingDao sensingDao = new SensingDao();
        DeviceDao deviceDao = new DeviceDao();
        Sensing sensing = sensingDao.getNewestSensingByPlotId(deviceDao.getPlotIdById(getDeviceId()));
        currentSoilMoisture=sensing.getSoilMoisture().intValue();
    }
    public void setUpperThreshold(Float upperThreshold) {
        this.upperThreshold = upperThreshold;
    }

    public void setLowerThreshold(Float lowerThreshold) {
        this.lowerThreshold = lowerThreshold;
    }

    public void setCurrentSoilMoisture(Integer currentSoilMoisture) {
        this.currentSoilMoisture = currentSoilMoisture;
    }

    public LocalTime getLatestIrrigationTime() {
        return latestIrrigationTime;
    }

    public Long getDeviceId() {
        return super.getDeviceId();
    }

    public String getLocateId() {
        return locateId;
    }

    public Float getUpperThreshold() {
        return upperThreshold;
    }

    public Float getLowerThreshold() {
        return lowerThreshold;
    }

    public Integer getCurrentSoilMoisture() {
        return currentSoilMoisture;
    }

    public WeatherForecast getWeatherForecast() {
        if(weatherForecast==null){
            weatherForecast=WeatherForecasts.getInstance().getWeatherForecastByLocateId(locateId);
//            System.out.println("DeviceControlUnit line 133");
//            System.out.println(weatherForecast);
        }else {
            weatherForecast.update();
        }
        return weatherForecast;
    }

    public void setAmountOfWater(Float amountOfWater){
        onControlListener.onReceivedControllingData(amountOfWater);
        latestIrrigationTime = latestIrrigationTime.plusHours(1);
    }

    public void setIrrigationPeriodTime(Float irrigationPeriodTime){
        onControlListener.onReceivedControllingData(irrigationPeriodTime);
        latestIrrigationTime = latestIrrigationTime.plusHours(1);
    }

    public Float getPumpSpeed() {
        return pumpSpeed;
    }

    public void setPumpSpeed(Float pumpSpeed) {
        this.pumpSpeed = pumpSpeed;
    }

    public Boolean getAuto() {
        return isAuto;
    }

    public void setAuto(Boolean auto) {
        isAuto = auto;
    }

    public Boolean getOn() {
        return isOn;
    }

    public void setOn(Boolean on) {
        isOn = on;
    }

    public boolean needProcess(){
        return isOn&&isAuto;
    }
    @Override
    public int compareTo(DeviceControlUnit o) {
        return latestIrrigationTime.compareTo(o.latestIrrigationTime);
    }

    @Override
    public String toString() {
        return "\n------------" +
                "\ndevice Id: " +getDeviceId()+
                "\nupperThreshold: "+upperThreshold+
                "\nlowerThreshold: "+lowerThreshold+
                "\ncurrentSoilMoisture: "+currentSoilMoisture+
                "\nlatestIrrigationTime: "+latestIrrigationTime+
                "\npumpSpeed: "+pumpSpeed+
                "\nisAuto: "+isAuto+
                "\nisOn: "+isOn+
                "\n-----------\n";
    }
    public AgriculturePlant getSoilMoistureAgriculturePlant(Long deviceId)
    {
        AgriculturePlant agriculturePlant = null;

        // Agriculture =>
        /*
        1: AgriculturePlants:
        params: plant_id, FarmID, plant_state_id
        return: moisture, temperature

        2: FarmPlant:
        params: FarmID, plant_id
        return: current_plant_state

        3: PlantDevice
        params: FarmID, DeviceID
        return: plant_id

        4: Device:
        params: id
        return: FarmID, DeviceID
         */
        // getFarm -> plant ->state ->
        DeviceDao deviceDao = new DeviceDao();
        Device device = deviceDao.getById(deviceId);
        Long farmId = device.getFarmID();
        PlantDeviceDao plantDeviceDao = new PlantDeviceDao();
        PlantDevice plantDevice = plantDeviceDao.getByFarmIDAndDeviceID(farmId, deviceId);
        System.out.println("getSoilMoistureAgriculturePlant");
        System.out.println(plantDevice.toString());
        if (plantDevice != null) {
            Long plantId = plantDevice.getPlantId();
            System.out.println("plantID select: " + plantId);
            FarmPlantDao farmPlantDao = new FarmPlantDao();
            FarmPlant farmPlant = farmPlantDao.getByFarmIdAndPlantID(farmId, plantId);
            if (farmPlant != null) {
                Integer currentPlantStateId = farmPlant.getCurrentPlantState();
                AgriculturePlantDao agriculturePlantDao = new AgriculturePlantDao();
                System.out.println("plantId");
                System.out.println(plantId);
                System.out.println("farmId");
                System.out.println(farmId);
                System.out.println("currentPlantStateId");
                System.out.println(currentPlantStateId);
                agriculturePlant = agriculturePlantDao.getByPlantIdFarmIdPlanStateId(plantId, farmId, currentPlantStateId);
                System.out.println(agriculturePlant.toString());
                if (agriculturePlant != null) {
                    System.out.println(agriculturePlant.toString());
                }
            }

        }
        return agriculturePlant;
    }
}
