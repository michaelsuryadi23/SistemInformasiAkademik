package com.rpll.model;
// Generated Apr 26, 2013 8:19:43 PM by Hibernate Tools 3.2.1.GA



/**
 * TeachPeriod generated by hbm2java
 */
public class TeachPeriod  implements java.io.Serializable {


     private TeachPeriodId id;
     private Matkul matkul;
     private Lectures lectures;
     private Periods periods;

    public TeachPeriod() {
    }

    public TeachPeriod(TeachPeriodId id, Matkul matkul, Lectures lectures, Periods periods) {
       this.id = id;
       this.matkul = matkul;
       this.lectures = lectures;
       this.periods = periods;
    }
   
    public TeachPeriodId getId() {
        return this.id;
    }
    
    public void setId(TeachPeriodId id) {
        this.id = id;
    }
    public Matkul getMatkul() {
        return this.matkul;
    }
    
    public void setMatkul(Matkul matkul) {
        this.matkul = matkul;
    }
    public Lectures getLectures() {
        return this.lectures;
    }
    
    public void setLectures(Lectures lectures) {
        this.lectures = lectures;
    }
    public Periods getPeriods() {
        return this.periods;
    }
    
    public void setPeriods(Periods periods) {
        this.periods = periods;
    }




}


