//
//  BrightnessFilter.swift
//  GPUMetal2D
//
//  Created by Quinn on 2018/12/11.
//  Copyright © 2018 Quinn. All rights reserved.
//

import Foundation
public class BrightnessFilter: BasicOperation {
    public var brightness: Float = 0.0 {
        didSet {
            uniformSettings[0] = brightness
        }
    }
    
    public init() {
        super.init(fragmentFunctionName:"brightnessFragment", numberOfInputs:1)
        
        uniformSettings.appendUniform(0.0)
    }
}
