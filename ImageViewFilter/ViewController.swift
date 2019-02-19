//
//  ViewController.swift
//  ImageViewFilter
//
//  Created by OSP on 2/19/19.
//  Copyright © 2019 QBK. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var image: UIImageView!

    @IBOutlet weak var labelBr: UILabel!
    @IBOutlet weak var contrastLabel: UILabel!
    @IBOutlet weak var saturationLab: UILabel!
    @IBOutlet weak var noiseLabel: UILabel!
    
    @IBOutlet weak var brightness: UISlider!
    @IBOutlet weak var contrast: UISlider!
    @IBOutlet weak var saturation: UISlider!
    @IBOutlet weak var noise: UISlider!
    var filter = CIFilter(name: "CIColorControls")
    override func viewDidLoad() {
        super.viewDidLoad()
        self.brightness.addTarget(self, action:#selector(ViewController.sliderValueDidChange(_:)), for: .valueChanged)
        // Do any additional setup after loading the view, typically from a nib.
    }


    func increaseContrast(_ image: UIImage) -> UIImage {
        let inputImage = CIImage(image: image)!
        let parameters = [
            "inputContrast": NSNumber(value: 2)
        ]
        let outputImage = inputImage.applyingFilter("CIColorControls", parameters: parameters)
        
        let context = CIContext(options: nil)
        let img = context.createCGImage(outputImage, from: outputImage.extent)!
        return UIImage(cgImage: img)
    }
    
    @objc func sliderValueDidChange(_ sender: UISlider!) {
        
        if sender.tag == 0 {
            
            let displayinPercentage: Int = Int((sender.value/200) * 10000)
            labelBr.text = ("\(displayinPercentage)")
            let beginImage = CIImage(image: image.image!)
            self.filter = CIFilter(name: "CIColorControls")
            self.filter?.setValue(beginImage, forKey: kCIInputImageKey)
            self.filter?.setValue(sender.value, forKey: kCIInputBrightnessKey)
            if let ciimage = filter!.outputImage {
               // filteredImage = ciimage
                self.image.image = UIImage(ciImage: ciimage)
            }
            
        } else if sender.tag == 1 {
            
          /*  let displayinPercentage: Int = Int((sender.value/200) * 10000)
            contrastValueLabel.text = ("\(displayinPercentage)")
            self.selectedPictureImageView.image = originalImage
            let beginImage = CIImage(image: self.selectedPictureImageView.image!)
            self.filter = CIFilter(name: "CIColorControls")
            self.filter?.setValue(beginImage, forKey: kCIInputImageKey)
            self.filter.setValue(sender.value, forKey: kCIInputContrastKey)
            self.filteredImage = self.filter?.outputImage
            self.selectedPictureImageView.image = UIImage(cgImage: self.context.createCGImage(self.filteredImage!, from: (self.filteredImage?.extent)!)!)
            sliderValue = sender.value
            */
        } else if sender.tag == 2 {
            
           /* let displayinPercentage: Int = Int((sender.value/200) * 10000)
            saturationValueLabel.text = ("\(displayinPercentage)")
            self.selectedPictureImageView.image = originalImage
            let beginImage = CIImage(image: self.selectedPictureImageView.image!)
            self.filter = CIFilter(name: "CIColorControls")
            self.filter?.setValue(beginImage, forKey: kCIInputImageKey)
            self.filter.setValue(sender.value, forKey: kCIInputSaturationKey)
            self.filteredImage = self.filter?.outputImage
            self.selectedPictureImageView.image = UIImage(cgImage: self.context.createCGImage(self.filteredImage!, from: (self.filteredImage?.extent)!)!)
            sliderValue = sender.value*/
            
        } else if sender.tag == 3 {
            
           /* let displayinPercentage: Int = Int((sender.value/200) * 10000)
            sharpenValueLabel.text = ("\(displayinPercentage)")
            self.selectedPictureImageView.image = originalImage
            let beginImage = CIImage(image: self.selectedPictureImageView.image!)
            self.filter = CIFilter(name: "CIUnsharpMask")
            self.filter?.setValue(beginImage, forKey: kCIInputImageKey)
            self.filter.setValue(7, forKey: kCIInputRadiusKey)
            self.filter.setValue(sender.value, forKey: kCIInputIntensityKey)
            self.filteredImage = self.filter?.outputImage
            self.selectedPictureImageView.image = UIImage(cgImage: self.context.createCGImage(self.filteredImage!, from: (self.filteredImage?.extent)!)!)
            sliderValue = sender.value*/
            
        }
    }

}

