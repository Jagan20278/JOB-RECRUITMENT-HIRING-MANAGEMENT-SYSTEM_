trigger ApplicationTrigger on Application__c (before insert) {
    // When a new Application is about to be inserted,
    // call our handler class and pass it the new records.
    ApplicationTriggerHandler.handleBeforeInsert(Trigger.new);
}