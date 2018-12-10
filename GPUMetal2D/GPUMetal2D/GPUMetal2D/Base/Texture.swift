//
//  Texture.swift
//  GPUMetal2D
//
//  Created by Quinn on 2018/12/1.
//  Copyright © 2018 Quinn. All rights reserved.
//

import Foundation
import MetalKit
//生成一个纹理
public class Texture: NSObject {
    public let texture: MTLTexture
    public init(texture: MTLTexture) {
        self.texture = texture
    }
    public init(pixelFormat: MTLPixelFormat = .bgra8Unorm, width: Int, height: Int, mipmapped: Bool = false) {
        /// 创建 2D 纹理描述器
        let textureDescriptor = MTLTextureDescriptor.texture2DDescriptor(pixelFormat: pixelFormat,
                                                                         width: width,
                                                                         height: height,
                                                                         mipmapped: mipmapped)
        
        /// MTLTextureUsage declares how the texture will be used over its lifetime (bitwise OR for multiple uses)
        /// 决定纹理在生命周期中 将会如何被使用
        textureDescriptor.usage = [.renderTarget, .shaderRead, .shaderWrite]
        
        /// 根据纹理参数，创建纹理
        guard let newTexture = sharedContext.device.makeTexture(descriptor: textureDescriptor) else {
            fatalError("Could not create texture of size: (\(width), \(height))")
        }
        
        self.texture = newTexture
    }
}
