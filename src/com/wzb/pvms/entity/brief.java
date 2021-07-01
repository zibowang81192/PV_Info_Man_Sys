package com.wzb.pvms.entity;

public class brief {
    private int PNO;
    private String PNAME;
    private String DNAME;

    public brief(int PNO, String PNAME, String DNAME) {
        this.PNO = PNO;
        this.PNAME = PNAME;
        this.DNAME = DNAME;
    }

    public void setPNO(int PNO) {
        this.PNO = PNO;
    }

    public void setPNAME(String PNAME) {
        this.PNAME = PNAME;
    }

    public void setDNAME(String DNAME) {
        this.DNAME = DNAME;
    }

    public int getPNO() {
        return PNO;
    }

    public String getPNAME() {
        return PNAME;
    }

    public String getDNAME() {
        return DNAME;
    }
}
