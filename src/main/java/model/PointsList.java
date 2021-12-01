package model;

import java.util.ArrayList;
import java.util.List;

public class PointsList {
    private List<Point> points;

    public PointsList(){
        this.points = new ArrayList<>();
    }

    public PointsList(List<Point> points){
        this.points = points;
    }

    public List<Point> getPoints() {
        return points;
    }

    public void setPoints(List<Point> points) {
        this.points = points;
    }
}
