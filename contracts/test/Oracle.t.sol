// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "forge-std/console.sol";
import "../src/Oracle.sol"; // Adjust the path to your Oracle contract

contract OracleTest is Test {
    Oracle internal oracle;
    address internal attestationCenter;
    address internal attacker;

    function setUp() public {
        // Set up test environment
        attestationCenter = address(0x123); // Mock address for attestation center
        attacker = address(0x456); // Mock address for an attacker
        oracle = new Oracle(attestationCenter);
    }

    function testAfterTaskSubmissionUpdatesPrice() public {
        uint256 newPrice = 12345;
        bytes memory encodedData = abi.encode(newPrice);

        IAttestationCenter.TaskInfo memory taskInfo = IAttestationCenter.TaskInfo({
            proofOfTask: "proofDummy",
            data: encodedData,
            taskPerformer: address(234),
            taskDefinitionId: 1
        });
        uint256 signature = 123;
        vm.prank(attestationCenter); // Simulate call from attestationCenter
        oracle.afterTaskSubmission(taskInfo, true, "", [signature, signature], new uint256[](0));

        assertEq(oracle.price(), newPrice, "Price should be updated");
    }
}
