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

    function attack(
        uint _zombieId,
        uint _targetId
    ) external ownerOf(_zombieId) {
        Zombie storage myZombie = zombies[_zombieId];
        Zombie storage enemyZombie = zombies[_targetId];
        uint rand = randMod(100);
        // Start here
        // Check if rand is less than or equal to the "attackVictoryProbability" rate.
        if (rand <= attackVictoryProbability) {
            // If this condition is true, it means our zombie won the encounter. Therefore, the "winCount" should be incremented once.
            myZombie.winCount++;
            // Increment the level of our zombie.
            myZombie.level++;
            // Increment the loss count of the enemy zombie.
            enemyZombie.lossCount++;
            // Call the "feedAndMultiply" function. Use the enemy zombie's "dna" field.
            // Pass "zombie" in the "species" argument. Though it should be noted this does not currently have functionality.
            feedAndMultiply(_zombieId, enemyZombie.dna, "zombie");
        }
    }
}
