//
//  EnumM.swift
//  Swift4x
//
//  Created by admindyn on 2018/8/24.
//  Copyright © 2018年 admindyn. All rights reserved.
//

import Foundation

/*
 原始值枚举用例
 enum 枚举名称: 原始值类型, 采纳的协议 {
 case 枚举用例1 = 原始值1
 case 枚举用例2 = 原始值2
 }
 关联值枚举用例
 enum 枚举名称: 采纳的协议 {
 case 枚举用例1
 case 枚举用例2(关联值类型)
 }
 
 */

enum SomeEnumeration {
    //枚举定义放在这里
}
enum CompassPoint {
    //指南针
    case north
    case south
    case east
    case west
    
}
//MARK: 原始值类型枚举用例
/*
 1、原始值和关联值是不同的。原始值是在定义枚举时被预先填充的值，像上述三个 ASCII 码。对于一个特定的枚举成员，它的原始值始终不变。关联值是创建一个基于枚举成员的常量或变量时才设置的值，枚举成员的关联值可以变化。
 2、
 这里给枚举成员 没有做关联类型 而是直接默认值（原始值）预填充 这些原始值类型必须相同 因此这里 定义了Character
 3、原始值类型枚举用例
 
 */

enum ASCIIControlCharacter: Character {
    case tab = "\t"
    case lineFeed = "\n"
    case carriageReturn = "\r"
}

//MARK:  关联类型枚举用例
/*
 关联类型枚举用例
 枚举的每一个枚举成员 都有关联类型
 定义一个名为Barcode的枚举类型，它的一个成员值是具有(Int，Int，Int，Int)类型关联值的upc，另一个成员值是具有String类型关联值的qrCode。
 */
enum Barcode {
    case upc(Int,Int,Int,Int)
    case qrCode(String)
}



class EnumM: NSObject {
    
    override init() {
        super.init()
        self.testEnum()
    }
    func testEnum()  {
        /*
         当directHead的类型已知时，再次为其赋值可以省略枚举类型名。
         */
        let directHead:CompassPoint = .south
        
        print(directHead)
        
        print(directHead.hashValue)
        
        switch directHead {
            
        case .north:
            print("Lots of planets have a north")
        case .south:
            print("watch out for penguins")
            
        case .east:
            print("where the sun rises")
        case .west:
            print("where the skies are blue")
        }
        
        
        let barcodeEnum:Barcode = .qrCode("ABCD")
        
        print(barcodeEnum)
        
        //MARK:关联枚举类型 swich case 模式匹配
        
        switch barcodeEnum {
            
        case .upc(let numberSystem, let manufacture, let product, let check):
            print("UPC产品一维码:\(numberSystem),\(manufacture),\(product),\(check)")
        case .qrCode(let qrQ):
            print("QRCode:\(qrQ)")
            
        }
        
        
        let asc:ASCIIControlCharacter = .lineFeed
        
        print(asc)
        print("原始值 自动换行\(asc.rawValue)")
        print(asc.hashValue)
        
        
    }
}


