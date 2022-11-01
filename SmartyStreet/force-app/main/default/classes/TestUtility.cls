public class TestUtility {
    public static List<Account> createAccount(String name,Integer size,Boolean isInsert){
        List<Account> accList = new List<Account>();
        for(Integer i =0 ; i<size; i++){
            Account a = new Account();
            a.Name = name + i;
            accList.add(a);
        }
        if(isInsert){
            insert accList;
        }
        return accList;
    }

    public static List<Contact> createContact(String lastName,Integer size,Boolean isInsert){
        List<Contact> conList = new List<Contact>();
        for(Integer i =0 ; i<size; i++){
            Contact c = new Contact();
            c.lastName = lastName + i;
            conList.add(c);
        }
        if(isInsert){
            insert conList;
        }
        return conList;
    }

    public static List<Opportunity> createOpportunity(String Name,Date ClosedDate,String StageName,Integer size,Boolean isInsert){
        List<Opportunity> oppList = new List<Opportunity>();
        for(Integer i =0 ; i<size; i++){
            Opportunity o = new Opportunity();
            o.Name = Name+i;
            o.CloseDate = ClosedDate;
            o.StageName = StageName;
            oppList.add(o);
        }
        if(isInsert){
            insert oppList;
        }
        return oppList;
    }

    public static List<Event> createEvent(Boolean isInsert,Integer size,String objId,String subject,String location){
        List<Event> eventList = new List<Event>();
        for(Integer i =0 ; i<size; i++){
            Event evt = new Event();
            evt.WhatId = objId;
            evt.Subject = subject;
            evt.Location = location;
            evt.DurationInMinutes = 20;
            evt.ActivityDateTime = System.now();
            eventList.add(evt);
        }
        if(isInsert){
            insert eventList;
        }
        return eventList;
    }
}