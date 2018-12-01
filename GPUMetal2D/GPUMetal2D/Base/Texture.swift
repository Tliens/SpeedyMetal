//
//  Texture.swift
//  GPUMetal2D
//
//  Created by Quinn on 2018/12/1.
//  Copyright © 2018 Quinn. All rights reserved.
//

import Foundation
import MetalKit
//纹理
public class Texture: NSObject {
    public let texture: MTLTexture
    public init(texture: MTLTexture) {
        self.texture = texture
    }
    public init(pixelFormat: MTLPixelFormat = .bgra8Unorm, width: Int, height: Int, mipmapped: Bool = false) {
        let textureDescriptor = MTLTextureDescriptor.texture2DDescriptor(pixelFormat: pixelFormat,
                                                                         width: width,
                                                                         height: height,
                                                                         mipmapped: mipmapped)
        textureDescriptor.usage = [.renderTarget, .shaderRead, .shaderWrite]
        
        guard let newTexture = sharedContext.device.makeTexture(descriptor: textureDescriptor) else {
            fatalError("Could not create texture of size: (\(width), \(height))")
        }
        
        self.texture = newTexture
    }
}
