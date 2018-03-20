//
//  ViewController.swift
//  QRGenerator
//
//  Created by Andrew on 3/13/18.
//  Copyright © 2018 Andrii Halabuda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var qrImage: UIImageView!
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        
        if let string = textField.text {
            
            let data = string.data(using: .ascii, allowLossyConversion: false)
            let filter = CIFilter(name: "CIQRCodeGenerator")
            filter?.setValue(data, forKey: "inputMessage")
            
            let image = UIImage(ciImage: (filter?.outputImage)!)
            
            qrImage.image = image
        }
    }
    

}

