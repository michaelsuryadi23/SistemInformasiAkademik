package com.rpll.model;
// Generated Apr 8, 2013 1:49:51 PM by Hibernate Tools 3.2.1.GA



/**
 * LecturesEduId generated by hbm2java
 */
public class LecturesEduId  implements java.io.Serializable {


     private int lectureId;
     private String eduDescription;

    public LecturesEduId() {
    }

    public LecturesEduId(int lectureId, String eduDescription) {
       this.lectureId = lectureId;
       this.eduDescription = eduDescription;
    }
   
    public int getLectureId() {
        return this.lectureId;
    }
    
    public void setLectureId(int lectureId) {
        this.lectureId = lectureId;
    }
    public String getEduDescription() {
        return this.eduDescription;
    }
    
    public void setEduDescription(String eduDescription) {
        this.eduDescription = eduDescription;
    }


   public boolean equals(Object other) {
         if ( (this == other ) ) return true;
		 if ( (other == null ) ) return false;
		 if ( !(other instanceof LecturesEduId) ) return false;
		 LecturesEduId castOther = ( LecturesEduId ) other; 
         
		 return (this.getLectureId()==castOther.getLectureId())
 && ( (this.getEduDescription()==castOther.getEduDescription()) || ( this.getEduDescription()!=null && castOther.getEduDescription()!=null && this.getEduDescription().equals(castOther.getEduDescription()) ) );
   }
   
   public int hashCode() {
         int result = 17;
         
         result = 37 * result + this.getLectureId();
         result = 37 * result + ( getEduDescription() == null ? 0 : this.getEduDescription().hashCode() );
         return result;
   }   


}


