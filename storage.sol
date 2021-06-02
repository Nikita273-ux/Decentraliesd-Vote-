pragma solidity 0.8.0;

contract Storage {
    
    struct Voter{
        
       // address vAddress;
        string  fName;
        string  lName;
        uint8   age;
       // uint8   vote;
        bool    voted;
      //  VoterStatus status;
    
        }
        
    struct delegate {
        
        string Name;
        string lName;
        uint8  Age;
        
    }
    
    uint256 public voterCounter;
    uint256 public delegateCounter;
    
     mapping(address => Voter) public voters;
      mapping(address=>delegate) public  delegates;
      
      
    function RegisterVoter(string memory _fname, string memory _lname, uint8 _age) public{
        
        
        
        
        
        
    }
}


 
