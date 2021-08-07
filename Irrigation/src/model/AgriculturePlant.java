package model;

import org.apache.commons.net.ntp.TimeStamp;
import org.datavec.api.writable.Text;
import org.joda.time.DateTime;

import java.sql.Timestamp;

public class AgriculturePlant {
    private Long id;
    private Long plantId;
    private Integer plantStateId;
    private Long farmId;
    private Long userId;
    private Integer growthPeriod;
    private Float temperature;
    private Float moisture;
    private String light;
    private String note;
    private Timestamp createdAt;
    private String createdUser;
    private Timestamp updatedAt;
    private String updatedUser;

    // Construct create AgriculturePlant from AgriculturePlant
    public AgriculturePlant(AgriculturePlant agriculturePlant)
    {
        this.id = agriculturePlant.id;
        this.plantId = agriculturePlant.plantId;
        this.plantStateId = agriculturePlant.plantStateId;
        this.farmId = agriculturePlant.farmId;
        this.userId = agriculturePlant.userId;
        this.growthPeriod = agriculturePlant.growthPeriod;
        this.temperature = agriculturePlant.temperature;
        this.moisture = agriculturePlant.moisture;
        this.light = agriculturePlant.light;
        this.note = agriculturePlant.note;
        this.createdAt = agriculturePlant.createdAt;
        this.createdUser = agriculturePlant.createdUser;
        this.updatedAt = agriculturePlant.updatedAt;
        this.updatedUser = agriculturePlant.updatedUser;
    }

    public AgriculturePlant(Long id, Long plantId,
                            Integer plantStateId, Long farmId,
                            Long userId, Integer growthPeriod,
                            Float temperature, Float moisture,
                            String  light, String  note, Timestamp createdAt,
                            String createdUser, Timestamp updatedAt, String updatedUser ) {
        this.id = id;
        this.plantId = plantId;
        this.plantStateId = plantStateId;
        this.farmId = farmId;
        this.userId = userId;
        this.growthPeriod = growthPeriod;
        this.temperature = temperature;
        this.moisture = moisture;
        this.light = light;
        this.note = note;
        this.createdAt = createdAt;
        this.createdUser = createdUser;
        this.updatedAt = updatedAt;
        this.updatedUser = updatedUser;

    }

//    public AgriculturePlant(long id, long plant_id, int plant_state_id, long farmID, long user_id, int growth_period, Timestamp updated_at, String light, String note, float temperature, Timestamp created_at, float moisture, String updated_user, String created_user) {
//    }

    @Override
    public String toString() {
        System.out.println("AgriculturePlant Model: \n");
        return "id: "+this.id+", plantId: "+this.plantId+
                ", plantStateId: "+this.plantStateId+", farmId: "+this.farmId+
                ", userId: "+this.userId+", growthPeriod: "+this.growthPeriod+
                ", temperature: "+this.temperature+'\n' +", moisture" + this.moisture+
                ", light" + this.light+", note" + this.note+
                ", createdAt" + this.createdAt+", createdUser" + this.createdUser+
                ", updatedAt" + this.updatedAt+", updatedUser" + this.updatedUser;
    }

    public Long getId() {
        return this.id;
    }
    public Long getPlantId() {
        return this.plantId;
    }
    public Integer getPlantStateId () {
        return this.plantStateId;
    }
    public Long getFarmId () {
        return this.farmId;
    }
    public Long getUserId() {
        return this.userId;
    }
    public Integer getGrowthPeriod() {
        return this.growthPeriod;
    }
    public Float getTemperature() {
        return this.temperature;
    }
    public Float getMoisture() {
        return this.moisture;
    }
    public String  getLight() {
        return this.light;
    }
    public String getNote() {
        return this.note;
    }
    public Timestamp getCreatedAt() {
        return this.createdAt;
    }
    public String getCreatedUser() {
        return this.createdUser;
    }
    public Timestamp getUpdatedAt() {
        return this.updatedAt;
    }
    public String getUpdatedUser() {
        return this.updatedUser;
    }

    public void setId(Long id) {
        this.id = id;
    }
    public void setPlantId(Long plantId) {
        this.plantId = plantId;
    }
    public void setPlantStateId(Integer plantStateId) {
        this.plantStateId = plantStateId;
    }
    public void setFarmId(Long farmId) {
        this.farmId = farmId;
    }
    public void setUserId(Long userId) {
        this.userId = userId;
    }

}
