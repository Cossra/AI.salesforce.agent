public with sharing class LeadDataController {
    @AuraEnabled(cacheable=true)
    public static List<Lead> getLeads() {
        return [
            SELECT Id, Name, Company, Industry, Description, Status
            FROM Lead
            WHERE IsConverted = false
            LIMIT 10
        ];
    }
}
