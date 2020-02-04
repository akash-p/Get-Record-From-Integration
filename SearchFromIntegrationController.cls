public with sharing class SearchFromIntegrationController {
    @AuraEnabled(cacheable=true)
    public static List<WrapperSearchFromIntegration> getRecord(String firstName){
        String jsonStr = '[{"RollNo":"1","FirstName":"'+firstName+'","LastName":"lastnameHardCoded","Email":"XYZHardCoded","ExamReportList":[{"subjectCode":"Ford","marks":"10","grade":"B"},{"subjectCode":"BMW","marks":"20","grade":"A"},{"subjectCode":"Fiat","marks":"30","grade":"A+"}]},{"RollNo":"2","FirstName":"'+firstName+'2","LastName":"lastnameHardCoded2","Email":"XYZHardCoded2","ExamReportList":[{"subjectCode":"Ford","marks":"40","grade":"B"},{"subjectCode":"BMW","marks":"50","grade":"A"},{"subjectCode":"Fiat","marks":"60","grade":"A+"}]}]';
       // String jsonStr = '';
        List<WrapperSearchFromIntegration> recList = (List<WrapperSearchFromIntegration>) System.JSON.deserialize(jsonStr, List<WrapperSearchFromIntegration>.class);
        
        for(WrapperSearchFromIntegration rec : recList){
            rec.isExpanded = false;
        }
        System.debug('Result -> '+recList);
        System.debug('recList.size() -> '+recList.size());
        return recList;
    }
}
