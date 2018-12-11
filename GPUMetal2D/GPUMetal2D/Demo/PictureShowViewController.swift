
//
//  PictureShowViewController.swift
//  GPUMetal2D
//
//  Created by Quinn on 2018/12/10.
//  Copyright © 2018 Quinn. All rights reserved.
//

import UIKit

class PictureShowViewController: UIViewController {

    var renderView:RenderView?
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        renderView = RenderView.init(frame: view.bounds)
        view.addSubview(renderView!)
        showImage_2()
    }
    
    
    
    
}
extension PictureShowViewController{
    ///简单的图片显示
    func showImage_1(){
        let picture = PictureInput(image:UIImage(named:"8.jpg")!)
        picture --> renderView!
        picture.processImage()
    }
    /// 实现滤镜链
    func showImage_2(){
        var saturationFilter: SaturationFilter!
        var brightnessFilter: BrightnessFilter!
        var abaoFilter: LookupFilter!
        
        let picture = PictureInput(image:UIImage(named:"8.jpg")!)
        
        saturationFilter = SaturationFilter.init()
        saturationFilter.saturation = 1.0
        
        brightnessFilter = BrightnessFilter.init()
        brightnessFilter.brightness = 0.0
        
        abaoFilter = LookupFilter.init()
        abaoFilter.lookupImage = PictureInput(image:UIImage(named:"lut_abao.png")!)
        abaoFilter.intensity = 0.0
        
        picture --> saturationFilter --> brightnessFilter --> abaoFilter --> renderView!
        picture.processImage()
    }
    
    
}
