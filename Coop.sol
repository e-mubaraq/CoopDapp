pragma solidity  >=0.4.22 <0.7.0;
/**
 * @title Coop
 * @dev Modelling a cooperative instance
 */
 
 contract Coop{
     
     address payable member;
     uint remainingBalance;
     uint rwfValue;
     
     mapping(address => uint) public balances;
     
     constructor (address payable _member) public {
         member = _member;
     }
     
     function getAddress() external view returns(address payable) {
        return member;
    }
    function setAddress(address payable _member) public {
        member = _member;
    }
     
     function payTo(address  _poolAddress) public payable onlyOwner {
         balances[msg.sender]++;
         member.transfer(msg.value);
     }
     
     function fixCoinConversion(uint _moneyVal)public returns (uint) {  //Converts 1000RWF to 1coin
        rwfValue = 1000;
        uint coinValue = _moneyVal / rwfValue;
         
        return coinValue;
     }
     
    modifier onlyOwner(){
        require(msg.sender == member);
     _;    
    }
       

 }
