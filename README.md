# GPUMetal2D
操作流程

Inputs->operation->operation->...->operation ->Outputs

Inputs，存放输入源。具体表现为 PictureInput。
Outputs，存放输出源。具体表现为 RenderView。
Operation，存放各种滤镜。具体表现为 BasicOperation 等。
Base，至于 Base，则是为了完成上述的处理过程，添加的一些必要辅助、工具类。

## Base
Base 里面，涉及到较多 Metal 相关的，可以细分为这么两类：

### 自定义基础数据类型：
    ImageOrientation、Color、Position、Size、Matrix、Timestamp、Texture
    包括方向，颜色，位置，大小，矩阵，时间戳，纹理等
    ps:相比 GPUImage 2，目前少了 FillMode
    
###  辅助、工具类：
    MetalRenderingDevice、MetalRendering、ShaderUniformSettings、Pipeline
    
    1.MetalRenderingDevice，以单例的形式，维护了 Metal 里面频繁要用到的对象，包括:
        MTLDevice，MTLCommandQueue，MTLLibrary
    2.Metal 里面某些对象的创建代价是比较大的，而且可以重复使用。所以这类的，就需要放在单例里面统一维护，避免不必要的性能开销。这类对象具体包括：
        Command queues
        Data buffers
        Textures
        Sampler states
        Libraries
        Compute states
        Render pipeline states
        Depth/stencil states
        
        MetalRenderingDevice，有点像 OpenGL 里面的 Context。统一维护了 Metal 相关的环境

    MetalRendering，顾名思义，是专门用来做渲染的。
    ```swift
    func generateRenderPipelineState(device:MetalRenderingDevice, vertexFunctionName:String, fragmentFunctionName:String, operationName:String) -> MTLRenderPipelineState {
    // ....
    }
    
    extension MTLCommandBuffer {
    func renderQuad(pipelineState:MTLRenderPipelineState, uniformSettings:ShaderUniformSettings? = nil, inputTextures:[UInt:Texture], useNormalizedTextureCoordinates:Bool = true, imageVertices:[Float] = standardImageVertices, outputTexture:Texture, outputOrientation:ImageOrientation = .portrait) {
    // ....
    }
    }
    ```
    generateRenderPipelineState，通过传入的 device，vertexFunctionName 以及 fragmentFunctionName，来生成所需的 MTLRenderPipelineState。operationName 是辅助参数，调试查看的，和实际的渲染没有什么关系。

    renderQuad 是针对 MTLCommandBuffer 扩展的一个方法，专门用来处理渲染，即对应的渲染管线配置，指令提交等。它接收对应的配置项，比如 MTLRenderPipelineState 和 inputTextures，然后执行渲染操作，将结果绘制到 outputTexture 上。可以说，这是整个渲染操作的核心所在。
    
    ShaderUniformSettings，这里要先介绍下 uniform，到目前为止，我们还没有接触过。
    
    
    ImageSource 表示该对象具有输出能力。它维护了一组 targets，即能接收对应输出的对象
    ImageConsumer，表示该对象具有输入能力。它维护了一组 sources，即对应的输入源
