//
//  SplitFilter.swift
//  GPUMetal2D
//
//  Created by Quinn on 2018/12/15.
//  Copyright © 2018 Quinn. All rights reserved.
//

import Foundation
public class LoopkUpSplitFilter: BasicOperation {

    public var intensity: Float = 1.0 {
        didSet {
            uniformSettings[0] = intensity
        }
    }
    public var progress: Float = 1.0 {
        didSet {
            uniformSettings[1] = progress
        }
    }
    public var lookupImage1: PictureInput? {
        didSet {
            lookupImage1?.addTarget(self, atTargetIndex:1)
            lookupImage1?.processImage()
        }
    }
    public var lookupImage2: PictureInput? {
        didSet {
            lookupImage2?.addTarget(self, atTargetIndex:2)
            lookupImage2?.processImage()
        }
    }
    public init() {
        super.init(fragmentFunctionName:"lookupSplitFragment", numberOfInputs:3)
        uniformSettings.appendUniform(1)
        uniformSettings.appendUniform(0)
    }
    
}
