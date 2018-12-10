//
//  Context.swift
//  GPUMetal2D
//
//  Created by Quinn on 2018/12/1.
//  Copyright © 2018 Quinn. All rights reserved.
//

import Foundation
import MetalKit

public let sharedContext = Context()

/// 上下文所需的内容，包含可以重复使用的对象
/// 有些对象的创建十分昂贵，比较耗时
public class Context {
    
    /// 设备信息，创建其他对象
    public let device: MTLDevice
    /// 命令队列
    public let commandQueue: MTLCommandQueue
    /// 默认提供的函数库
    public let defaultLibrary: MTLLibrary
    /// 加载纹理工具
    public let textureLoader: MTKTextureLoader
    
    init() {
        /// 获取设备首选对象
        /// MTLDevice 的创建很昂贵、耗时，并且它可以一直使用。所以只需要创建一次即可。
        guard let device = MTLCreateSystemDefaultDevice() else {
            fatalError("Could not create Metal Device")
        }
        self.device = device
        
        /// device 创建命令队列
        guard let queue = self.device.makeCommandQueue() else {
            fatalError("Could not create command queue")
        }
        self.commandQueue = queue
        
        do {
            let frameworkBundle = Bundle(for: Context.self)
            let metalLibraryPath = frameworkBundle.path(forResource: "default", ofType: "metallib")!
            
            self.defaultLibrary = try device.makeLibrary(filepath:metalLibraryPath)
        } catch {
            fatalError("Could not load library")
        }
        
        self.textureLoader = MTKTextureLoader(device: self.device)
    }
}
