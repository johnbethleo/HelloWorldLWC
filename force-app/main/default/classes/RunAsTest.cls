@IsTest public with sharing class RunAsTest {
    @IsTest public static void runAsTestMethod() {
       // Run as Maya
       User u = [SELECT Id FROM User WHERE UserName='maya@partnerportaljt.com'];
       System.runAs(u) {
            System.debug('Current User: ' + UserInfo.getUserName());
            System.debug('Current Profile: ' + UserInfo.getProfileId());
            List<Opportunity> Opp = ([SELECT Id, Name FROM Opportunity]);
            System.debug(Opp);
            Integer OppCount = ([SELECT Count() FROM Opportunity]);
            System.debug(OppCount);
            System.assertEquals(OppCount,7);
        } 
        // Run as SysAdmin
        System.debug('Current User: ' + UserInfo.getUserName());
        System.debug('Current Profile: ' + UserInfo.getProfileId());
        List<Opportunity> Opp = ([SELECT Id, Name FROM Opportunity]);
        System.debug(Opp);
        Integer OppCount = ([SELECT Count() FROM Opportunity]);
        System.debug(OppCount);
        System.assertEquals(OppCount,35);

   }    
}
