pragma solidity 0.8.0;

contract Storage {
    
   // enum VoterStatus {unverified, verified}
     
    struct Voter{
        uint256 id;
       // address vAddress;
        string  fName;
        string  lName;
        uint8   age;
       
        bool    voted;
    
        }
        
    struct Delegate {
        
        string Name;
        string lName;
        uint8  Age;
        uint256 id;
        bool isDelegate;
        uint256 daddress;
        
    }
    
    uint256 public voterCounter;
    uint256 public delegateCounter;
    
     mapping(address => Voter) public voter;
     mapping(address=>Delegate) public  delegates;
      
     modifier initialised() {
        require( controller != address(0), "Storage: contract not initialised" );
        _;
    }
    
    
    modifier checkVoter(){
    require(voter[msg.sender].id != 0,"Voter doesn't exist");
            _;
    }
    
    modifier checkdelegate(){
    require(delegates[msg.sender].daddress != 0,"Candidate doesn't exist");
        _;
    }

     modifier registered{
      require(msg.sender != candidate[msg.sender].daddress,"try another address ");  
      constructor (address _controller) {
        controller = _controller;
    }
    
    modifier onlyController() {
        require(msg.send == controller,"Storage:Only controller can access");
        _;
    }
    
     modifier onlyVerifiedVoters {
        Voter storage voter = voters[msg.sender];
        require(voter.status == VoterStatus.verified);
        _;
    }
    
    
    function setController(address _controller) initialised onlyController public {
        require(_controller != address(0), "Storage: controller cannot be zero address");
        controller = _controller;
    }
    
    
     function RegisterVoter(string memory _fname, string memory _lname, uint8 _age) public{
       
        voterCounter++;
         Voter memory vote;
         vote.id      = voterCounter; 
         vote.name    = _fname;
         vote.name    = _lname;
         vote.age     = _age;
         vote.vadd    = msg.sender;
         vote.isVoter = true;
         voter[msg.sender] = vote;
        voter.status = VoterStatus.unverified;

    }
    
    function RegisterDelegate(string memory _name,string memory _lname,uint8 _age) public {
        delegateCounter++;
        Delegate memory a;
        a.id    = delegateCounter;
        a.Name  = _name;
        a.lName = _lname;
        a.Age   = _age;
    }
    
    function vote(Delegate _candidate) onlyVerifiedVoters public{
        Voter storage voter = voters[msg.sender];
        uint prevCount = candidateVotes[uint8(_candidate)];
        candidateVotes[uint8(_candidate)] = prevCount + 1 ;
        voter.status = VoterStatus.unverified;
    }
    
    function winner() public view returns (uint) {
        uint winner = 0;  
        for(uint i=0;i < candidateVotes.length;i++){
            if(candidateVotes[i] > candidateVotes[winner]){
                winner = i;
            }
        }
        return winner;
    }
}


 
