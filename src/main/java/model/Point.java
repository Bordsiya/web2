package model;

import java.io.Serializable;

public class Point implements Serializable {
    private double xValue;
    private double yValue;
    private double rValue;
    private String currentTime;
    private String workingTime;
    private boolean isHit;

    public Point(){
        this.xValue = 0.0;
        this.yValue = 0.0;
        this.rValue = 0.0;
        this.currentTime = "";
        this.workingTime = "";
        this.isHit = false;
    }

    public Point(double xValue, double yValue, double rValue, String currentTime, String workingTime, boolean isHit){
        this.xValue = xValue;
        this.yValue = yValue;
        this.rValue = rValue;
        this.currentTime = currentTime;
        this.workingTime = workingTime;
        this.isHit = isHit;
    }

    public double getXValue() {
        return xValue;
    }

    public double getYValue() {
        return yValue;
    }

    public double getRValue() {
        return rValue;
    }

    public String getCurrentTime() {
        return currentTime;
    }

    public String getWorkingTime() {
        return workingTime;
    }

    public boolean getIsHit(){
        return isHit;
    }

    public void setXValue(double xValue) {
        this.xValue = xValue;
    }

    public void setYValue(double yValue) {
        this.yValue = yValue;
    }

    public void setRValue(double rValue) {
        this.rValue = rValue;
    }

    public void setCurrentTime(String currentTime) {
        this.currentTime = currentTime;
    }

    public void setWorkingTime(String workingTime) {
        this.workingTime = workingTime;
    }

    public void setIsHit(boolean isHit){
        this.isHit = isHit;
    }

}
