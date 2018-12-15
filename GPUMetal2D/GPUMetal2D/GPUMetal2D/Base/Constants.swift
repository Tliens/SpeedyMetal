//
//  Constants.swift
//  GPUMetal2D
//
//  Created by Quinn on 2018/12/1.
//  Copyright © 2018 Quinn. All rights reserved.
//

import Foundation
import Metal
/*
 3 4
 1 2
*/
/// 标准图片顶点数据
public let standardImageVertices: [Float] = [-1.0, -1.0, 1.0, -1.0, -1.0, 1.0, 1.0, 1.0]
/*
 1 2
 3 4
 */
/// 垂直图片顶点数据
public let verticallyInvertedImageVertices: [Float] = [-1.0, 1.0, 1.0, 1.0, -1.0, -1.0, 1.0, -1.0]

/*
 3 4
 1 2
 */
/// 纹理坐标 左下角为坐标原点
public let standardTextureCoordinates: [Float] = [0.0, 0.0, 1.0, 0.0, 0.0, 1.0, 1.0, 1.0]

enum FunctionName {
    static let OneInputVertex = "oneInputVertex"
    static let TwoInputVertex = "twoInputVertex"
    static let PassthroughFragment = "passthroughFragment"
    
    static func defaultVertexFunctionNameForInputs(_ inputCount:UInt) -> String {
        switch inputCount {
        case 1:
            return OneInputVertex
        case 2:
            return TwoInputVertex
        default:
            return OneInputVertex
        }
    }
}

public enum RenderColor {
    static let clearColor = MTLClearColorMake(0.85, 0.85, 0.85, 1)
}
