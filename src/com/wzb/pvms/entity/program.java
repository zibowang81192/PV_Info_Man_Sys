package com.wzb.pvms.entity;

import java.util.Date;

public class program {
    private int PNO;
    private String PNAME;
    private String PTYPE;
    private String PTERM;
    private String POWNER;
    private String PFIRM;
    private int PYEAR;
    private int PMONTH;

    public program(int PNO, String PNAME, String PTYPE, String PTERM,
                   String POWNER, String PFIRM, int PYEAR, int PMONTH) {
        this.PNO = PNO;
        this.PNAME = PNAME;
        this.PTYPE = PTYPE;
        this.PTERM = PTERM;
        this.POWNER = POWNER;
        this.PFIRM = PFIRM;
        this.PYEAR = PYEAR;
        this.PMONTH = PMONTH;
    }

    public void setPNO(int PNO) {
        this.PNO = PNO;
    }

    public void setPNAME(String PNAME) {
        this.PNAME = PNAME;
    }

    public void setPTYPE(String PTYPE) {
        this.PTYPE = PTYPE;
    }

    public void setPTERM(String PTERM) {
        this.PTERM = PTERM;
    }

    public void setPOWNER(String POWNER) {
        this.POWNER = POWNER;
    }

    public void setPFIRM(String PFIRM) {
        this.PFIRM = PFIRM;
    }

    public void setPYEAR(int PYEAR) {
        this.PYEAR = PYEAR;
    }

    public void setPMONTH(int PMONTH) {
        this.PMONTH = PMONTH;
    }

    public int getPNO() {
        return PNO;
    }

    public String getPNAME() {
        return PNAME;
    }

    public String getPTYPE() {
        return PTYPE;
    }

    public String getPTERM() {
        return PTERM;
    }

    public String getPOWNER() {
        return POWNER;
    }

    public String getPFIRM() {
        return PFIRM;
    }

    public int getPYEAR() {
        return PYEAR;
    }

    public int getPMONTH() {
        return PMONTH;
    }

    @Override
    public String toString() {
        return "program{" +
                "PNO=" + PNO +
                ", PNAME='" + PNAME + '\'' +
                ", PTYPE='" + PTYPE + '\'' +
                ", PTERM='" + PTERM + '\'' +
                ", POWNER='" + POWNER + '\'' +
                ", PFIRM='" + PFIRM + '\'' +
                ", PYEAR=" + PYEAR +
                ", PMONTH=" + PMONTH +
                '}';
    }
}
