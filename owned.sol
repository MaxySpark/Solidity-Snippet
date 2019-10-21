pragma solidity ^0.5.11;

contract Owned {

    address payable owner;

    constructor() public {
        owner = msg.sender;
    }

    modifier onlyOwner {
        require(
            msg.sender != owner,
            'Only Owner Can Call This Function'
            );
        _;
    }

    event NewOwner(address indexed old, address indexed current);

    function setOwner(address payable _new) public onlyOwner {
        emit NewOwner(owner, _new);
        owner = _new;
    }
}