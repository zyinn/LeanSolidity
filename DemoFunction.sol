pragma solidity ^0.8.6;

contract DemoFunction {

  
  function a1(uint x) external returns (uint z) {
    return x * x;
  }

  function b1(uint x) external returns (uint z) {
    return 2 * x;
  }
  
  
  function a2(uint x) internal returns (uint z) {
    return x * x;
  }

  function b2(uint x) internal returns (uint z) {
    return 2 * x;
  }
  
//   function (uint) external returns (uint) f;
//   //  变量f 可以被赋值为函数a 或 函数b
//   function select(function (uint) external returns (uint) f, uint x) external returns (uint z) {
//      return f(x);
//   }

//   // 函数作为返回值的类型
//   function getfun() public view returns (function (uint) external returns (uint) ) {
//       return this.b1;
//   }

  //23815   22494  gas
 function callTest1(bool useB, uint x) external returns (uint z) {
    // 变量f 可以被赋值为 函数a 或 函数b
    function (uint) external returns (uint) f;
    if (useB) {
        f  = this.b1;
    } else {
        f = this.a1;
    }
    return f(x);
 }
   
 function callTest2(bool useB, uint x) external returns (uint z) {
    // 变量f 可以被赋值为 函数a 或 函数b
    function (uint) internal returns (uint) f;
    if (useB) {
        f  = b2;
    } else {
        f = a2;
    }
    return f(x);
 }


  // 0x26121ff0
   function f() public view returns (bytes4) {
        return this.f.selector;
   }

}