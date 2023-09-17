// SPDX-License-Identifier: MIT

pragma solidity >=0.5.0 <0.6.0;

import "./zombiehelper.sol";

contract ZombieAttack is ZombieHelper {
    uint randNonce = 0;
    uint attackVictoryProbability = 70;

    function randMod(uint _modulus) internal returns (uint) {
        randNonce++;
        return
            uint(keccak256(abi.encodePacked(now, msg.sender, randNonce))) %
            _modulus;
    }

    // 1. Add modifier here
    // Add the "ownerOf" modifier to make sure the function caller owns the zombie that is being used to attack.
    function attack(
        uint _zombieId,
        uint _targetId
    ) external ownerOf(_zombieId) {
        // 2. Start function definition here
        // Create a Zombie storage variable and set it to the zombie found in the "zombies" array at index "_zombieId".
        Zombie storage myZombie = zombies[_zombieId];
        // Zombie storage variable for the enemy zombie within the "zombies" array at the index "_targetId".
        Zombie storage enemyZombie = zombies[_targetId];
        // Unsigned integer to hold the result of "randMod".
        // We choose the arguement of "100" because we want to generate a random number between 0 and 99.
        uint rand = randMod(100);
    }
}
