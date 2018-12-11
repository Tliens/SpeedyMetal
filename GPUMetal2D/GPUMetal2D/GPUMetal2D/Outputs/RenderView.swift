//
//  RenderView.swift
//  GPUMetal2D
//
//  Created by Quinn on 2018/12/10.
//  Copyright © 2018 Quinn. All rights reserved.
//

import Foundation
import MetalKit
import UIKit
public class RenderView: UIView {
    public let sources = SourceContainer()
    public let maximumInputs: UInt = 1
    
    public var clearColor = RenderColor.clearColor
    
    public var fillMode = FillMode.preserveAspectRatio
    
    var currentTexture: Texture?
    var renderPipelineState: MTLRenderPipelineState!
    
    lazy var metalView: MTKView = {
        let metalView = MTKView.init(frame: self.bounds, device: sharedContext.device)
        metalView.isPaused = true //以首选帧率刷新  屏幕最大刷新率
        //它会根据硬件功能以及您的游戏或应用可能正在执行的其他任务，以尽可能接近的速率通知目标。所选择的实际帧速率通常是屏幕的最大刷新率的一个因素，以提供一致的帧速率。例如，如果屏幕的最大刷新率是每秒60帧，那么这也是显示链接设置为实际帧速率的最高帧速率。但是，如果要求较低的帧速率，显示链接可能会选择每秒30帧，20帧或15帧或其他速率作为实际帧速率。选择您的应用可以始终如一地维护的帧速率。默认值为0.当此值为0时，首选帧速率等于显示的最大刷新率
        return metalView
    }()
    
    // MARK: -
    // MARK: Init
    public override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    public override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    private func commonInit() {
        ///通过传入的 device，vertexFunctionName 以及 fragmentFunctionName，
        /// 来生成所需的 MTLRenderPipelineState
        renderPipelineState = generateRenderPipelineState(vertexFunctionName: FunctionName.OneInputVertex,
                                                          fragmentFunctionName: FunctionName.PassthroughFragment)
        
        metalView.delegate = self
        addSubview(metalView)
    }
}

// MARK: -
// MARK: ImageConsumer
extension RenderView: ImageConsumer {
    
    public func newTextureAvailable(_ texture: Texture, fromSourceIndex: UInt) {
        currentTexture = texture
        
        metalView.draw()
    }
}

// MARK: -
// MARK: MTKViewDelegate
extension RenderView: MTKViewDelegate {
    
    /// 绘制
    public func draw(in view: MTKView) {
        guard let currentDrawable = self.metalView.currentDrawable,
            let imageTexture = currentTexture else {
                debugPrint("Warning: Could update Current Drawable")
                return
        }
        
        let outputTexture = Texture(texture: currentDrawable.texture)
        let scaledVertices = fillMode.transformVertices(verticallyInvertedImageVertices, fromInputSize:CGSize(width: imageTexture.texture.width, height: imageTexture.texture.height), toFitSize:metalView.drawableSize)
        
        let commandBuffer = sharedContext.commandQueue.makeCommandBuffer()!
        commandBuffer.renderQuad(pipelineState: renderPipelineState, inputTextures: [0:imageTexture], outputTexture: outputTexture, clearColor:clearColor, imageVertices: scaledVertices)
        
        commandBuffer.present(currentDrawable)
        commandBuffer.commit()
    }
    
    public func mtkView(_ view: MTKView, drawableSizeWillChange size: CGSize) {
    }
}
