pragma solidity  >=0.4.22 <0.7.0;
/**
 * @title Member
 * @dev Modelling a Member instance
 */
 
 contract Member{
     
    address payable poolAddress;
    uint rwfValue;
    
    mapping(address => uint256) public balances;
    
    // Events allow clients to react to specific
    // contract changes you declare
    event Sent(address from, address to, uint amount);
    constructor(address payable _poolAddress) public {
        poolAddress = _poolAddress;
    }
    
    function getAddress() external view returns(address payable) {
        return poolAddress;
    }
    function setAddress(address payable _poolAddress) public {
        poolAddress = _poolAddress;
    }
    
    function pay(uint _amount) public payable onlyOwner {
         require(_amount <= balances[msg.sender], "Insufficient balance.");
         balances[msg.sender] -= _amount;
         balances[poolAddress] += _amount;
         poolAddress.transfer(msg.value);
         emit Sent(msg.sender, poolAddress, _amount);
         
     }
     
     
     modifier onlyOwner(){
         require(msg.sender == poolAddress);
         _;
     }
    
    
    
 }
