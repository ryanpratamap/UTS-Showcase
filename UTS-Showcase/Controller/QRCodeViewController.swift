//
//  QRCodeViewController.swift
//  UTS-Showcase
//
//  Created by Ryan Pratama Pangestu Lo on 16/5/22.
//
//  Edited by:
//  Adrian Crespo Sanjines
//  Elizabeth Kim
//  Michele Paulosky
//  Ryan Pratama Pangestu Lo

import Foundation
import UIKit
import CoreImage.CIFilterBuiltins

class QRCodeViewController: UIViewController {
    //QR code image view
    @IBOutlet weak var qrImage: UIImageView!
    //Access the built in qr code function within CIFilter class
    let context = CIContext()
    let filter = CIFilter.qrCodeGenerator()
    //URL for the code
    var url = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //In this case all codes are dummy codes redirecting to the UTS website
        url = "https://www.uts.edu.au"
        //Display QR Code
        qrImage.image = generateQRCode(url)
    }
    /*
     Function generates QR code image
     */
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
