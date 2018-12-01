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
//上下文
public class Context {
    
    public let device: MTLDevice
    public let commandQueue: MTLCommandQueue
    public let defaultLibrary: MTLLibrary
    
    public let textureLoader: MTKTextureLoader
    
    init() {
        guard let device = MTLCreateSystemDefaultDevice() else {
            fatalError("Could not create Metal Device")
        }
        self.device = device
        
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
