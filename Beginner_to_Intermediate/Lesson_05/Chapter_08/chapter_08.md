# Lesson 5 - Chapter 8: ERC721 Approve Continued

<small>
Url: https://cryptozombies.io/en/lesson/5/chapter/8
</small>

## Directions

<small>
Great, we are almost done!

There is one more thing to do- there's an Approval event in the ERC721 spec. So we should fire this event at the end of the approve function.

Putting it to the Test
Let's fire the Approval event. Take a look at the erc721.sol file for the arguments, and be sure to use msg.sender as \_owner.

</small>
