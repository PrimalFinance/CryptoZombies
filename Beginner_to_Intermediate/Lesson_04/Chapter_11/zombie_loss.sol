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
        if (rand <= attackVictoryProbability) {
            myZombie.winCount++;
            myZombie.level++;
            enemyZombie.lossCount++;
            feedAndMultiply(_zombieId, enemyZombie.dna, "zombie");
        }
        // start here
        else {
            // If this condition is meant, it means our zombie lost. Therefore we should increment the loss count.
            myZombie.lossCount++;
            // Increment the enemy zombie's win count, since they won the encounter.
            enemyZombie.winCount++;
            // Run the "_triggerCooldown" function on "myZombie". This way the zombie can only attack once per day.
            _triggerCooldown(myZombie);
        }
    }
}
