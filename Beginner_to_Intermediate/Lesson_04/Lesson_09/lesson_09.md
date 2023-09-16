# Lesson 9: Zombie Wins and Losses

<small>
Url: https://cryptozombies.io/en/lesson/4/chapter/9
</small>

## Directions

<small>
For our zombie game, we're going to want to keep track of how many battles our zombies have won and lost. That way we can maintain a "zombie leaderboard" in our game state.

We could store this data in a number of ways in our DApp — as individual mappings, as leaderboard Struct, or in the Zombie struct itself.

Each has its own benefits and tradeoffs depending on how we intend on interacting with the data. In this tutorial, we're going to store the stats on our Zombie struct for simplicity, and call them winCount and lossCount.

So let's jump back to zombiefactory.sol, and add these properties to our Zombie struct.

</small>
