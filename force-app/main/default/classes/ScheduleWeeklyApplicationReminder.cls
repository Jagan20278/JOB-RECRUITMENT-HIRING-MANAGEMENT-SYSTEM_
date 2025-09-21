public class ScheduleWeeklyApplicationReminder implements Schedulable {
    public void execute(SchedulableContext sc) {
        // This method is called by the Salesforce scheduler.
        // It creates a new instance of our batch class and starts it.
        Database.executeBatch(new WeeklyApplicationReminderBatch());
    }
}