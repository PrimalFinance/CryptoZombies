// SPDX-License-Identifier: MIT

pragma solidity >=0.5.0 <0.6.0;

import "./zombiehelper.sol";

contract ZombieAttack is ZombieHelper {
    // Start here
    uint randNonce = 0;

    function randMod(uint _modulus) internal returns (uint) {
        // Increment the nonce (number used once) to make sure that previous calls do not use the same value.
        // Every function call, the nonce should be different.
        randNonce++;
        // Use the keccak hashing function on the group of data.
        // "now" is the current time.
        // "msg.sender" is the address that called this function.
        // "randNonce" is the nonce that is tracked in this contract and incremented every function call.
        // If the modulus is 100, it will grab the last 2 elements. Creating a random number between 0 - 99.
        // Type cast to uint() since that is what the function requires as the return type.
        return
            uint(keccak256(abi.encodePacked(now, msg.sender, randNonce))) %
            _modulus;
    }
}
