// SPDX-License-Identifier: MIT
pragma solidity 0.8.21;

/**
 * @title BenqiSavaxDecoderAndSanitizer
 * @notice This contract does not inherit from BaseDecoderAndSanitizer.
 */
abstract contract BenqiSavaxDecoderAndSanitizer {
    //============================== StakedAvax (sAVAX) ===============================

    function submit() external pure virtual returns (bytes memory addressesFound) {
        // No addresses to sanitize
        return addressesFound;
    }

    function requestUnlock(uint256 /*shareAmount*/ ) external pure virtual returns (bytes memory addressesFound) {
        // No addresses to sanitize
        return addressesFound;
    }

    function cancelPendingUnlockRequests() external pure virtual returns (bytes memory addressesFound) {
        // No addresses to sanitize
        return addressesFound;
    }

    function cancelRedeemableUnlockRequests() external pure virtual returns (bytes memory addressesFound) {
        // No addresses to sanitize
        return addressesFound;
    }

    function cancelUnlockRequest(uint256 /*unlockIndex*/ ) external pure virtual returns (bytes memory addressesFound) {
        // No addresses to sanitize
        return addressesFound;
    }

    function redeem() external pure virtual returns (bytes memory addressesFound) {
        // No addresses to sanitize
        return addressesFound;
    }

    function redeem(uint256 /*unlockIndex*/ ) external pure virtual returns (bytes memory addressesFound) {
        // No addresses to sanitize
        return addressesFound;
    }

    function redeemOverdueShares() external pure virtual returns (bytes memory addressesFound) {
        // No addresses to sanitize
        return addressesFound;
    }

    function redeemOverdueShares(uint256 /*unlockIndex*/ ) external pure virtual returns (bytes memory addressesFound) {
        // No addresses to sanitize
        return addressesFound;
    }
}