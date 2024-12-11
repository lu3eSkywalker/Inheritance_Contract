# Inheritance_Contract

Gist of this Inheritance Contract {
1. Every user can deploy their own Will Contract.
2. The owner should define a recipient while deploying this contract.
3. Owner can to change the recipient or add more recipient.
4. Owner can interact with the contract via a ping function.
5. If ping hasn't been called for > 1 year, the recipient can call the drain function.
}

/src/Inheritance.sol
In this In line 9, we have provided this,
uint public WAITING_PERIOD = 2592000;

We can update the WAITING_PERIOD according to the usuage, but have to put it in seconds
Like for 5 years this would be WAITING_PERIOD = 157784760


/script/DeployInheritance.s.sol
In this line,
address inheritor = 0xcFAbD3697Cb170A03D7A67cFF59ed39786d53d6A;
We have to provide a default inheritor while deploying this contract, can't have this field empty.
