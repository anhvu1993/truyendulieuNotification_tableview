//
//  TableViewCell.swift
//  notification5
//
//  Created by Đặng Khánh  on 4/6/19.
//  Copyright © 2019 Khánh Trắng. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var names: UILabel!
    @IBOutlet weak var ages: UILabel!
    @IBOutlet weak var addres: UILabel!
    @IBOutlet weak var img: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        NotificationCenter.default.addObserver(self, selector: #selector(TableViewCell.notificationData(text:)), name: .notification, object: nil)
        
    }
    
    
    @objc func notificationData(text: NSNotification) {
        if let updateName = text.userInfo?["key"] as? String {
            names.text = updateName
        }
    }
    
}
