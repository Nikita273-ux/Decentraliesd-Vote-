pragma solidity 0.8.0;

contract Storage {
    
    enum VoterStatus {unverified, verified}
    
    struct Voter{
        uint256 id;
       // address vAddress;
        string  fName;
        string  lName;
        uint8   age;
       
        bool    voted;
    
        }
        
    struct delegate {
        
        string Name;
        string lName;
        uint8  Age;
        uint256 daddress;
        
    }
    
    uint256 public voterCounter;
    uint256 public delegateCounter;
    
     mapping(address => Voter) public voter;
      mapping(address=>delegate) public  delegates;
      
    modifier checkVoter(){
    require(voter[msg.sender].id != 0,"Voter doesn't exist");
            _;
    }
    
    modifier checkdelegate(){
    require(delegates[msg.sender].daddress != 0,"Candidate doesn't exist");
        _;
    }

    
    modifier registered{
      require(msg.sender != delegates[msg.sender].daddress,"try another address ");  
        _;
    }
    
    
      
    function RegisterVoter(uint256 _id,string memory _fname, string memory _lname, uint8 _age) public{
       
        voterCounter++;
         Voter memory vot;
         vot.id      = voterCounter; 
         vot.name    = _fname;
         vot.name    = _lname;
         vot.age     = _age;
         vot.vadd    = msg.sender;
         vot.isVoter = true;
         voter[msg.sender] = vote;
        voter.status = VoterStatus.unverified;

        
        
        
    }
}


 
