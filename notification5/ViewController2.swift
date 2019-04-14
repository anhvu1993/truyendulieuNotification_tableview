//
//  ViewController2.swift
//  notification5
//
//  Created by Đặng Khánh  on 4/7/19.
//  Copyright © 2019 Khánh Trắng. All rights reserved.
//

import UIKit

extension Notification.Name {
    static let notification = Notification.Name("key")
    
}



class ViewController2: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var contacts: Contact!
    
    
    @IBOutlet weak var editName: UITextField!
    @IBOutlet weak var editAge: UITextField!
    @IBOutlet weak var editAddress: UITextField!
    @IBOutlet weak var editImage: UIImageView!
    
    //    var listdata = [Contact]()
    var images:UIImage? {
        didSet {
            editImage.image = UIImage(data: (images?.pngData())!)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        if contacts != nil {
            editName.text = contacts?.name
            editAge.text = contacts?.age
            editAddress.text = contacts?.address
            editImage.image = UIImage(data: contacts.img!)
        }
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func change(_ sender: Any) {
        let name = editName.text
        let age = editAge.text
        let editAdd = editAddress.text
        if editImage.image != nil {
            let photo = editImage.image
            contacts = Contact(name: name!, age: age!, address: editAdd!, imgs:  (photo?.pngData())!)
            NotificationCenter.default.post(name: .notification, object:contacts )
            navigationController?.popViewController(animated: true)
        } else {
            print(" loi image")
        }
    }
    
    @IBAction func selectImage(_ sender: UITapGestureRecognizer) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        images = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        dismiss(animated: true, completion: nil)
        
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
}
