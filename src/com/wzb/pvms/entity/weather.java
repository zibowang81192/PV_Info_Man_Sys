package com.wzb.pvms.entity;

public class weather {
    private int WNO;
    private double LSRA_MJ;
    private double LSRA_KWH;
    private int BRA;
    private double YMAT;
    private double YHT;
    private double YLT;
    private double HMMT;
    private int MDFS;
    private double AWS;
    private double EWS;
    private double ATD;
    private int PC;

    public weather(int WNO, double LSRA_MJ, double LSRA_KWH, int BRA, double YMAT, double YHT, double YLT,
                   double HMMT, int MDFS, double AWS, double EWS, double ATD, int PC) {
        this.WNO = WNO;
        this.LSRA_MJ = LSRA_MJ;
        this.LSRA_KWH = LSRA_KWH;
        this.BRA = BRA;
        this.YMAT = YMAT;
        this.YHT = YHT;
        this.YLT = YLT;
        this.HMMT = HMMT;
        this.MDFS = MDFS;
        this.AWS = AWS;
        this.EWS = EWS;
        this.ATD = ATD;
        this.PC = PC;
    }

    public void setWNO(int WNO) {
        this.WNO = WNO;
    }

    public void setLSRA_MJ(double LSRA_MJ) {
        this.LSRA_MJ = LSRA_MJ;
    }

    public void setLSRA_KWH(double LSRA_KWH) {
        this.LSRA_KWH = LSRA_KWH;
    }

    public void setBRA(int BRA) {
        this.BRA = BRA;
    }

    public void setYMAT(double YMAT) {
        this.YMAT = YMAT;
    }

    public void setYHT(double YHT) {
        this.YHT = YHT;
    }

    public void setYLT(double YLT) {
        this.YLT = YLT;
    }

    public void setHMMT(double HMMT) {
        this.HMMT = HMMT;
    }

    public void setMDFS(int MDFS) {
        this.MDFS = MDFS;
    }

    public void setAWS(double AWS) {
        this.AWS = AWS;
    }

    public void setEWS(double EWS) {
        this.EWS = EWS;
    }

    public void setATD(double ATD) {
        this.ATD = ATD;
    }

    public void setPC(int PC) {
        this.PC = PC;
    }

    public int getWNO() {
        return WNO;
    }

    public double getLSRA_MJ() {
        return LSRA_MJ;
    }

    public double getLSRA_KWH() {
        return LSRA_KWH;
    }

    public int getBRA() {
        return BRA;
    }

    public double getYMAT() {
        return YMAT;
    }

    public double getYHT() {
        return YHT;
    }

    public double getYLT() {
        return YLT;
    }

    public double getHMMT() {
        return HMMT;
    }

    public int getMDFS() {
        return MDFS;
    }

    public double getAWS() {
        return AWS;
    }

    public double getEWS() {
        return EWS;
    }

    public double getATD() {
        return ATD;
    }

    public int getPC() {
        return PC;
    }
}
