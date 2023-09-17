# Lesson 5 - Chapter 3: balanceOf & ownerOf

<small>
Url: https://cryptozombies.io/en/lesson/5/chapter/3
</small>

## Directions

<small>
Great, let's dive into the ERC721 implementation!

We've gone ahead and copied the empty shell of all the functions you'll be implementing in this lesson.

In this chapter, we're going to implement the first two methods: balanceOf and ownerOf.

balanceOf
function balanceOf(address \_owner) external view returns (uint256 \_balance);
This function simply takes an address, and returns how many tokens that address owns.

In our case, our "tokens" are Zombies. Do you remember where in our DApp we stored how many zombies an owner has?

ownerOf
function ownerOf(uint256 \_tokenId) external view returns (address \_owner);
This function takes a token ID (in our case, a Zombie ID), and returns the address of the person who owns it.

Again, this is very straightforward for us to implement, since we already have a mapping in our DApp that stores this information. We can implement this function in one line, just a return statement.

Note: Remember, uint256 is equivalent to uint. We've been using uint in our code up until now, but we're using uint256 here because we copy/pasted from the spec.
</small>
