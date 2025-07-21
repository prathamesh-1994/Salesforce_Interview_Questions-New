trigger LeadTrigger on Lead (after update) {
LeadTriggerHandler.updateAccountContactDescription(Trigger.new, Trigger.oldmap);
}