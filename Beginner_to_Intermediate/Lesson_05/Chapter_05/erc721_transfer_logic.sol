pragma solidity >=0.5.0 <0.6.0;

import "./zombieattack.sol";
import "./erc721.sol";

contract ZombieOwnership is ZombieAttack, ERC721 {
    function balanceOf(address _owner) external view returns (uint256) {
        return ownerZombieCount[_owner];
    }

    function ownerOf(uint256 _tokenId) external view returns (address) {
        return zombieToOwner[_tokenId];
    }

    // Define _transfer() here
    function _transfer(address _from, address _to, uint256 _tokenId) private {
        // Increment the zombie count for the address recieving the zombie.
        ownerZombieCount[_to]++;
        // Decrement the zombie count for the address that is sending the zombie.
        ownerZombieCount[_from]--;
        // Change the mapping so "_tokenId" points to the new owner.
        zombieToOwner[_tokenId] = _to;
        // Emit the transfer event.
        // The ERC721 standard "Transfer" event, requires the "_from" address (sender), the "_to" address (reciever), and the "_tokenId" (The unit being transferred).
        emit Transfer(_from, _to, _tokenId);
    }

    function transferFrom(
        address _from,
        address _to,
        uint256 _tokenId
    ) external payable {}

    function approve(address _approved, uint256 _tokenId) external payable {}
}
