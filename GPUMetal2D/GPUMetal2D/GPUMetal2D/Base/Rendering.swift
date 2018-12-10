//
//  Rendering.swift
//  GPUMetal2D
//
//  Created by Quinn on 2018/12/1.
//  Copyright © 2018 Quinn. All rights reserved.
//

import Foundation
import Metal
/// renderQuad 是针对 MTLCommandBuffer 扩展的一个方法，
/// 专门用来处理渲染，即对应的渲染管线配置，指令提交等。它接收对应的配置项，
/// 比如 MTLRenderPipelineState 和 inputTextures，
/// 然后执行渲染操作，将结果绘制到 outputTexture 上。
/// 可以说，这是整个渲染操作的核心所在。

extension MTLCommandBuffer {
    func renderQuad(pipelineState: MTLRenderPipelineState, uniformSettings:ShaderUniformSettings? = nil, inputTextures: [UInt:Texture], outputTexture: Texture,  clearColor: MTLClearColor = RenderColor.clearColor, imageVertices: [Float] = verticallyInvertedImageVertices) {
        let vertexBuffer = sharedContext.device.makeBuffer(bytes: imageVertices,
                                                           length: imageVertices.count * MemoryLayout<Float>.size,
                                                           options: [])!
        let renderPass = MTLRenderPassDescriptor()
        renderPass.colorAttachments[0].texture = outputTexture.texture
        renderPass.colorAttachments[0].clearColor = clearColor
        renderPass.colorAttachments[0].storeAction = .store
        renderPass.colorAttachments[0].loadAction = .clear
        
        guard let renderEncoder = self.makeRenderCommandEncoder(descriptor: renderPass) else {
            fatalError("Could not create render encoder")
        }
        renderEncoder.setFrontFacing(.counterClockwise)
        renderEncoder.setRenderPipelineState(pipelineState)
        renderEncoder.setVertexBuffer(vertexBuffer, offset: 0, index: 0)
        
        
        for textureIndex in 0..<inputTextures.count {
            let currentTexture = inputTextures[UInt(textureIndex)]!
            
            let inputTextureCoordinates = standardTextureCoordinates
            let textureBuffer = sharedContext.device.makeBuffer(bytes: inputTextureCoordinates,
                                                                length: inputTextureCoordinates.count * MemoryLayout<Float>.size,
                                                                options: [])!
            renderEncoder.setVertexBuffer(textureBuffer, offset: 0, index: 1 + textureIndex)
            renderEncoder.setFragmentTexture(currentTexture.texture, index: textureIndex)
        }
        
        uniformSettings?.restoreShaderSettings(renderEncoder: renderEncoder)
        renderEncoder.drawPrimitives(type: .triangleStrip, vertexStart: 0, vertexCount: 4)
        renderEncoder.endEncoding()
    }
}

/// generateRenderPipelineState，通过传入的 device，vertexFunctionName 以及 fragmentFunctionName，
/// 来生成所需的 MTLRenderPipelineState。
/// operationName 是辅助参数，调试查看的，和实际的渲染没有什么关系。
///
/// - Parameters:
///   - vertexFunctionName: 顶点shader
///   - fragmentFunctionName: 片元shader
/// - Returns: 一个包含各种信息的渲染管线
func generateRenderPipelineState(vertexFunctionName: String, fragmentFunctionName: String) -> MTLRenderPipelineState {
    guard let vertexFunction = sharedContext.defaultLibrary.makeFunction(name: vertexFunctionName) else {
        fatalError("Could not compile vertex function \(vertexFunctionName)")
    }
    
    guard let fragmentFunction = sharedContext.defaultLibrary.makeFunction(name: fragmentFunctionName) else {
        fatalError("Could not compile fragment function \(fragmentFunctionName)")
    }
    
    let descriptor = MTLRenderPipelineDescriptor()
    descriptor.colorAttachments[0].pixelFormat = MTLPixelFormat.bgra8Unorm
    descriptor.vertexFunction = vertexFunction
    descriptor.fragmentFunction = fragmentFunction
    
    do {
        return try sharedContext.device.makeRenderPipelineState(descriptor: descriptor)
    } catch {
        fatalError("Could not create render pipeline state for vertex:\(vertexFunctionName), fragment:\(fragmentFunctionName), error:\(error)")
    }
}
