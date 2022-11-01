trigger EventTrigger on Event (after insert,after update) {
    if(Trigger.isAfter && Trigger.isInsert){
        EventTriggerHandler.afterInsert(Trigger.new);
    }
    if(Trigger.isAfter && Trigger.isUpdate){
        EventTriggerHandler.afterUpdate(Trigger.new,Trigger.oldMap);
    }
}