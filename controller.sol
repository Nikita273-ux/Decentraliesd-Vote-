pragma solidity 0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";

contract Controller is Ownable {


    modifier initialised () {
        require( store != IStorage(address(0)), "Controller: storage not initialised" );
        _;
    }

    function setStorage(Storage _storage) onlyOwner public {
        require(_storage != address(0), "Controller: storage cannot be zero");
        store = _storage;
    }

    function setNewController(address _newController) onlyOwner public {
        store.setController(_newController);
    }


    function RegisterVoter(string memory _name, uint8 _age) initialised public {
        store.RegisterVoter(_name, _age);
    }
    

    function RegisterCandidate(string memory _cname) initialised public{
        store.RegisterCandidate(_cname);
    }
}