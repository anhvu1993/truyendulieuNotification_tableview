//
//  TableViewController.swift
//  notification5
//
//  Created by Đặng Khánh  on 4/5/19.
//  Copyright © 2019 Khánh Trắng. All rights reserved.
//

import UIKit



class TableViewController: UITableViewController {
    
    
    var contact = [Contact]()
    
    
    @IBOutlet var myTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTable.backgroundColor = .gray
        
        NotificationCenter.default.addObserver(self, selector: #selector(notification(notification:)), name: .notification, object: nil)
        
        contact = [
            Contact(name: "Lam" , age: "22", address: "Yên Bái", imgs: (UIImage(named: "1")?.pngData())!),
            Contact(name: "Minh", age: "20", address: "Hà Nội", imgs: (UIImage(named: "2")?.pngData())!),
            Contact(name: "Sơn", age: "23", address: "Thái Bình", imgs: (UIImage(named: "3")?.pngData())!)]
        
        // Uncomment the following line to preserve selection between presentations
        clearsSelectionOnViewWillAppear = false
        
        // tạo 1 nút button bằng code
        navigationItem.leftBarButtonItem = editButtonItem
    }
    
    // MARK: - Table view data source
    @objc func notification(notification: NSNotification) {
        if let contact = notification.object as? Contact {
            if let indexPath = tableView.indexPathForSelectedRow {
                self.contact[indexPath.row] = contact
            }else{
                self.contact.append(contact)
            }
            tableView.reloadData()
        }else{
            print("sai roi")
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Section  \(section)"
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contact.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = myTable.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableViewCell
        let arrayContact = contact[indexPath.row]
        cell?.img.image = UIImage(data: arrayContact.img!)
        cell?.ages.text = arrayContact.age
        cell?.addres.text = arrayContact.address
        cell?.names.text = arrayContact.name
        
        
        
        return cell!
    }
    
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    // sửa hàng
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            //number.remove(at: [indexPath.row])
            contact.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    // di chuyển hàng
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        return
    }
    
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    // chiếu cao của cell
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    // chỉnh màu cell
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        func colorForIndex(index: Int) -> UIColor {
            let itemCount = contact.count - 1
            let color = (CGFloat(index) / CGFloat(itemCount)) * 0.6
            return UIColor(red: 2.0, green: color, blue: 0.0, alpha: 1.0)
        }
        cell.backgroundColor = colorForIndex(index: indexPath.row)
        
    }
    
    // MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch (segue.identifier ?? "") {
        case "addNew":
            return
        case "edit":
            let vc = segue.destination as! ViewController2
            guard let indexPath = myTable.indexPathForSelectedRow else {return}
            vc.contacts = contact[indexPath.row]
        default:
            return
        }
    }
    
}
