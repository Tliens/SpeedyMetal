//
//  LookupFilter.swift
//  GPUMetal2D
//
//  Created by Quinn on 2018/12/11.
//  Copyright © 2018 Quinn. All rights reserved.
//

public class LookupFilter: BasicOperation {
    public var intensity: Float = 1.0 {
        didSet {
            uniformSettings[0] = intensity
        }
    }
    
    public var lookupImage: PictureInput? {
        didSet {
            lookupImage?.addTarget(self, atTargetIndex:1)
            lookupImage?.processImage()
        }
    }
    
    public init() {
        super.init(fragmentFunctionName:"lookupFragment", numberOfInputs:2)
        
        uniformSettings.appendUniform(1.0)
    }
}
