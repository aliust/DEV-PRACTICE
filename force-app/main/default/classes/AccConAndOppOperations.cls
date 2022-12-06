public class AccConAndOppOperations {
    public static List<Account> allAccounts(){
        list<account> myaccounts = new List<Account>();
        myaccounts = [select name, annualrevenue, type, accountsource from account];

        return myaccounts;
    }

    public static List<Opportunity> allOpp(string source, string stage){
        List<Opportunity> myOpp = [select name, leadsource, stagename from opportunity where leadsource=:source and stagename=:stage];
        return myOpp;

    }

    public static void printAccountOpps(){
        List<Account> myAcc = [select name, annualrevenue, (select name, amount from opportunities where stagename='closed won') from account where type='customer - direct'];

        for (Account eachAcc : myAcc) {
        system.debug('Account Name ' +eachAcc.name +' Account Revenue '+ eachAcc.annualrevenue);
        for (opportunity eachOpp : eachAcc.opportunities) {
            system.debug('Opp name '+ eachOpp.name +' Opp Amount '+eachOpp.amount);   
        }
   
    }
  

}
}
