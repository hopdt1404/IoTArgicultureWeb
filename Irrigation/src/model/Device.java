package model;

import java.awt.*;

public class Device {
    private Long deviceID;
    private Integer deviceTypeID;
    private String deviceName;
    private Integer status;
    private Integer plotID;
    private Long userID;
    private Long farmID;


    public Device(Device device){
        this.deviceID = device.deviceID;
        this.deviceTypeID = device.getDeviceTypeID();
        this.deviceName = device.getDeviceName();
        this.status = device.getStatus();
        this.plotID = device.getPlotID();
    }
    // Old constructor
    public Device(Long deviceID, Integer deviceTypeID, String deviceName, Integer status, Integer plotID) {
        this.deviceID = deviceID;
        this.deviceTypeID = deviceTypeID;
        this.deviceName = deviceName;
        this.status=status;
        this.plotID = plotID;
    }
    // new constructor
    public Device(Long deviceID, Integer deviceTypeID, String deviceName, Integer status, Integer plotID, Long userID, Long farmID) {
        this.deviceID = deviceID;
        this.deviceTypeID = deviceTypeID;
        this.deviceName = deviceName;
        this.status=status;
        this.plotID = plotID;
        this.userID = userID;
        this.farmID = farmID;
    }

    @Override
    public String toString() {
        return "deviceID: "+deviceID+", deviceTypeID: "+deviceTypeID+", deviceName: "+deviceName+", status: "+status+", plotID: "+plotID+", user_id: "+this.userID+", FarmID: "+this.farmID+'\n';
    }

    public Long getDeviceID() {
        return deviceID;
    }

    public void setDeviceID(Long deviceID) {
        this.deviceID = deviceID;
    }

    public Integer getDeviceTypeID() {
        return deviceTypeID;
    }

    public void setDeviceTypeID(Integer deviceTypeID) {
        this.deviceTypeID = deviceTypeID;
    }

    public String getDeviceName() {
        return deviceName;
    }

    public void setDeviceName(String deviceName) {
        this.deviceName = deviceName;
    }

    public Integer getPlotID() {
        return plotID;
    }

    public void setPlotID(Integer plotID) {
        this.plotID = plotID;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public void setUserID (Long userID) {
        this.userID = userID;
    }
    public void setFarmID (Long farmID) {
        this.farmID = farmID;
    }
    public Long getUserID () {
        return this.userID;
    }
    public Long getFarmID () {
        return this.farmID;
    }

}
