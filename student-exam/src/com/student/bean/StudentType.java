package com.student.bean;

public class StudentType {
    private Integer id;

    private Integer stuid;

    private Integer typeid;

    private Integer mark;

    private String status;

    private String time;

    private String baotime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getStuid() {
        return stuid;
    }

    public void setStuid(Integer stuid) {
        this.stuid = stuid;
    }

    public Integer getTypeid() {
        return typeid;
    }

    public void setTypeid(Integer typeid) {
        this.typeid = typeid;
    }

    public Integer getMark() {
        return mark;
    }

    public void setMark(Integer mark) {
        this.mark = mark;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status == null ? null : status.trim();
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time == null ? null : time.trim();
    }

    public String getBaotime() {
        return baotime;
    }

    public void setBaotime(String baotime) {
        this.baotime = baotime == null ? null : baotime.trim();
    }
}