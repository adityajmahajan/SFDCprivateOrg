trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {
    List<Task> tasskList = new List<Task>();
    for(Opportunity opp: Trigger.new){
        if(opp.StageName=='Closed Won')
        {
            Task t = new Task();
            t.Subject = 'Follow Up Test Task';
            t.WhatId = opp.Id;
            tasskList.add(t);
        }
    }
    insert tasskList;
}