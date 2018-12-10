//
//  FillMode.swift
//  GPUMetal2D
//
//  Created by Quinn on 2018/12/1.
//  Copyright © 2018 Quinn. All rights reserved.
//

import UIKit

public enum FillMode {
    case stretch //拉伸
    case preserveAspectRatio //在保持长宽比的前提下，缩放图片，使得图片在容器内完整显示出来。
    case preserveAspectRatioAndFill //保持宽高比，且填满,会用部分内容看不到
    
    /// 顶点数组坐标转换
    ///
    /// - Parameters:
    ///   - vertices: 顶点坐标
    ///   - fromInputSize: 目标输入大小
    ///   - toFitSize: 目标输出大小
    /// - Returns: 转换后的顶点数组
    func transformVertices(_ vertices: [Float], fromInputSize: CGSize, toFitSize: CGSize) -> [Float] {
        guard (vertices.count == 8) else {
            fatalError("Attempted to transform a non-quad to account for fill mode.")
        }
        
        /// 原始比例
        let aspectRatio = Float(fromInputSize.height) / Float(fromInputSize.width)
        /// 目标比例
        let targetAspectRatio = Float(toFitSize.height) / Float(toFitSize.width)
        
        let yRatio: Float
        let xRatio: Float
        switch self {
        case .stretch:
            return vertices
        case .preserveAspectRatio:
            if (aspectRatio > targetAspectRatio) {
                yRatio = 1.0
                xRatio = (Float(fromInputSize.width) / Float(toFitSize.width)) * (Float(toFitSize.height) / Float(fromInputSize.height))
            } else {
                xRatio = 1.0
                yRatio = (Float(fromInputSize.height) / Float(toFitSize.height)) * (Float(toFitSize.width) / Float(fromInputSize.width))
            }
        case .preserveAspectRatioAndFill:
            if (aspectRatio > targetAspectRatio) {
                xRatio = 1.0
                yRatio = (Float(fromInputSize.height) / Float(toFitSize.height)) * (Float(toFitSize.width) / Float(fromInputSize.width))
            } else {
                yRatio = 1.0
                xRatio = (Float(toFitSize.height) / Float(fromInputSize.height)) * (Float(fromInputSize.width) / Float(toFitSize.width))
            }
        }
        
        let xConversionRatio: Float = xRatio * Float(toFitSize.width) / 2.0
        let xConversionDivisor: Float = Float(toFitSize.width) / 2.0
        let yConversionRatio: Float = yRatio * Float(toFitSize.height) / 2.0
        let yConversionDivisor: Float = Float(toFitSize.height) / 2.0
        
        // The Double casting here is required by Linux
        
        let value1: Float = Float(round(Double(vertices[0] * xConversionRatio))) / xConversionDivisor
        let value2: Float = Float(round(Double(vertices[1] * yConversionRatio))) / yConversionDivisor
        let value3: Float = Float(round(Double(vertices[2] * xConversionRatio))) / xConversionDivisor
        let value4: Float = Float(round(Double(vertices[3] * yConversionRatio))) / yConversionDivisor
        let value5: Float = Float(round(Double(vertices[4] * xConversionRatio))) / xConversionDivisor
        let value6: Float = Float(round(Double(vertices[5] * yConversionRatio))) / yConversionDivisor
        let value7: Float = Float(round(Double(vertices[6] * xConversionRatio))) / xConversionDivisor
        let value8: Float = Float(round(Double(vertices[7] * yConversionRatio))) / yConversionDivisor
        
        return [value1, value2, value3, value4, value5, value6, value7, value8]
    }
}
