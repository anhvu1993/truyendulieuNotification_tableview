//
//  list.swift
//  notification5
//
//  Created by Đặng Khánh  on 4/5/19.
//  Copyright © 2019 Khánh Trắng. All rights reserved.
//

import UIKit

struct Contact {
    var name: String?
    var age: String?
    var address: String?
    var img: Data?
    
    init(name: String, age: String, address: String, imgs: Data) {
        self.name = name
        self.age = age
        self.address = address
        self.img = imgs
    }
    
}


