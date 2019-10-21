pragma solidity ^0.5.11;

import 'owned.sol';

contract Mortal is Owned {

    function kill() public onlyOwner {
        selfdestruct(owner);
    }
}
