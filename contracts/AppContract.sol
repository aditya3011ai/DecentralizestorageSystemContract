// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.17;
contract AppContract{
    struct Access{
        address user;
        bool access;
    }
    struct fileData{
        string url;
        string name;
        string Type;
        string size;
    }
    mapping(address=>fileData[]) value;
    mapping(address=>mapping(address=>bool)) ownership;
    mapping(address=>Access[]) accessList;

    function add(address _user,string memory url,string memory name,string memory Type ,string memory size) external {
        value[_user].push(fileData(url,name,Type,size));
    }
    function allowAccess(address _user) external {
        ownership[msg.sender][_user]= true;
        for(uint i = 0;i<accessList[_user].length;i++){
            if(accessList[msg.sender][i].user==_user){
                accessList[msg.sender][i].access=true;
                return;
            } 
        }
        accessList[msg.sender].push(Access(_user,true));
    }
    function disAllowAccess(address _user) external{
        ownership[msg.sender][_user] = false;
        for(uint i = 0;i<accessList[msg.sender].length;i++){
            if(accessList[msg.sender][i].user==_user){
                accessList[msg.sender][i].access=false;
            } 
        }
    }

    function displayImages(address _user) external view returns(fileData[] memory url){
        require(_user==msg.sender || ownership[_user][msg.sender],"You dont have access to the images of this account");
        return value[_user];
    }

    function shareAccessList()external view returns(Access[] memory){
        return accessList[msg.sender];
    }
}