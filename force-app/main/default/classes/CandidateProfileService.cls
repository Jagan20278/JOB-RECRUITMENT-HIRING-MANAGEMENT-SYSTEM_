public with sharing class CandidateProfileService {

    @AuraEnabled(cacheable=true)
    public static String getProfileData(Id candidateId) {
        // We now use the direct URL instead of a Named Credential.
        String endpoint = 'https://jsonplaceholder.typicode.com/users/1';

        HttpRequest request = new HttpRequest();
        request.setEndpoint(endpoint);
        request.setMethod('GET');

        Http http = new Http();
        HttpResponse response = http.send(request);

        if (response.getStatusCode() == 200) {
            return response.getBody();
        } else {
            throw new CalloutException('API call failed with status code: ' + response.getStatusCode());
        }
    }
}