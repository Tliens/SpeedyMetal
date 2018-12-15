
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
    let picture = PictureInput(image:UIImage(named:"8.jpg")!)
    var timer : Timer?
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        renderView = RenderView.init(frame: view.bounds)
        view.addSubview(renderView!)
        showImage_5()
    }
    
    
    
    
}
extension PictureShowViewController{
    ///简单的图片显示
    func showImage_1(){

        picture --> renderView!
        picture.processImage()
    }
    /// 实现滤镜链 饱和度、明亮度、阿宝色
    func showImage_2(){
        var saturationFilter: SaturationFilter!
        var brightnessFilter: BrightnessFilter!
        var abaoFilter: LookupFilter!
        
        
        
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
    
    /// 中心放大模糊
    func showImage_3(){
        var zoomBlur: ZoomBlur!

        zoomBlur = ZoomBlur.init()
        zoomBlur.blurSize = 3.0
        
        picture --> zoomBlur --> renderView!
        picture.processImage()
    }
    
    ///blend
    func showImage_4(){
        var blenFilter:BlendFilter!

        blenFilter = BlendFilter.init(blend: .normal)
        blenFilter.overlayImage = PictureInput(image:UIImage(named:"blend_mode_source_overlay")!)
        blenFilter.intensity = 1
        
        picture --> blenFilter --> renderView!
        picture.processImage()
    }
    
    //分割滤镜
    func showImage_5(){
        
        let splitFilter = LoopkUpSplitFilter()
        
        splitFilter.lookupImage1 = PictureInput(image:UIImage(named:"lut_abao.png")!)
        splitFilter.lookupImage2 = PictureInput(image:UIImage(named:"ll.png")!)

        picture --> splitFilter --> renderView!
        
        var progress:Float = 0
        timer = Timer.init(timeInterval: 0.01, repeats: true, block: { [weak self](timer) in
            if progress > 1 {
                progress = 0
            }else{
                progress = progress + 0.01
            }
            print(progress)
            splitFilter.progress = progress
            self?.picture.processImage()
        })
        RunLoop.current.add(timer!, forMode: .common)
        timer?.fire()

    }

}
