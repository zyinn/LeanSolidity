pragma solidity >=0.6.0 <0.9.0;

// 引入版本
//pragma experimental ABIEncoderV2;

contract DemoStruct {

    struct CustomType {
        bool myBool;
        uint myInt;
        // CustomType aa;
    }


    struct CustomType3 {
        string name;
        mapping(string=>uint) score;
        int age;
    }

  
    function init() public {
        CustomType memory ct3 = CustomType(true, 2);   // 在函数内声明
        
        // 仅声明变量，不初始化
        CustomType memory ct1;
    
        // 按成员顺序（结构体声明时的顺序）初始化
        CustomType memory ct2 = CustomType(true, 2);
        
        CustomType3 memory ct33 = CustomType3("Tiny", 18);   // 跳过对mapping的初始化
    }

    // 命名方式的初始
    CustomType ct = CustomType({ myBool: true, myInt: 2});
        
    function getSet() public returns (bool) {
        ct.myBool = false;
        return ct.myBool;
    }

    // 合法
    function interFunc(CustomType memory ct) internal {

    }

    // 非法
    // function exterFunc(CustomType memory ct) public {
    // }


     //
     mapping (string => CustomType3) customTypes;
    
     function newCampaign(string memory x) public{
        CustomType3 storage c = customTypes[x];
        c.name = x;
        c.age = 12;
    }
    


}
