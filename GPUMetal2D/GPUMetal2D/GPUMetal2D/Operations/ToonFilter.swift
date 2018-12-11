//
//  ToonFilter.swift
//  GPUMetal2D
//
//  Created by Quinn on 2018/12/11.
//  Copyright © 2018 Quinn. All rights reserved.
//

import Foundation

public class ToonFilter: BasicOperation {
    
    public var magtol: Float = 0.5 {
        didSet {
            uniformSettings[0] = magtol
        }
    }
    
    public var quantize: Float = 10.0 {
        didSet {
            uniformSettings[1] = quantize
        }
    }
    
    public init() {
        super.init(fragmentFunctionName:"toonFragment", numberOfInputs:1)
        
        uniformSettings.appendUniform(0.5)
        uniformSettings.appendUniform(10.0)
    }
}
