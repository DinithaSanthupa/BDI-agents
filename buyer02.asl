// Agent buyer01 in project group_project01.mas2j



/* Initial beliefs and rules */

color(red,blue).
price(hp02,150000).
ram(hp02,4).
hard_disk(hp02,120).

can_afford(Something,P) :- price(Something,P)[source(S)] & (S == self | S == seller) & 200000 > P.
ram_afford(Something,P) :- ram(Something,P)[source(S)] & (S == self | S == seller) & 4 >= P.
hard_afford(Something,P) :- hard_disk(Something,P)[source(S)] & (S == self | S == seller) & 120 <= P.

/* Initial goals */


!buy(laptop).

/* Plans */

+!buy(laptop) : true <- !get(laptop).
+!help(Y) : true <- .print(Y).
+!get(laptop) : true <- .send(seller, achieve, ask_detail("Buyer 02 want to get details"));
                        !price_check(hp02,150000);
                        !ram_compatibilty_check(hp02,4);
                        !hard_disk_compatibilty_check(hp02,120).


//Calling the rules
+!price_check(Something,P) : true <- ?can_afford(Something,P); .print("Done price checking,it's okay").
+!price_check(Something,P) : true <- .print("Not done").

+!ram_compatibilty_check(Something,P) : true <- ?ram_afford(Something,P); .print("Done ram checking,it's okay").
+!ram_compatibilty_check(Something,P) : true <- .print("Not done").

+!hard_disk_compatibilty_check(Something,P) : true <- ?hard_afford(Something,P); .print("Done hard disk 0,it's okay").
+!hard_disk_compatibilty_check(Something,P) : true <- .print("Not done").
