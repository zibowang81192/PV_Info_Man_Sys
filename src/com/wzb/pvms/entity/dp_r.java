package com.wzb.pvms.entity;

public class dp_r {
    private int DPNO;
    private int PNO;
    private int DNO;

    public dp_r(int DPNO, int PNO, int DNO) {
        this.DPNO = DPNO;
        this.PNO = PNO;
        this.DNO = DNO;
    }

    public void setDPNO(int DPNO) {
        this.DPNO = DPNO;
    }

    public void setPNO(int PNO) {
        this.PNO = PNO;
    }

    public void setDNO(int DNO) {
        this.DNO = DNO;
    }

    public int getDPNO() {
        return DPNO;
    }

    public int getPNO() {
        return PNO;
    }

    public int getDNO() {
        return DNO;
    }
}

