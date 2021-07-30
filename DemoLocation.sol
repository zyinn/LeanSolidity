pragma solidity ^0.8.6;

contract DemoLocation{
    
   uint[] x; //  x的存储位置是storage

    // memoryArray的存储位置是 memory
    function f(uint[] memory memoryArray) public returns (uint[] memory) {
        x = memoryArray;    // 从 memory 复制到 storage

        uint[] storage y = x;    // storage 引用传递局部变量y（y 是一个 storage 引用）
        y[1] = 2;               // x y 都会被修改

        // 错误， 不能将memory赋值给局部变量
        // y = memoryArray;

        // g(x);               // 引用传递， g可以改变x的内容
        // h(x);               // 拷贝到memory， h无法改变x的内容
        return x;
    }

    function g(uint[] storage storageArray) internal {
        storageArray[2] = 3;
    }

    function h(uint[] memory memoryArray) public {
        memoryArray[2] = 4;
    }
}
