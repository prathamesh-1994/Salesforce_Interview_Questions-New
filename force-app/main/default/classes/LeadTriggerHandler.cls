public class LeadTriggerHandler {
    public static void updateAccountContactDescription(List<Lead> newLeads, Map<Id, Lead> oldLeadMap) {
        List<Contact> contactsToUpdate = new List<Contact>();
        List<Account> accountsToUpdate = new List<Account>();

        for (Lead l : newLeads) {
            Lead oldL = oldLeadMap.get(l.Id);
            if (!oldL.IsConverted && l.IsConverted) {
                String description = 'Lead Id: ' + l.Id + ', Lead Name: ' + l.Name;

                if (l.ConvertedContactId != null) {
                    contactsToUpdate.add(new Contact(
                        Id = l.ConvertedContactId,
                        Description = description
                    ));
                }

                if (l.ConvertedAccountId != null) {
                    accountsToUpdate.add(new Account(
                        Id = l.ConvertedAccountId,
                        Description = description
                    ));
                }
            }
        }

        if (!contactsToUpdate.isEmpty()) {
            update contactsToUpdate;
        }

        if (!accountsToUpdate.isEmpty()) {
            update accountsToUpdate;
        }
    }


}