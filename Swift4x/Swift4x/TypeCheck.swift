//
//  TypeCheck.swift
//  Swift4x
//
//  Created by admindyn on 2018/8/24.
//  Copyright © 2018年 admindyn. All rights reserved.
//

import Foundation

class MediaItem2 {
    var name:String
    
    init(name:String) {
        self.name = name
    }
    
}


class Movi: MediaItem2 {
    var director:String
    
    init(name:String,director:String) {
        self.director = director
        super.init(name: name)
        
    }
    
}


class Song: MediaItem2 {
    var artist:String
    
    init(name:String,artist:String) {
        self.artist = artist
        super.init(name: name)
    }
    
}

//MARK:as is 操作符 检查数据类型

class TypeCheck:NSObject {
    
    override init() {
        
        super.init()
        
        self.checkType()
    }
    
    func checkType()  {
        //MARK: 类型推断
        /*
         数组 library 的类型被推断为 [MediaItem]
         由于swift类型检测推断出Movi与Song有共同的父类 MediaItem 因此可以 存储在一个数组中
         */
        let library = [
            Movi(name: "Casablanca", director: "Michael Curtiz"),
            Song(name: "Blue Suede Shoes", artist: "Elvis Presley"),
            Movi(name: "Citizen Kane", director: "Orson Welles"),
            Song(name: "The One And Only", artist: "Chesney Hawkes"),
            Song(name: "Never Gonna Give You Up", artist: "Rick Astley")
        ]
        var moviCount = 0
        var songCount = 0
        //MARK: 类型检查
        /*
         这里迭代了数组 library 中的所有项
         你迭代它，依次取出的实例会是 MediaItem 类型的，而不是 Movie 和 Song 类型。
         */
        for item in library
        {
            if item is Movi{
                moviCount += 1
            }else if item is Song{
                songCount += 1
            }
        }
        
        print("Media library contains \(moviCount) movies and \(songCount) songs")
        //MARK: 类型向下转型
        /*
         当向下转型为 Movie 应用在两个 Song 实例时将会失败。为了处理这种情况，使用了可选绑定（optional binding）来检查判断下转是否成功。
         */
        
        for item in library {
            if let movie = item as? Movi {
                print("Movie: '\(movie.name)', dir. \(movie.director)")
            } else if let song = item as? Song {
                print("Song: '\(song.name)', by \(song.artist)")
            }
        }
        
        print("Any AnyObject 数组 向下转型")
        
        
        var things = [Any]()
        
        things.append(0)
        things.append(0.0)
        things.append(42)
        things.append(3.14159)
        things.append("hello")
        things.append((3.0, 5.0))
        things.append(Movi(name: "Ghostbusters", director: "Ivan Reitman"))
        things.append({ (name: String) -> String in "Hello, \(name)" })
        //MARK: switch case 模式匹配
        /*
         Swift 的switch语句比 C 语言中更加强大。case 还可以匹配很多不同的模式，包括范围匹配，元组（tuple）和特定类型匹配。switch语句的 case 中匹配的值可以声明为临时常量或变量，在 case 作用域内使用，也可以配合where来描述更复杂的匹配条件
         */
        /*
         在 switch 表达式的 case 中使用 is 和 as 操作符来找出只知道是 Any 或 AnyObject 类型的常量或变量的具体类型
         */
        for thing in things {
            switch thing {
/*case匹配 不存在隐式的贯穿 不需要像OC 或者C那样每个case 最后需要加break 当需要贯穿时使用 fallthrough*/
           
                
            case let someInt as Int:
                print("an integer value of \(someInt)")
            
            case let someDouble as Double where someDouble > 0:
                print("a positive double value of \(someDouble)")
            case is Double:
                print("some other double value that I don't want to print")
            case let someString as String:
                print("a string value of \"\(someString)\"")
            case let (x, y) as (Double, Double):
                print("an (x, y) point at \(x), \(y)")
            case let movie as Movi:
                print("a movie called '\(movie.name)', dir. \(movie.director)")
            case let stringConverter as (String) -> String:
                print(stringConverter("Michael"))
            default:
                print("something else")
            }
        }
        
        let num = 62
        
        switch num {
            /*区间匹配*/
        case 0..<1:
            
            print("区间匹配：zero")
            
        case 1..<60:
            print("不及格")
        case 60..<100:
            print("及格")
        
            
        default:
            print("不合法")
        }
         //MARK: 区间匹配
        let num2 = 0
        
        switch num2 {
            /*区间匹配*/
        case 0..<1:
            
            print("区间匹配：zero")
            
        case 1..<60:
            print("不及格")
        case 60..<100:
            print("及格")
            
            
        default:
            print("不合法")
        }
        
        
        let anotherPoint = (2, 0)
        /*不像c语言 swift可以一个case 匹配多个值
         
         swift case 模式匹配
         case 分支允许将匹配的值声明为临时常量或变量，并且在case分支体内使用 —— 这种行为被称为值绑定（value binding），因为匹配的值在case分支体内，与临时的常量或变量绑定
         */
        switch anotherPoint {
        case (let x, 0):
            print("on the x-axis with an x value of \(x)")
        case (0, let y):
            print("on the y-axis with a y value of \(y)")
        case let (x, y):
            print("somewhere else at (\(x), \(y))")
        }
        //MARK: 复合匹配
        /*
         复合匹配
         拉丁，阿拉伯，中文或者泰语中的1到4之一
         */
        let numberSymbol: Character = "三"  // 简体中文里的数字 3
        var possibleIntegerValue: Int?
        switch numberSymbol {
        case "1", "١", "一", "๑":
            possibleIntegerValue = 1
        case "2", "٢", "二", "๒":
            possibleIntegerValue = 2
        case "3", "٣", "三", "๓":
            possibleIntegerValue = 3
        case "4", "٤", "四", "๔":
            possibleIntegerValue = 4
        default:
            break
        }
        if let integerValue = possibleIntegerValue {
            print("The integer value of \(numberSymbol) is \(integerValue).")
        } else {
            print("An integer value could not be found for \(numberSymbol).")
        }
        
        
    }
}
