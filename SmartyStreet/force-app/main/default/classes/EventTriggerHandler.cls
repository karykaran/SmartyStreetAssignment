public with sharing class EventTriggerHandler {
    public static void afterInsert(List<Event> newList){
        locationVerification(newList,null);
    }

    public static void afterUpdate(List<Event> newList,Map<Id,Event> oldMap){
        locationVerification(newList,oldMap);
    }

    public static void locationVerification(List<Event> newList,Map<Id,Event> oldMap){
        Set<Id> eventIdSet =  new Set<Id>();
        for(Event evt : newList){
            if((oldMap == null || evt.Location != oldMap.get(evt.Id).Location)){
                eventIdSet.add(evt.Id);
            }
        }
        if(!eventIdSet.isEmpty()){
            verifyLocation(eventIdSet);
        }
    }

    @future(callout = true)
    public static void verifyLocation(Set<Id> eventIdSet){
        List<BodyWrapper> bodyWrapperList = new List<BodyWrapper>();
        Map<Integer,Id> indexToEventIdMap = new Map<Integer,Id>();
        List<Event> eventList = new List<Event>();
        Integer index = 0;
        for(Event evt : [SELECT Id,Location FROM Event WHERE Id IN:eventIdSet]){
            bodyWrapperList.add(new BodyWrapper(evt.Location));
            indexToEventIdMap.put(index++,evt.Id);
        }
        String endPoint = Smarty_Street__mdt.getInstance('Smarty_Street').EndPoint__c +
                        '?auth-id='+Smarty_Street__mdt.getInstance('Smarty_Street').Auth_Id__c+
                        '&auth-token='+Smarty_Street__mdt.getInstance('Smarty_Street').Auth_Token__c;
        Map<String,String> headersMap = new Map<String,String>();
        headersMap.put('content-type', 'application/json');
        String body = JSON.serialize(bodyWrapperList);
        HttpResponse res = ServiceClass.makeHttpRequest(endpoint,'POST', headersMap,body);
        if(res.getStatusCode() == 200){
            List<SmartStreetWrapper> response = SmartStreetWrapper.parse(res.getBody());
            for(SmartStreetWrapper ssw : response){
                if(indexToEventIdMap.containsKey(ssw.input_index)){
                    Event e = new Event();
                    e.Id = indexToEventIdMap.get(ssw.input_index);
                    e.Location_Verified__c = true;
                    eventList.add(e);
                    indexToEventIdMap.remove(ssw.input_index);
                }
            }
            for(Integer key : indexToEventIdMap.keySet()){
                Event e = new Event();
                e.Id = indexToEventIdMap.get(key);
                e.Location_Verified__c = false;
                eventList.add(e);
            }
            if(!eventList.isEmpty()){
                update eventList;
            }
        }
    }

    public class BodyWrapper{
        public String Street;
        public BodyWrapper(String Street){
            this.Street = Street;
        }
    }
}