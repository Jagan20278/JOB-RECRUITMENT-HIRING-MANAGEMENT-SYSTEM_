public class WeeklyApplicationReminderBatch implements Database.Batchable<sObject> {

    // The START method gathers the records to be processed.
    public Database.QueryLocator start(Database.BatchableContext bc) {
        // This query finds all applications that need a reminder.
        // It gets all the fields we need to build the email.
        return Database.getQueryLocator([
            SELECT Candidate__r.Name, Candidate__r.Email__c, Job__r.Name
            FROM Application__c
            WHERE Status__c IN ('Screening', 'Interview') AND Candidate__r.Email__c != null
        ]);
    }

    // The EXECUTE method runs for each "chunk" of records.
    public void execute(Database.BatchableContext bc, List<Application__c> scope) {
        
        // Create a list to hold all the emails we're about to build.
        List<Messaging.SingleEmailMessage> emailsToSend = new List<Messaging.SingleEmailMessage>();

        // Loop through each Application record in the current chunk.
        for (Application__c app : scope) {
            // Create a new email message object.
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            
            // Set the recipient's email address.
            mail.setToAddresses(new List<String>{ app.Candidate__r.Email__c });
            
            // Build the subject string manually.
            String subject = 'An update on your application for the ' + app.Job__r.Name + ' position';
            mail.setSubject(subject);
            
            // Build the email body string manually.
            String body = 'Hello ' + app.Candidate__r.Name + ',\n\n';
            body += 'This is a friendly reminder that your application for the ' + app.Job__r.Name + ' position is still being reviewed.\n\n';
            body += 'Our team is working diligently, and we will update you as soon as there is a new development.\n\n';
            body += 'Thank you for your patience.';
            mail.setPlainTextBody(body);
            
            // Add the fully prepared email to our list.
            emailsToSend.add(mail);
        }
        
        // Send all the emails in the list at once.
        Messaging.sendEmail(emailsToSend);
    }

    // The FINISH method runs once after all chunks have been processed.
    public void finish(Database.BatchableContext bc) {
        System.debug('Weekly application reminder batch job finished.');
    }
}