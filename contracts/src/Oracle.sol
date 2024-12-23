// SPDX-License-Identifier: BUSL-1.1
pragma solidity >=0.8.20;

import {IAvsLogic} from "./interfaces/IAvsLogic.sol";
import {IAttestationCenter} from "./interfaces/IAttestationCenter.sol";

contract Oracle is IAvsLogic {
    error NotImplemented();
    error IsNotAttestationCenter();

    uint256 public price;
    address public attestationCenter;

    constructor(address _attestationCenter) {
        attestationCenter = _attestationCenter;
    }

    function afterTaskSubmission(
        IAttestationCenter.TaskInfo calldata _taskInfo,
        bool _isApproved,
        bytes calldata _tpSignature,
        uint256[2] calldata _taSignature,
        uint256[] calldata _operatorIds
    ) external {
        if (msg.sender != attestationCenter) {
            revert IsNotAttestationCenter();
        }
        price = abi.decode(_taskInfo.data, (uint256));
    }

    function beforeTaskSubmission(
        IAttestationCenter.TaskInfo calldata _taskInfo,
        bool _isApproved,
        bytes calldata _tpSignature,
        uint256[2] calldata _taSignature,
        uint256[] calldata _operatorIds
    ) external pure {
        revert NotImplemented();
    }
}
