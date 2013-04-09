package com.rpll.model;
// Generated Apr 8, 2013 1:49:51 PM by Hibernate Tools 3.2.1.GA



/**
 * MarksId generated by hbm2java
 */
public class MarksId  implements java.io.Serializable {


     private int studentId;
     private int matkulId;
     private int periodId;

    public MarksId() {
    }

    public MarksId(int studentId, int matkulId, int periodId) {
       this.studentId = studentId;
       this.matkulId = matkulId;
       this.periodId = periodId;
    }
   
    public int getStudentId() {
        return this.studentId;
    }
    
    public void setStudentId(int studentId) {
        this.studentId = studentId;
    }
    public int getMatkulId() {
        return this.matkulId;
    }
    
    public void setMatkulId(int matkulId) {
        this.matkulId = matkulId;
    }
    public int getPeriodId() {
        return this.periodId;
    }
    
    public void setPeriodId(int periodId) {
        this.periodId = periodId;
    }


   public boolean equals(Object other) {
         if ( (this == other ) ) return true;
		 if ( (other == null ) ) return false;
		 if ( !(other instanceof MarksId) ) return false;
		 MarksId castOther = ( MarksId ) other; 
         
		 return (this.getStudentId()==castOther.getStudentId())
 && (this.getMatkulId()==castOther.getMatkulId())
 && (this.getPeriodId()==castOther.getPeriodId());
   }
   
   public int hashCode() {
         int result = 17;
         
         result = 37 * result + this.getStudentId();
         result = 37 * result + this.getMatkulId();
         result = 37 * result + this.getPeriodId();
         return result;
   }   


}


