package com.wzb.pvms.entity;

public class site_factory {
    private int FNO;
    private String LOC;
    private String FCHARACTER;
    private String PROVINCE;
    private String CITY;
    private String COUNTRY;
    private double CAPACITY;
    private double AREA;
    private int ALTITUDE_MAX;
    private int ALTITUDE_MIN;
    private double LONGITUDE;
    private String LONGITUDE_EORW;
    private double LATITUDE;
    private String LATITUDE_NORS;

    public site_factory(int FNO, String LOC, String FCHARACTER, String PROVINCE, String CITY, String COUNTRY, double CAPACITY, double AREA, int ALTITUDE_MAX, int ALTITUDE_MIN, double LONGITUDE,
                        String LONGITUDE_EORW, double LATITUDE, String LATITUDE_NORS) {
        this.FNO = FNO;
        this.LOC = LOC;
        this.FCHARACTER = FCHARACTER;
        this.PROVINCE = PROVINCE;
        this.CITY = CITY;
        this.COUNTRY = COUNTRY;
        this.CAPACITY = CAPACITY;
        this.AREA = AREA;
        this.ALTITUDE_MAX = ALTITUDE_MAX;
        this.ALTITUDE_MIN = ALTITUDE_MIN;
        this.LONGITUDE = LONGITUDE;
        this.LONGITUDE_EORW = LONGITUDE_EORW;
        this.LATITUDE = LATITUDE;
        this.LATITUDE_NORS = LATITUDE_NORS;
    }

    public void setFNO(int FNO) {
        this.FNO = FNO;
    }

    public void setLOC(String LOC) {
        this.LOC = LOC;
    }

    public void setFCHARACTER(String FCHARACTER) {
        this.FCHARACTER = FCHARACTER;
    }

    public void setPROVINCE(String PROVINCE) {
        this.PROVINCE = PROVINCE;
    }

    public void setCITY(String CITY) {
        this.CITY = CITY;
    }

    public void setCOUNTRY(String COUNTRY) {
        this.COUNTRY = COUNTRY;
    }

    public void setCAPACITY(double CAPACITY) {
        this.CAPACITY = CAPACITY;
    }

    public void setAREA(double AREA) {
        this.AREA = AREA;
    }

    public void setALTITUDE_MAX(int ALTITUDE_MAX) {
        this.ALTITUDE_MAX = ALTITUDE_MAX;
    }

    public void setALTITUDE_MIN(int ALTITUDE_MIN) {
        this.ALTITUDE_MIN = ALTITUDE_MIN;
    }

    public void setLONGITUDE(double LONGITUDE) {
        this.LONGITUDE = LONGITUDE;
    }

    public void setLONGITUDE_EORW(String LONGITUDE_EORW) {
        this.LONGITUDE_EORW = LONGITUDE_EORW;
    }

    public void setLATITUDE(double LATITUDE) {
        this.LATITUDE = LATITUDE;
    }

    public void setLATITUDE_NORS(String LATITUDE_NORS) {
        this.LATITUDE_NORS = LATITUDE_NORS;
    }

    public int getFNO() {
        return FNO;
    }

    public String getLOC() {
        return LOC;
    }

    public String getFCHARACTER() {
        return FCHARACTER;
    }

    public String getPROVINCE() {
        return PROVINCE;
    }

    public String getCITY() {
        return CITY;
    }

    public String getCOUNTRY() {
        return COUNTRY;
    }

    public double getCAPACITY() {
        return CAPACITY;
    }

    public double getAREA() {
        return AREA;
    }

    public int getALTITUDE_MAX() {
        return ALTITUDE_MAX;
    }

    public int getALTITUDE_MIN() {
        return ALTITUDE_MIN;
    }

    public double getLONGITUDE() {
        return LONGITUDE;
    }

    public String getLONGITUDE_EORW() {
        return LONGITUDE_EORW;
    }

    public double getLATITUDE() {
        return LATITUDE;
    }

    public String getLATITUDE_NORS() {
        return LATITUDE_NORS;
    }

    @Override
    public String toString() {
        return "site_factory{" +
                "FNO=" + FNO +
                ", LOC='" + LOC + '\'' +
                ", FCHARACTER='" + FCHARACTER + '\'' +
                ", PROVINCE='" + PROVINCE + '\'' +
                ", CITY='" + CITY + '\'' +
                ", COUNTRY='" + COUNTRY + '\'' +
                ", CAPACITY=" + CAPACITY +
                ", AREA=" + AREA +
                ", ALTITUDE_MAX=" + ALTITUDE_MAX +
                ", ALTITUDE_MIN=" + ALTITUDE_MIN +
                ", LONGITUDE=" + LONGITUDE +
                ", LONGITUDE_EROW='" + LONGITUDE_EORW + '\'' +
                ", LATITUDE=" + LATITUDE +
                ", LATITUDE_NORS='" + LATITUDE_NORS + '\'' +
                '}';
    }
}
