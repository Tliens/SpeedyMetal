//
//  SaturationFilter.swift
//  GPUMetal2D
//
//  Created by Quinn on 2018/12/11.
//  Copyright © 2018 Quinn. All rights reserved.
//

import Foundation

public class SaturationFilter: BasicOperation {
    public var saturation: Float = 1.0 {
        didSet {
            uniformSettings[0] = saturation
        }
    }
    
    public init() {
        super.init(fragmentFunctionName:"saturationFragment", numberOfInputs:1)
        
        uniformSettings.appendUniform(1.0)
    }
}
