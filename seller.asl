// Agent seller in project group_project01.mas2j

/* Initial beliefs and rules */

/* Initial goals */

!sell(laptop).

/* Plans */

+!sell(laptop) : true <- .print("hello I'm Jenny,I can help you to buy laptops");
                         .send(buyer01, achieve, help("seller helping..."));
                         .send(buyer02, achieve, help("seller helping..."));
                         !ask_detail_buyer01("sendig details to buyer 01");
                         !ask_detail_buyer02("sendig details to buyer 02").

+!ask_detail_buyer01(X) : true <- .print(X);
                          .send(buyer01,tell,item(hp01,HP));
                          .send(buyer01,tell,ram(hp01,4));
                          .send(buyer01,tell,hard_disk(hp01,120));
                          .send(buyer01,tell,price(hp01,150000)).

+!ask_detail_buyer02(Y) : true <- .print(Y);
                          .send(buyer02,tell,item(hp02,HP));
                          .send(buyer02,tell,ram(hp02,4));
                          .send(buyer02,tell,hard_disk(hp02,120));
                          .send(buyer02,tell,price(hp02,150000)).
