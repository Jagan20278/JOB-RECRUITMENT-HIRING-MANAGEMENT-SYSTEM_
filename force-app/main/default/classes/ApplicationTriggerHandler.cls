public with sharing class ApplicationTriggerHandler {
    
    public static void handleBeforeInsert(List<Application__c> newApplications) {
        
        // Step 1: Collect the IDs of all Candidates and Jobs from the new applications.
        Set<Id> candidateIds = new Set<Id>();
        Set<Id> jobIds = new Set<Id>();

        for (Application__c app : newApplications) {
            // Only consider applications that have both a Candidate and a Job.
            if (app.Candidate__c != null && app.Job__c != null) {
                candidateIds.add(app.Candidate__c);
                jobIds.add(app.Job__c);
            }
        }

        // If there are no IDs to check, exit the method early.
        if (candidateIds.isEmpty()) {
            return;
        }

        // Step 2: Query for all existing applications that match ANY of the candidates and jobs.
        // This is a single, efficient query that avoids the error.
        List<Application__c> existingApplications = [
            SELECT Candidate__c, Job__c 
            FROM Application__c 
            WHERE Candidate__c IN :candidateIds
            AND Job__c IN :jobIds
        ];
        
        // Step 3: Create a set of unique keys for the applications ALREADY in the database.
        Set<String> existingKeys = new Set<String>();
        for(Application__c existingApp : existingApplications) {
            String key = existingApp.Candidate__c + '-' + existingApp.Job__c;
            existingKeys.add(key);
        }

        // Step 4: Loop through the NEW applications again and check for duplicates.
        for (Application__c app : newApplications) {
            String key = app.Candidate__c + '-' + app.Job__c;
            
            // If the key for a new application is already in our set of existing keys...
            if (existingKeys.contains(key)) {
                // ...add an error to that specific record to prevent it from saving.
                app.addError('An application for this candidate and job already exists.');
            }
        }
    }
}