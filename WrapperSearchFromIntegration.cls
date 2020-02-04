public with sharing class WrapperSearchFromIntegration {
    @AuraEnabled public String RollNo;
    @AuraEnabled public String FirstName;
    @AuraEnabled public String LastName;
    @AuraEnabled public String Email;
    @AuraEnabled public List<ExamReport> ExamReportList;
    @AuraEnabled public Boolean isExpanded=false;

    public class ExamReport{
        @AuraEnabled public String subjectCode;
        @AuraEnabled public String marks;
        @AuraEnabled public String grade;  

        public ExamReport(String subjectCode,String marks, String grade) {
            this.subjectCode = subjectCode;
            this.marks = marks;
            this.grade = grade;
        }
    }

}
