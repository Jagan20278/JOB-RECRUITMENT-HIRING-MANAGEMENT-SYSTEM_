public with sharing class jobSearchController {
    @AuraEnabled(cacheable=true)
    // The method now accepts a 'searchKey' string from the LWC
    public static List<Job__c> findOpenJobs(String searchKey) {
        // If the search key is not blank, add wildcards (%) for a partial match search.
        // Otherwise, make the key a wildcard to find all jobs.
        String searchKeyWithWildcards = '%' + searchKey + '%';

        return [
            SELECT Id, Name, Hiring_Manager__r.Name
            FROM Job__c
            WHERE Status__c = 'Open'
            AND Name LIKE :searchKeyWithWildcards
            ORDER BY CreatedDate DESC
        ];
    }
}