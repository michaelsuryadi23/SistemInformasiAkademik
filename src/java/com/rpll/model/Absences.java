package com.rpll.model;
// Generated Apr 26, 2013 8:19:43 PM by Hibernate Tools 3.2.1.GA



/**
 * Absences generated by hbm2java
 */
public class Absences  implements java.io.Serializable {


     private AbsencesId id;
     private Matkul matkul;
     private Students students;
     private Periods periods;
     private int absenceStatus;

    public Absences() {
    }

    public Absences(AbsencesId id, Matkul matkul, Students students, Periods periods, int absenceStatus) {
       this.id = id;
       this.matkul = matkul;
       this.students = students;
       this.periods = periods;
       this.absenceStatus = absenceStatus;
    }
   
    public AbsencesId getId() {
        return this.id;
    }
    
    public void setId(AbsencesId id) {
        this.id = id;
    }
    public Matkul getMatkul() {
        return this.matkul;
    }
    
    public void setMatkul(Matkul matkul) {
        this.matkul = matkul;
    }
    public Students getStudents() {
        return this.students;
    }
    
    public void setStudents(Students students) {
        this.students = students;
    }
    public Periods getPeriods() {
        return this.periods;
    }
    
    public void setPeriods(Periods periods) {
        this.periods = periods;
    }
    public int getAbsenceStatus() {
        return this.absenceStatus;
    }
    
    public void setAbsenceStatus(int absenceStatus) {
        this.absenceStatus = absenceStatus;
    }




}


