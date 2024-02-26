public with sharing class feb26MorningSync {
    public static void updateOpportunityCountOnAccount(List<Opportunity> opportunities) {
        Set<Id> accountIds = new Set<Id>();
        for (Opportunity opp : opportunities) {
            if (opp.AccountId != null) {
                accountIds.add(opp.AccountId);
            }
        }
        List<Account> accountsToUpdate = new List<Account>();
        for (Id accountId : accountIds) {
            Integer opportunityCount = [SELECT COUNT() FROM Opportunity WHERE AccountId = :accountId];
            accountsToUpdate.add(new Account(Id = accountId, Count_of_Opportunities__c = opportunityCount));
        }
        update accountsToUpdate;
    }

    public static void updateOpportunityCountOnUser(List<Opportunity> opportunities) {
        Set<Id> userIds = new Set<Id>();
        for (Opportunity opp : opportunities) {
                userIds.add(opp.OwnerId);
        }
        List<User> usersToUpdate = new List<User>();
        for (Id userId : userIds) {
            Integer opportunityCount = [SELECT COUNT() FROM Opportunity WHERE OwnerId = :userId];
            usersToUpdate.add(new User(Id = userId, Count_of_Opportunities__c = opportunityCount));
        }
        update usersToUpdate;
    }
}