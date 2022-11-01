@isTest
public with sharing class EventTriggerHandlerTest {
    @TestSetup
    public static void makeData(){
        List<Account> accList = TestUtility.createAccount('TestAccount',1,true);
    }

    @isTest
    public static void checkLocationVerification(){
        Id accId = [SELECT Id FROM Account LIMIT 1]?.Id;
        List<Event> eventList = TestUtility.createEvent(false,5,accId,'Meeting','525 S Winchester Blvd , San Jose ,CA');
        eventList[2].Location = 'Invalid Address';
        eventList[3].Location = 'Invalid Address';
        Test.startTest();
        Test.setMock(HttpCalloutMock.class, new SmartStreetMockResponse());
        insert eventList;
        Test.StopTest();
        for(Event evt : [SELECT Location_Verified__c FROM Event WHERE Id IN: eventList]){
            if(evt.Id == eventList[2].Id || evt.Id == eventList[3].Id){
                System.assertEquals(false,evt.Location_Verified__c);
            }
            else{
                System.assertEquals(true,evt.Location_Verified__c);
            }
        }
    }
}