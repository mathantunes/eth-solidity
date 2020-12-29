// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0 <0.8.0;
pragma experimental ABIEncoderV2;

import "openzeppelin-solidity/contracts/presets/ERC1155PresetMinterPauser.sol";
import "openzeppelin-solidity/contracts/token/ERC1155/ERC1155.sol";
import "openzeppelin-solidity/contracts/access/AccessControl.sol";

contract Collectibles is ERC1155PresetMinterPauser {
    constructor() public ERC1155PresetMinterPauser("Test") {}
}

contract CollectiblesFromScratch is ERC1155, AccessControl {
    bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");

    constructor(string memory uri) public ERC1155(uri) {
        _setupRole(DEFAULT_ADMIN_ROLE, _msgSender());
        _setupRole(MINTER_ROLE, _msgSender());
    }

    event Crafted(address owner, uint256 id);

    struct Weapon {
        uint256 id;
        uint256 physicalDamage;
        uint256 magicDamage;
        uint256 resistance;
        uint256 weight;
    }

    mapping(uint256 => Weapon) public _weapons; // Holds each weapons property
    mapping(uint256 => uint256) public weaponAmountOf; // Holds each weapon quantity

    function getWeaponInfo(uint256 _id) public view returns (Weapon memory) {
        return _weapons[_id];
    }

    function getWeaponCount(uint256 _id) public view returns (uint256) {
        return weaponAmountOf[_id];
    }

    function craftWeapon(
        uint256 _id,
        uint256 _physicalDamage,
        uint256 _magicDamage,
        uint256 _resistance,
        uint256 _weight
    ) external returns (uint256) {
        require(hasRole(MINTER_ROLE, _msgSender()), "It requires MINTER_ROLE");
        require(_weapons[_id].id == 0, "It requires a new weapon id");
        Weapon memory _weapon =
            Weapon({
                id: _id,
                physicalDamage: _physicalDamage,
                magicDamage: _magicDamage,
                resistance: _resistance,
                weight: _weight
            });
        _mint(msg.sender, _id, 1, bytes("test"));
        _weapons[_id] = _weapon;
        weaponAmountOf[_id]++;
        Crafted(msg.sender, _id);
        return _id;
    }

    // TODO OVERLOAD TRANSFERS
}
