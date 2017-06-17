//
//  Person.swift
//  Person
//
//  Created by lu wenbo on 8/29/16.
//  Copyright © 2016 lu wenbo. All rights reserved.
//

import Foundation

class Person{
    var (firstName, lastName) = ("", "")
    init (firstName: String, lastName: String){
        self.firstName = firstName
        self.lastName = lastName
    }
}

func == (left: Person, right: Person) -> Bool{
    if(left.firstName == right.firstName &&
        left.lastName == right.lastName){
        return true
    }
    return false
}



