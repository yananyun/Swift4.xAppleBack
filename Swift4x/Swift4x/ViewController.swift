//
//  ViewController.swift
//  Swift4x
//
//  Created by admindyn on 2018/8/22.
//  Copyright © 2018年 admindyn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
      
        let op:Optional = Optional()
        print(op)
        
        let lp:Loop = Loop()
        print(lp)
        
        let jsonH:JsonHandler = JsonHandler()
        
        print(jsonH)
        
        let g:Generic = Generic()
        
        print(g)
        
        let e:EnumM = EnumM()
        
        print(e)
        
        
        let m:StructClassM = StructClassM()
        
        print(m.name)
        
        let m2:StructClassM = StructClassM(name: "ladalada", age: 76)
        
        print(m2.name)
        
        
        let c:ChildNode = ChildNode()
        
        
        print(c.message)
        print("子类调用父类不可以被重写的方法")
        c.testSCM()
        
        
        let t:TypeCheck = TypeCheck()
        
        print(t)
        
        
        let err:ErrorHandler = ErrorHandler()
       
        print(err)
        
       
        let p:ProtocolHandler = ProtocolHandler()
        
        print(p)
        
        
        
    }


}

