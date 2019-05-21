@isTest
private class DailyLeadProcessorTest {
    
    @TestSetup
    static void makeData(){
        List<Lead> testLeads = new List<Lead>();
        for (Integer i = 0; i < 200; i++) {
            testLeads.add(new Lead(LastName='Lastname' + i, Company='Company' + i));
        }
        insert testLeads;
    }

    @isTest
    private static void test() {

        final String CRON_EXP = '0 0 0 15 3 ? 2022';

        Test.startTest();
        String jobId = System.schedule('DailyLeadProcessorScheduledTest', CRON_EXP, new DailyLeadProcessor());
        Test.stopTest();

        System.assertEquals(200, [select count() from Lead where LeadSource = 'Dreamforce'], 'Leads not updated to LeadSource = \'Dreamforce\'.');
    }
}
