
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
        let picture = PictureInput(image:UIImage(named:"8.jpg")!)
        picture --> renderView!
        picture.processImage()
    }
}
