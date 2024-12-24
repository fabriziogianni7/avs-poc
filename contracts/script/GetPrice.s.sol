// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Script, console2} from "forge-std/Script.sol";
import {Oracle} from "../src/Oracle.sol";
import {IAttestationCenter} from "../src/interfaces/IAttestationCenter.sol";

contract GetPriceScript is Script {
    address public oracle_address = 0x7a67aa310537E6e9Afc99800fc557d22F6F1A859;

    function run() external {
        Oracle oracle = Oracle(oracle_address);
        uint256 price = oracle.price();

        console2.log("eth price in bytes", price);
        // console2.log(price);
    }
}
