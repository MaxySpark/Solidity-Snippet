pragma solidity ^0.5.11;
import 'owned.sol';

contract Mortal is Owned {
    function kill() public {
        if (msg.sender == owner) {
            selfdestruct(owner);
        }
    }
}