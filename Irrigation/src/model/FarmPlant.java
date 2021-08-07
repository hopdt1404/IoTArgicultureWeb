package model;

import java.sql.Timestamp;

public class FarmPlant {
    Long id;
    Long FarmID;
    Long plant_id;
    Long user_id;
    Timestamp start_time_season;
    Timestamp end_time_season;
    Integer current_plant_state;
    Integer current_growth_day;
    Integer total_growth_day;
    Integer status;
    Timestamp created_at;
    String created_user;
    Timestamp updated_at;
    String updated_user;
    public Long getId()
    {
        return this.id;
    }
    public void setId(Long value)
    {
        this.id = value;
    }
    public Long getFarmID()
    {
        return this.FarmID;
    }
    public void setFarmID(Long value)
    {
        this.FarmID = value;
    }
    public Long getPlantId()
    {
        return this.plant_id;
    }
    public void setPlantIdd(Long value)
    {
        this.plant_id = value;
    }
    public Long getUserId()
    {
        return this.user_id;
    }
    public void setUserId(Long value)
    {
        this.user_id = value;
    }
    public Timestamp getStartTimeSeason()
    {
        return this.start_time_season;
    }
    public void setStartTimeSeason(Timestamp value)
    {
        this.start_time_season = value;
    }
    public Timestamp getEndTimeSeason()
    {
        return this.end_time_season;
    }
    public void setEndTimeSeason(Timestamp value)
    {
        this.end_time_season = value;
    }
    public Integer getCurrentPlantState()
    {
        return this.current_plant_state;
    }
    public void setCurrentPlantState(Integer value)
    {
        this.current_plant_state = value;
    }
    public Integer getCurrentGrowthDay()
    {
        return this.current_growth_day;
    }
    public void setCurrentGrowthDay(Integer value)
    {
        this.current_growth_day = value;
    }
    public Integer getTotalGrowthDay()
    {
        return this.total_growth_day;
    }
    public void setTotalGrowthDay(Integer value)
    {
        this.total_growth_day = value;
    }
    public Integer getStatus()
    {
        return this.status;
    }
    public void setStatus(Integer value)
    {
        this.status = value;
    }
    public Timestamp getCreatedAt()
    {
        return this.created_at;
    }
    public void setCreatedAt(Timestamp value)
    {
        this.created_at = value;
    }
    public String getCreatedUser()
    {
        return this.created_user;
    }
    public void setCreatedUser(String value)
    {
        this.created_user = value;
    }
    public Timestamp getUpdatedAt()
    {
        return this.updated_at;
    }
    public void setUpdatedAt(Timestamp value)
    {
        this.updated_at = value;
    }
    public String getUpdatedUser()
    {
        return this.updated_user;
    }
    public void setUpdatedUser(String value)
    {
        this.updated_user = value;
    }

    public FarmPlant (Long id, Long farmID, Long plant_id, Long user_id,
                      Timestamp start_time_season, Timestamp end_time_season,
                      Integer current_plant_state, Integer current_growth_day,
                      Integer total_growth_day, Integer status,
                      Timestamp created_at, String created_user,
                      Timestamp updated_at, String updated_user) {
        this.id = id;
        this.FarmID = farmID;
        this.plant_id = plant_id;
        this.user_id = user_id;
        this.start_time_season = start_time_season;
        this.end_time_season = end_time_season;
        this.current_growth_day = current_growth_day;
        this.current_plant_state = current_plant_state;
        this.total_growth_day = total_growth_day;
        this.status = status;
        this.created_at = created_at;
        this.created_user = created_user;
        this.updated_at = updated_at;
        this.updated_user = updated_user;
    }
}
