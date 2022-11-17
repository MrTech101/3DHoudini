//SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;

import "./crowdsale/Crowdsale.sol";

contract ICO is Crowdsale{
    constructor(
        uint256 rate,
        address payable wallet,
        IERC20 token,
        uint256 cap
     ) Crowdsale(rate, wallet, token ,cap) {}
}