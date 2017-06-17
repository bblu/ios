//
//  main.swift
//  Person
//
//  Created by lu wenbo on 8/29/16.
//  Copyright © 2016 lu wenbo. All rights reserved.
//

import Foundation

print("Hello, World!")

let bblu = Person(firstName: "lu", lastName: "wenbo")
let some = Person(firstName: "lu", lastName: "wenbo")

if bblu == some {
    print("They are the same!")
}else{
    print("They are different!")
}