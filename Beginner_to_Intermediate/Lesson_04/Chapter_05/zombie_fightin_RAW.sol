// SPDX-License-Identifier: MIT

pragma solidity >=0.5.0 <0.6.0;

import "./zombiehelper.sol";

contract ZombieAttack is ZombieHelper {
    uint randNonce = 0;

    // Create attackVictoryProbability here

    function randMod(uint _modulus) internal returns (uint) {
        randNonce++;
        return
            uint(keccak256(abi.encodePacked(now, msg.sender, randNonce))) %
            _modulus;
    }

    // Create new function here
}
