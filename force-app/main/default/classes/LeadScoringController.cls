public with sharing class LeadScoringController {
    @AuraEnabled(cacheable=false)
    public static Integer getLeadScore(String leadName, String company, String industry, String description) {
        // Simulate AI scoring (we'll replace this with a real API call later)
        Integer score = Math.mod(Crypto.getRandomInteger(), 100);
        return score;
    }
}
