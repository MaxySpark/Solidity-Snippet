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
        if (permittedAddress[msg.sender].isAllowed) {
            if (permittedAddress[msg.sender].maxTransferAmount <= amountInWei) {
                receiver.transfer(amountInWei);
            }
        }
    }

    function removeAddressFromSendersList(address removeAddress) public {
        delete permittedAddress[removeAddress];
    }
}