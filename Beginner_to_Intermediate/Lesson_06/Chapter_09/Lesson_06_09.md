# Lesson 6 - Chapter 9: Subscribing to Events

<small>
Url: https://cryptozombies.io/en/lesson/6/chapter/9
</small>

## Directions

<small>
As you can see, interacting with your contract via Web3.js is pretty straightforward — once you have your environment set up, calling functions and sending transactions is not all that different from a normal web API.

There's one more aspect we want to cover — subscribing to events from your contract.

Listening for New Zombies
If you recall from zombiefactory.sol, we had an event called NewZombie that we fired every time a new zombie was created:

event NewZombie(uint zombieId, string name, uint dna);
In Web3.js, you can subscribe to an event so your web3 provider triggers some logic in your code every time it fires:

cryptoZombies.events.NewZombie()
.on("data", function(event) {
let zombie = event.returnValues;
// We can access this event's 3 return values on the `event.returnValues` object:
console.log("A new zombie was born!", zombie.zombieId, zombie.name, zombie.dna);
}).on("error", console.error);
Note that this would trigger an alert every time ANY zombie was created in our DApp — not just for the current user. What if we only wanted alerts for the current user?

Using indexed
In order to filter events and only listen for changes related to the current user, our Solidity contract would have to use the indexed keyword, like we did in the Transfer event of our ERC721 implementation:

event Transfer(address indexed \_from, address indexed \_to, uint256 \_tokenId);
In this case, because \_from and \_to are indexed, that means we can filter for them in our event listener in our front end:

// Use `filter` to only fire this code when `_to` equals `userAccount`
cryptoZombies.events.Transfer({ filter: { \_to: userAccount } })
.on("data", function(event) {
let data = event.returnValues;
// The current user just received a zombie!
// Do something here to update the UI to show it
}).on("error", console.error);
As you can see, using events and indexed fields can be quite a useful prac
</small>
