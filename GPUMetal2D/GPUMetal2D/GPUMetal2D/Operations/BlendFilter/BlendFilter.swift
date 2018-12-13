//
//  NormalBlendFilter.swift
//  GPUMetal2D
//
//  Created by Quinn on 2018/12/11.
//  Copyright © 2018 Quinn. All rights reserved.
//

import Foundation

public class BlendFilter: BasicOperation {
    public var intensity: Float = 1.0 {
        didSet {
            uniformSettings[0] = intensity
        }
    }
    
    public var overlayImage: PictureInput? {
        didSet {
            overlayImage?.addTarget(self, atTargetIndex:1)
            overlayImage?.processImage()
        }
    }
    
    public init(blend:BlendType) {
        super.init(fragmentFunctionName:blend.rawValue, numberOfInputs:2)
        
        uniformSettings.appendUniform(1.0)
    }
}

public enum BlendType:String {
    
    case normal = "normalBlend"
    case darken = "darkenBlend"
    case multiply = "multiplyBlend"
    case colorBurn = "colorBurnBlend"
    case linearBurn = "linearBurnBlend"
    case darkerColor = "darkerColorBlend"
    case lighten = "lightenBlend"
    case screen = "screenBlend"
    case colorDodge = "colorDodgeBlend"
    case add = "addBlend"
    case lighterColor = "lighterColorBlend"
    case overlay = "overlayBlend"
    case softLight = "softLightBlend"
    case hardLight = "hardLightBlend"
    case vividLight = "vividLightBlend"
    case linearLight = "linearLightBlend"
    case pinLight = "pinLightBlend"
    case hardMix = "hardMixBlend"
    case difference = "differenceBlend"
    case exclusion = "exclusionBlend"
    case subtract = "subtractBlend"
    case divide = "divideBlend"
    case hue = "hueBlend"
    case saturation = "saturationBlend"
    case color = "colorBlend"
    case luminosity = "luminosityBlend"
}
