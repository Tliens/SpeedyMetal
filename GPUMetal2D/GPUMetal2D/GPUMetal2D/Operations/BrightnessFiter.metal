//
//  BrightnessFiter.metal
//  GPUMetal2D
//
//  Created by Quinn on 2018/12/11.
//  Copyright © 2018 Quinn. All rights reserved.
//

#include <metal_stdlib>
#import "ShaderType.h"

using namespace metal;

typedef struct
{
    float brightness;
} BrightnessUniform;

fragment half4 brightnessFragment(SingleInputVertexIO fragmentInput [[stage_in]],
                                  texture2d<half> inputTexture [[texture(0)]],
                                  constant BrightnessUniform& uniform [[ buffer(1) ]])
{
    constexpr sampler quadSampler;
    half4 color = inputTexture.sample(quadSampler, fragmentInput.textureCoordinate);
    
    return half4(color.rgb + uniform.brightness, color.a);
}



