//
//  SaturationFilter.metal
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
    float saturation;
} SaturationUniform;

fragment half4 saturationFragment(SingleInputVertexIO fragmentInput [[stage_in]],
                                  texture2d<half> inputTexture [[texture(0)]],
                                  constant SaturationUniform& uniform [[ buffer(1) ]])
{
    constexpr sampler quadSampler;
    half4 color = inputTexture.sample(quadSampler, fragmentInput.textureCoordinate);
    
    half luminance = dot(color.rgb, luminanceWeighting);
    
    return half4(mix(half3(luminance), color.rgb, half(uniform.saturation)), color.a);
}
