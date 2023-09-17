# Lesson 5 - Chapter 5: ERC721 Transfer Logic

<small>
Url: https://cryptozombies.io/en/lesson/5/chapter/5
</small>

## Directions

<small>
Great, we've fixed the conflict!

Now we're going to continue our ERC721 implementation by looking at transfering ownership from one person to another.

Note that the ERC721 spec has 2 different ways to transfer tokens:

function transferFrom(address \_from, address \_to, uint256 \_tokenId) external payable;

and

function approve(address \_approved, uint256 \_tokenId) external payable;

function transferFrom(address \_from, address \_to, uint256 \_tokenId) external payable;

The first way is the token's owner calls transferFrom with his address as the \_from parameter, the address he wants to transfer to as the \_to parameter, and the \_tokenId of the token he wants to transfer.

The second way is the token's owner first calls approve with the address he wants to transfer to, and the \_tokenID . The contract then stores who is approved to take a token, usually in a mapping (uint256 => address). Then, when the owner or the approved address calls transferFrom, the contract checks if that msg.sender is the owner or is approved by the owner to take the token, and if so it transfers the token to him.

Notice that both methods contain the same transfer logic. In one case the sender of the token calls the transferFrom function; in the other the owner or the approved receiver of the token calls it.

So it makes sense for us to abstract this logic into its own private function, \_transfer, which is then called by transferFrom.

</small>
