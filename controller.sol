pragma solidity 0.8.0;

import "./Storage.sol";
import "./IStorage.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";

contract Controller is Ownable {
     IStorage public store;
     Storage public store;


   modifier initialised () {
        require( store != Storage(address(0)), "Controller: storage not initialised" );
        require( store != IStorage(address(0)), "Controller: storage not initialised" );
        _;
    }


     function initialise(Storage _storage) external {
        require(store == Storage(address(0)), "Controller: already initialised");
   
    function setStorage(Storage memory _storage) onlyOwner public {
        require(_storage != address(0), "Controller: storage cannot be zero");
        store = _storage;
    }

    function setNewController(address _newController) public {
        store.setController(_newController);
    }

    function RegisterVoter(string memory _name, uint8 _age) initialised public {
        store.RegisterVoter(_name, _age,msg.sender);
    }
    

    function RegisterCandidate(string memory _cname) initialised public{
        store.RegisterCandidate(_cname);
    }
}