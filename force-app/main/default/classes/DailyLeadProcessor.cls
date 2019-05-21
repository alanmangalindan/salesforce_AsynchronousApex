public class DailyLeadProcessor implements Schedulable {
    
    public void execute(SchedulableContext ctx) {
        List<Lead> leads = [select Id, LeadSource from Lead where LeadSource = '' LIMIT 200];

        for (Lead l: leads) {
            l.LeadSource = 'Dreamforce';
        }

        update leads;
    }
}
