//
//  GeneratorVC.swift
//  QRGenerator
//
//  Created by Andrew on 3/20/18.
//  Copyright © 2018 Andrii Halabuda. All rights reserved.
//

import UIKit

class GeneratorVC: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var imgQRCode: UIImageView!
    @IBOutlet weak var btnAction: UIButton!
    @IBOutlet weak var slider: UISlider!
    
    var qrcodeImage: CIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func performButtonAction(sender: AnyObject) {
        if qrcodeImage == nil {
            if textField.text == "" {
                return
            }
            
            let data = textField.text?.data(using: String.Encoding.isoLatin1, allowLossyConversion: false)
            
            let filter = CIFilter(name: "CIQRCodeGenerator")
            
            filter?.setValue(data, forKey: "inputMessage")
            filter?.setValue("Q", forKey: "inputCorrectionLevel")
            
            qrcodeImage = filter?.outputImage
            
            imgQRCode.image = UIImage(ciImage: qrcodeImage)
            
            textField.resignFirstResponder()
        }
    }
    
    
    @IBAction func changeImageViewScale(sender: AnyObject) {
        
    }


}