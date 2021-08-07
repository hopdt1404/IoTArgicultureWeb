package model;

import java.sql.Timestamp;

public class PlantDevice {
    private Long id;
    public Long getId()
    {
        return this.id;
    }
    public void setId(Long value)
    {
        this.id = value;
    }

    private Long plant_id;
    public Long getPlantId()
    {
        return this.plant_id;
    }
    public void setPlantId(Long value)
    {
        this.plant_id = value;
    }

    private Long DeviceID;
    public Long getDeviceID()
    {
        return this.DeviceID;
    }
    public void setDeviceID(Long value)
    {
        this.DeviceID = value;
    }

    private Long FarmID;
    public Long getFarmID()
    {
        return this.FarmID;
    }
    public void setFarmID(Long value)
    {
        this.FarmID = value;
    }

    private Integer status;
    public Integer getStatus()
    {
        return this.status;
    }
    public void setStatus(Integer value)
    {
        this.status = value;
    }

    private Timestamp created_at;
    public Timestamp getCreatedAt()
    {
        return this.created_at;
    }
    public void setCreatedAt(Timestamp value)
    {
        this.created_at = value;
    }

    private String created_user;
    public String getCreatedUser()
    {
        return this.created_user;
    }
    public void setCreatedUser(String value)
    {
        this.created_user = value;
    }

    private Timestamp updated_at;
    public Timestamp getUpdatedAt()
    {
        return this.updated_at;
    }
    public void setUpdatedAt(Timestamp value)
    {
        this.updated_at = value;
    }

    private String updated_user;
    public String getUpdatedUser()
    {
        return this.updated_user;
    }
    public void setUpdatedUser(String value)
    {
        this.updated_user = value;
    }


    public PlantDevice(Long id_,Long plant_id,Long DeviceID_,Long FarmID_,Integer status_,Timestamp created_at_,String created_user_,Timestamp updated_at_,String updated_user_)
    {
        this.id = id_;
        this.plant_id = plant_id;
        this.DeviceID = DeviceID_;
        this.FarmID = FarmID_;
        this.status = status_;
        this.created_at = created_at_;
        this.created_user = created_user_;
        this.updated_at = updated_at_;
        this.updated_user = updated_user_;
    }

//    public String toString() {
//
//    }
}
