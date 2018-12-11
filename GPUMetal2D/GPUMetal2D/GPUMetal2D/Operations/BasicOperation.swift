//
//  BasicOperation.swift
//  GPUMetal2D
//
//  Created by Quinn on 2018/12/11.
//  Copyright © 2018 Quinn. All rights reserved.
//

import Foundation
import Metal
//targets、sources 不再累述，管理着对应的输入输出。
//renderPipelineState，本次渲染操作的具体描述，主要差异体现在 Vertex Function 和 Fragment Function 上。
//uniformSettings，滤镜需要的一些参数配置。
//inputTextures，对应的输入纹理。
open class BasicOperation: ImageProcessingOperation {
    
    public let maximumInputs: UInt
    public let targets = TargetContainer()
    public let sources = SourceContainer()
    
    public var uniformSettings = ShaderUniformSettings()
    
    let renderPipelineState: MTLRenderPipelineState
    var inputTextures = [UInt:Texture]()
    let textureInputSemaphore = DispatchSemaphore(value:1)
    
    public init(vertexFunctionName: String? = nil,
                fragmentFunctionName: String,
                numberOfInputs: UInt = 1) {
        self.maximumInputs = numberOfInputs
        
        let concreteVertexFunctionName = vertexFunctionName ?? FunctionName.defaultVertexFunctionNameForInputs(numberOfInputs)
        renderPipelineState = generateRenderPipelineState(vertexFunctionName: concreteVertexFunctionName, fragmentFunctionName: fragmentFunctionName)
    }
    
    public func newTextureAvailable(_ texture: Texture, fromSourceIndex: UInt) {
        let _ = textureInputSemaphore.wait(timeout:DispatchTime.distantFuture)
        defer {
            textureInputSemaphore.signal()
        }
        
        inputTextures[fromSourceIndex] = texture
        
        if (UInt(inputTextures.count) >= maximumInputs) {
            let outputWidth: Int
            let outputHeight: Int
            
            let firstInputTexture = inputTextures[0]!
            outputWidth = firstInputTexture.texture.width
            outputHeight = firstInputTexture.texture.height
            
            guard let commandBuffer = sharedContext.commandQueue.makeCommandBuffer() else {
                return
            }
            
            let outputTexture = Texture(width: outputWidth, height: outputHeight)
            
            commandBuffer.renderQuad(pipelineState: renderPipelineState, uniformSettings: uniformSettings, inputTextures: inputTextures, outputTexture: outputTexture)
            commandBuffer.commit()
            
            updateTargetsWithTexture(outputTexture)
        }
    }
    
    public func transmitPreviousImage(to target: ImageConsumer, atIndex: UInt) {
        // TODO: Finish implementation later
    }
}
