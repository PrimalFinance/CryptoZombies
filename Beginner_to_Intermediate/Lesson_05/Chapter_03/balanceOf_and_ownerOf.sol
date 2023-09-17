pragma solidity >=0.5.0 <0.6.0;

import "./zombieattack.sol";
import "./erc721.sol";

contract ZombieOwnership is ZombieAttack, ERC721 {
    function balanceOf(address _owner) external view returns (uint256) {
        // 1. Return the number of zombies `_owner` has here
        // Access the "ownerZombieCount" array and return the number of zombies that the address has.
        return ownerZombieCount[_owner];
    }

    function ownerOf(uint256 _tokenId) external view returns (address) {
        // 2. Return the owner of `_tokenId` here
        // Access the "zombieToOwner" array, return the address that is associated with the "_tokenId".
        return zombieToOwner[_tokenId];
    }

    function transferFrom(
        address _from,
        address _to,
        uint256 _tokenId
    ) external payable {}

    function approve(address _approved, uint256 _tokenId) external payable {}
}
