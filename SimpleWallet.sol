pragma solidity ^0.5.11;

import 'mortal.sol';

contract SimpleWallet is Mortal {

    mapping(address => Permission) permittedAddress;

    struct Permission {
        bool isAllowed;
        uint maxTransferAmount;
    }

    function addAddressToSendersList(address permitted, uint maxTransferAmount) public onlyOwner {
        permittedAddress[permitted] = Permission(true, maxTransferAmount);
    }

    function sendFunds(address payable receiver, uint amountInWei) public {
        require(
            permittedAddress[msg.sender].isAllowed,
            'Address is Not Allowed To Send Fund'
        );

        require(
            permittedAddress[msg.sender].maxTransferAmount >= amountInWei,
            'Amount Must Be Smaller Than MaxTransferAmount'
        );

        receiver.transfer(amountInWei);
    }

    function removeAddressFromSendersList(address removeAddress) public {
        delete permittedAddress[removeAddress];
    }

    function() external payable {

    }
}