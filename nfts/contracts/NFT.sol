// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0 <0.8.0;

import "openzeppelin-solidity/contracts/presets/ERC1155PresetMinterPauser.sol";

contract Collectibles is ERC1155PresetMinterPauser {
    constructor() public ERC1155PresetMinterPauser("Test") {}
}
