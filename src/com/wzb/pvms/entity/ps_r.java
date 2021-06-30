package com.wzb.pvms.entity;

public class ps_r {
    private int PSNO;
    private int PNO;
    private int FNO;

    public ps_r(int PSNO, int PNO, int FNO) {
        this.PSNO = PSNO;
        this.PNO = PNO;
        this.FNO = FNO;
    }

    public void setPSNO(int PSNO) {
        this.PSNO = PSNO;
    }

    public void setPNO(int PNO) {
        this.PNO = PNO;
    }

    public void setFNO(int FNO) {
        this.FNO = FNO;
    }

    public int getPSNO() {
        return PSNO;
    }

    public int getPNO() {
        return PNO;
    }

    public int getFNO() {
        return FNO;
    }
}
