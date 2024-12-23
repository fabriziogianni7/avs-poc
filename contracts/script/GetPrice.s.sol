// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Script, console2} from "forge-std/Script.sol";
import {Oracle} from "../src/Oracle.sol";
import {IAttestationCenter} from "../src/interfaces/IAttestationCenter.sol";

contract GetPriceScript is Script {
    address public oracle_address = 0xe68bFf99c9b11F018bdECe3725c4Dd83cC76d58B;

    function run() external {
        Oracle oracle = Oracle(oracle_address);
        uint256 price = oracle.price();

        console2.log("price of eth", price);
    }
}
