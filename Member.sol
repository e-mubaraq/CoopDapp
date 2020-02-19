pragma solidity  >=0.4.22 <0.7.0;
/**
 * @title Member
 * @dev Modelling a Member instance
 */
 
 contract Member{
     

    address payable poolAddress;
    uint rwfValue;
    
    mapping(address => uint256) public balances;
    
    constructor(address payable _poolAddress) public {
        poolAddress = _poolAddress;
    }
    
    function getAddress() external view returns(address payable) {
        return poolAddress;
    }
    function setAddress(address payable _poolAddress) public {
        poolAddress = _poolAddress;
    }
    
    function payTo(address _memberAddress) public payable onlyOwner {
         balances[msg.sender]++;
         poolAddress.transfer(msg.value);
         
     }
     
    // function send(address receiver, uint amount) public {
    //     require(amount <= balances[msg.sender], "Insufficient balance.");
    //     balances[msg.sender] -= amount;
    //     balances[receiver] += amount;
    //     emit Sent(msg.sender, receiver, amount);
    // } 
     
     
     modifier onlyOwner(){
         require(msg.sender == poolAddress);
         _;
     }
    
    
    
 }
