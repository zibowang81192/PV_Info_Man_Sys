package com.wzb.pvms.entity;

public class designer {
    private int DNO;
    private String DNAME;

    public designer(int DNO, String DNAME) {
        this.DNO = DNO;
        this.DNAME = DNAME;
    }

    public void setDNO(int DNO) {
        this.DNO = DNO;
    }

    public void setDNAME(String DNAME) {
        this.DNAME = DNAME;
    }

    public int getDNO() {
        return DNO;
    }

    public String getDNAME() {
        return DNAME;
    }
}
