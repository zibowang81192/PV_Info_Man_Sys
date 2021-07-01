package com.wzb.pvms.entity;

public class sw_r {
    private int SWNO;
    private int FNO;
    private int WNO;

    public sw_r(int SWNO, int FNO, int WNO) {
        this.SWNO = SWNO;
        this.FNO = FNO;
        this.WNO = WNO;
    }

    public void setSWNO(int SWNO) {
        this.SWNO = SWNO;
    }

    public void setFNO(int FNO) {
        this.FNO = FNO;
    }

    public void setWNO(int WNO) {
        this.WNO = WNO;
    }

    public int getSWNO() {
        return SWNO;
    }

    public int getFNO() {
        return FNO;
    }

    public int getWNO() {
        return WNO;
    }
}
