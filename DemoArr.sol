pragma solidity ^0.4.24;

contract DemoArr {

    uint [10] tens;
    uint [] us;

    uint [] public u = [1, 2, 3];   // 生成函数
    uint[] public b = new uint[](7);  //storage

    function getTen(uint x) public view returns (uint) {
        tens[0] = x;
        return tens[0];
    }

    function getLen() public view returns (uint) {
        return tens.length;
    }

    function modifyLenAndPush() public view returns (uint) {
       b.length = 10;      //可以修改storage的数组

       b[7] = 100;
       b.push(20);
        // tens.push(10);


       uint[] memory a = new uint[](7);
    //   a.push(10);
    //   a.length = 10;

       return b.length;
   }
   
    uint[][5] public a;
    function setA() public  {
        a[1] =  [1,2];
        a[2] =  [1,2,3];
        //  a[6] =  [1,2,3];
    }
    
    
    uint[2][] public  T= new uint[2][](0);//一个二维数组；一维长度为2，二维长度未定
    
    //这个函数可以通过运行，说明动态二维数组中，二维数组中可以添加一个新的一位数组。
    //首先添加一维数组[1,2]，然后再次添加一维数组[3,4]
    function pushArr(uint[2] t){
        T.push(t);
    }
    
    function getLength()constant returns(uint){
        return T.length;
    }
    
    //输入0给的结果是1 2 ，输入 1 给的结果是 3 4
    function getNumber(uint index) constant returns(uint,uint){
        return (T[index][0], T[index][1]);
    }

    
   

}
