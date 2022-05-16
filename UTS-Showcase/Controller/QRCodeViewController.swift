//
//  QRCodeViewController.swift
//  UTS-Showcase
//
//  Created by Ryan Pratama Pangestu Lo on 16/5/22.
//

import Foundation
import UIKit
import CoreImage.CIFilterBuiltins

class QRCodeViewController: UIViewController {
    
    @IBOutlet weak var qrImage: UIImageView!
    
    let context = CIContext()
    let filter = CIFilter.qrCodeGenerator()
    var url = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        url = "https://www.uts.edu.au"
        qrImage.image = generateQRCode(url)
    }
    
    func generateQRCode(_ url: String) -> UIImage {
        let data = Data(url.utf8)
        filter.setValue(data, forKey: "inputMessage")
        
        if let qrImage = filter.outputImage {
            if let qrCodeCGImage = context.createCGImage(qrImage, from: qrImage.extent) {
                return UIImage(cgImage: qrCodeCGImage)
            }
        }
        return UIImage(systemName: "xmark") ?? UIImage()
    }
}
