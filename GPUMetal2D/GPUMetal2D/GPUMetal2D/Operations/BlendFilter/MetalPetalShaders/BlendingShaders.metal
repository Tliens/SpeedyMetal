//
// This is an auto-generated source file.
//

#include <metal_stdlib>
#include "MTIShaderLib.h"
#include "ShaderType.h"

using namespace metal;
using namespace metalpetal;

typedef struct
{
    float intensity;
} IntensityUniform;

fragment half4 normalBlend(TwoInputVertexIO fragmentInput [[stage_in]],
                                    texture2d<half> inputTexture [[ texture(0) ]],
                                    texture2d<half> overlayTexture [[ texture(1) ]],
                                    constant IntensityUniform& uniform [[ buffer(1) ]]
                                    ) {
    constexpr sampler quadSampler;
    half4 inputColor = inputTexture.sample(quadSampler, fragmentInput.textureCoordinate);
    half4 overlayColor = overlayTexture.sample(quadSampler, fragmentInput.textureCoordinate);
    half4 blendColor = half4(normalBlend(float4(inputColor),float4(overlayColor)));
    half4 outputColor = half4(mix(inputColor, blendColor, half(uniform.intensity)));
    return outputColor;
}

fragment half4 darkenBlend(TwoInputVertexIO fragmentInput [[stage_in]],
                           texture2d<half> inputTexture [[ texture(0) ]],
                           texture2d<half> overlayTexture [[ texture(1) ]],
                           constant IntensityUniform& uniform [[ buffer(1) ]]
                           ) {
    constexpr sampler quadSampler;
    half4 inputColor = inputTexture.sample(quadSampler, fragmentInput.textureCoordinate);
    half4 overlayColor = overlayTexture.sample(quadSampler, fragmentInput.textureCoordinate);
    half4 blendColor = half4(darkenBlend(float4(inputColor),float4(overlayColor)));
    half4 outputColor = half4(mix(inputColor, blendColor, half(uniform.intensity)));
    return outputColor;
}

fragment half4 multiplyBlend(TwoInputVertexIO fragmentInput [[stage_in]],
                           texture2d<half> inputTexture [[ texture(0) ]],
                           texture2d<half> overlayTexture [[ texture(1) ]],
                           constant IntensityUniform& uniform [[ buffer(1) ]]
                           ) {
    constexpr sampler quadSampler;
    half4 inputColor = inputTexture.sample(quadSampler, fragmentInput.textureCoordinate);
    half4 overlayColor = overlayTexture.sample(quadSampler, fragmentInput.textureCoordinate);
    half4 blendColor = half4(multiplyBlend(float4(inputColor),float4(overlayColor)));
    half4 outputColor = half4(mix(inputColor, blendColor, half(uniform.intensity)));
    return outputColor;
}



fragment half4 colorBurnBlend(TwoInputVertexIO fragmentInput [[stage_in]],
                             texture2d<half> inputTexture [[ texture(0) ]],
                             texture2d<half> overlayTexture [[ texture(1) ]],
                             constant IntensityUniform& uniform [[ buffer(1) ]]
                             ) {
    constexpr sampler quadSampler;
    half4 inputColor = inputTexture.sample(quadSampler, fragmentInput.textureCoordinate);
    half4 overlayColor = overlayTexture.sample(quadSampler, fragmentInput.textureCoordinate);
    half4 blendColor = half4(colorBurnBlend(float4(inputColor),float4(overlayColor)));
    half4 outputColor = half4(mix(inputColor, blendColor, half(uniform.intensity)));
    return outputColor;
}

fragment half4 linearBurnBlend(TwoInputVertexIO fragmentInput [[stage_in]],
                             texture2d<half> inputTexture [[ texture(0) ]],
                             texture2d<half> overlayTexture [[ texture(1) ]],
                             constant IntensityUniform& uniform [[ buffer(1) ]]
                             ) {
    constexpr sampler quadSampler;
    half4 inputColor = inputTexture.sample(quadSampler, fragmentInput.textureCoordinate);
    half4 overlayColor = overlayTexture.sample(quadSampler, fragmentInput.textureCoordinate);
    half4 blendColor = half4(linearBurnBlend(float4(inputColor),float4(overlayColor)));
    half4 outputColor = half4(mix(inputColor, blendColor, half(uniform.intensity)));
    return outputColor;
}

fragment half4 darkerColorBlend(TwoInputVertexIO fragmentInput [[stage_in]],
                             texture2d<half> inputTexture [[ texture(0) ]],
                             texture2d<half> overlayTexture [[ texture(1) ]],
                             constant IntensityUniform& uniform [[ buffer(1) ]]
                             ) {
    constexpr sampler quadSampler;
    half4 inputColor = inputTexture.sample(quadSampler, fragmentInput.textureCoordinate);
    half4 overlayColor = overlayTexture.sample(quadSampler, fragmentInput.textureCoordinate);
    half4 blendColor = half4(darkerColorBlend(float4(inputColor),float4(overlayColor)));
    half4 outputColor = half4(mix(inputColor, blendColor, half(uniform.intensity)));
    return outputColor;
}

fragment half4 lightenBlend(TwoInputVertexIO fragmentInput [[stage_in]],
                             texture2d<half> inputTexture [[ texture(0) ]],
                             texture2d<half> overlayTexture [[ texture(1) ]],
                             constant IntensityUniform& uniform [[ buffer(1) ]]
                             ) {
    constexpr sampler quadSampler;
    half4 inputColor = inputTexture.sample(quadSampler, fragmentInput.textureCoordinate);
    half4 overlayColor = overlayTexture.sample(quadSampler, fragmentInput.textureCoordinate);
    half4 blendColor = half4(lightenBlend(float4(inputColor),float4(overlayColor)));
    half4 outputColor = half4(mix(inputColor, blendColor, half(uniform.intensity)));
    return outputColor;
}

fragment half4 screenBlend(TwoInputVertexIO fragmentInput [[stage_in]],
                             texture2d<half> inputTexture [[ texture(0) ]],
                             texture2d<half> overlayTexture [[ texture(1) ]],
                             constant IntensityUniform& uniform [[ buffer(1) ]]
                             ) {
    constexpr sampler quadSampler;
    half4 inputColor = inputTexture.sample(quadSampler, fragmentInput.textureCoordinate);
    half4 overlayColor = overlayTexture.sample(quadSampler, fragmentInput.textureCoordinate);
    half4 blendColor = half4(screenBlend(float4(inputColor),float4(overlayColor)));
    half4 outputColor = half4(mix(inputColor, blendColor, half(uniform.intensity)));
    return outputColor;
}

fragment half4 colorDodgeBlend(TwoInputVertexIO fragmentInput [[stage_in]],
                             texture2d<half> inputTexture [[ texture(0) ]],
                             texture2d<half> overlayTexture [[ texture(1) ]],
                             constant IntensityUniform& uniform [[ buffer(1) ]]
                             ) {
    constexpr sampler quadSampler;
    half4 inputColor = inputTexture.sample(quadSampler, fragmentInput.textureCoordinate);
    half4 overlayColor = overlayTexture.sample(quadSampler, fragmentInput.textureCoordinate);
    half4 blendColor = half4(colorDodgeBlend(float4(inputColor),float4(overlayColor)));
    half4 outputColor = half4(mix(inputColor, blendColor, half(uniform.intensity)));
    return outputColor;
}

fragment half4 addBlend(TwoInputVertexIO fragmentInput [[stage_in]],
                             texture2d<half> inputTexture [[ texture(0) ]],
                             texture2d<half> overlayTexture [[ texture(1) ]],
                             constant IntensityUniform& uniform [[ buffer(1) ]]
                             ) {
    constexpr sampler quadSampler;
    half4 inputColor = inputTexture.sample(quadSampler, fragmentInput.textureCoordinate);
    half4 overlayColor = overlayTexture.sample(quadSampler, fragmentInput.textureCoordinate);
    half4 blendColor = half4(addBlend(float4(inputColor),float4(overlayColor)));
    half4 outputColor = half4(mix(inputColor, blendColor, half(uniform.intensity)));
    return outputColor;
}


fragment half4 lighterColorBlend(TwoInputVertexIO fragmentInput [[stage_in]],
                             texture2d<half> inputTexture [[ texture(0) ]],
                             texture2d<half> overlayTexture [[ texture(1) ]],
                             constant IntensityUniform& uniform [[ buffer(1) ]]
                             ) {
    constexpr sampler quadSampler;
    half4 inputColor = inputTexture.sample(quadSampler, fragmentInput.textureCoordinate);
    half4 overlayColor = overlayTexture.sample(quadSampler, fragmentInput.textureCoordinate);
    half4 blendColor = half4(lighterColorBlend(float4(inputColor),float4(overlayColor)));
    half4 outputColor = half4(mix(inputColor, blendColor, half(uniform.intensity)));
    return outputColor;
}

fragment half4 overlayBlend(TwoInputVertexIO fragmentInput [[stage_in]],
                             texture2d<half> inputTexture [[ texture(0) ]],
                             texture2d<half> overlayTexture [[ texture(1) ]],
                             constant IntensityUniform& uniform [[ buffer(1) ]]
                             ) {
    constexpr sampler quadSampler;
    half4 inputColor = inputTexture.sample(quadSampler, fragmentInput.textureCoordinate);
    half4 overlayColor = overlayTexture.sample(quadSampler, fragmentInput.textureCoordinate);
    half4 blendColor = half4(overlayBlend(float4(inputColor),float4(overlayColor)));
    half4 outputColor = half4(mix(inputColor, blendColor, half(uniform.intensity)));
    return outputColor;
}


fragment half4 softLightBlend(TwoInputVertexIO fragmentInput [[stage_in]],
                             texture2d<half> inputTexture [[ texture(0) ]],
                             texture2d<half> overlayTexture [[ texture(1) ]],
                             constant IntensityUniform& uniform [[ buffer(1) ]]
                             ) {
    constexpr sampler quadSampler;
    half4 inputColor = inputTexture.sample(quadSampler, fragmentInput.textureCoordinate);
    half4 overlayColor = overlayTexture.sample(quadSampler, fragmentInput.textureCoordinate);
    half4 blendColor = half4(softLightBlend(float4(inputColor),float4(overlayColor)));
    half4 outputColor = half4(mix(inputColor, blendColor, half(uniform.intensity)));
    return outputColor;
}


fragment half4 hardLightBlend(TwoInputVertexIO fragmentInput [[stage_in]],
                             texture2d<half> inputTexture [[ texture(0) ]],
                             texture2d<half> overlayTexture [[ texture(1) ]],
                             constant IntensityUniform& uniform [[ buffer(1) ]]
                             ) {
    constexpr sampler quadSampler;
    half4 inputColor = inputTexture.sample(quadSampler, fragmentInput.textureCoordinate);
    half4 overlayColor = overlayTexture.sample(quadSampler, fragmentInput.textureCoordinate);
    half4 blendColor = half4(hardLightBlend(float4(inputColor),float4(overlayColor)));
    half4 outputColor = half4(mix(inputColor, blendColor, half(uniform.intensity)));
    return outputColor;
}

fragment half4 vividLightBlend(TwoInputVertexIO fragmentInput [[stage_in]],
                             texture2d<half> inputTexture [[ texture(0) ]],
                             texture2d<half> overlayTexture [[ texture(1) ]],
                             constant IntensityUniform& uniform [[ buffer(1) ]]
                             ) {
    constexpr sampler quadSampler;
    half4 inputColor = inputTexture.sample(quadSampler, fragmentInput.textureCoordinate);
    half4 overlayColor = overlayTexture.sample(quadSampler, fragmentInput.textureCoordinate);
    half4 blendColor = half4(vividLightBlend(float4(inputColor),float4(overlayColor)));
    half4 outputColor = half4(mix(inputColor, blendColor, half(uniform.intensity)));
    return outputColor;
}

fragment half4 linearLightBlend(TwoInputVertexIO fragmentInput [[stage_in]],
                             texture2d<half> inputTexture [[ texture(0) ]],
                             texture2d<half> overlayTexture [[ texture(1) ]],
                             constant IntensityUniform& uniform [[ buffer(1) ]]
                             ) {
    constexpr sampler quadSampler;
    half4 inputColor = inputTexture.sample(quadSampler, fragmentInput.textureCoordinate);
    half4 overlayColor = overlayTexture.sample(quadSampler, fragmentInput.textureCoordinate);
    half4 blendColor = half4(linearLightBlend(float4(inputColor),float4(overlayColor)));
    half4 outputColor = half4(mix(inputColor, blendColor, half(uniform.intensity)));
    return outputColor;
}

fragment half4 pinLightBlend(TwoInputVertexIO fragmentInput [[stage_in]],
                             texture2d<half> inputTexture [[ texture(0) ]],
                             texture2d<half> overlayTexture [[ texture(1) ]],
                             constant IntensityUniform& uniform [[ buffer(1) ]]
                             ) {
    constexpr sampler quadSampler;
    half4 inputColor = inputTexture.sample(quadSampler, fragmentInput.textureCoordinate);
    half4 overlayColor = overlayTexture.sample(quadSampler, fragmentInput.textureCoordinate);
    half4 blendColor = half4(pinLightBlend(float4(inputColor),float4(overlayColor)));
    half4 outputColor = half4(mix(inputColor, blendColor, half(uniform.intensity)));
    return outputColor;
}

fragment half4 hardMixBlend(TwoInputVertexIO fragmentInput [[stage_in]],
                             texture2d<half> inputTexture [[ texture(0) ]],
                             texture2d<half> overlayTexture [[ texture(1) ]],
                             constant IntensityUniform& uniform [[ buffer(1) ]]
                             ) {
    constexpr sampler quadSampler;
    half4 inputColor = inputTexture.sample(quadSampler, fragmentInput.textureCoordinate);
    half4 overlayColor = overlayTexture.sample(quadSampler, fragmentInput.textureCoordinate);
    half4 blendColor = half4(hardMixBlend(float4(inputColor),float4(overlayColor)));
    half4 outputColor = half4(mix(inputColor, blendColor, half(uniform.intensity)));
    return outputColor;
}

fragment half4 differenceBlend(TwoInputVertexIO fragmentInput [[stage_in]],
                             texture2d<half> inputTexture [[ texture(0) ]],
                             texture2d<half> overlayTexture [[ texture(1) ]],
                             constant IntensityUniform& uniform [[ buffer(1) ]]
                             ) {
    constexpr sampler quadSampler;
    half4 inputColor = inputTexture.sample(quadSampler, fragmentInput.textureCoordinate);
    half4 overlayColor = overlayTexture.sample(quadSampler, fragmentInput.textureCoordinate);
    half4 blendColor = half4(differenceBlend(float4(inputColor),float4(overlayColor)));
    half4 outputColor = half4(mix(inputColor, blendColor, half(uniform.intensity)));
    return outputColor;
}

fragment half4 exclusionBlend(TwoInputVertexIO fragmentInput [[stage_in]],
                             texture2d<half> inputTexture [[ texture(0) ]],
                             texture2d<half> overlayTexture [[ texture(1) ]],
                             constant IntensityUniform& uniform [[ buffer(1) ]]
                             ) {
    constexpr sampler quadSampler;
    half4 inputColor = inputTexture.sample(quadSampler, fragmentInput.textureCoordinate);
    half4 overlayColor = overlayTexture.sample(quadSampler, fragmentInput.textureCoordinate);
    half4 blendColor = half4(exclusionBlend(float4(inputColor),float4(overlayColor)));
    half4 outputColor = half4(mix(inputColor, blendColor, half(uniform.intensity)));
    return outputColor;
}

fragment half4 subtractBlend(TwoInputVertexIO fragmentInput [[stage_in]],
                             texture2d<half> inputTexture [[ texture(0) ]],
                             texture2d<half> overlayTexture [[ texture(1) ]],
                             constant IntensityUniform& uniform [[ buffer(1) ]]
                             ) {
    constexpr sampler quadSampler;
    half4 inputColor = inputTexture.sample(quadSampler, fragmentInput.textureCoordinate);
    half4 overlayColor = overlayTexture.sample(quadSampler, fragmentInput.textureCoordinate);
    half4 blendColor = half4(subtractBlend(float4(inputColor),float4(overlayColor)));
    half4 outputColor = half4(mix(inputColor, blendColor, half(uniform.intensity)));
    return outputColor;
}

fragment half4 divideBlend(TwoInputVertexIO fragmentInput [[stage_in]],
                             texture2d<half> inputTexture [[ texture(0) ]],
                             texture2d<half> overlayTexture [[ texture(1) ]],
                             constant IntensityUniform& uniform [[ buffer(1) ]]
                             ) {
    constexpr sampler quadSampler;
    half4 inputColor = inputTexture.sample(quadSampler, fragmentInput.textureCoordinate);
    half4 overlayColor = overlayTexture.sample(quadSampler, fragmentInput.textureCoordinate);
    half4 blendColor = half4(divideBlend(float4(inputColor),float4(overlayColor)));
    half4 outputColor = half4(mix(inputColor, blendColor, half(uniform.intensity)));
    return outputColor;
}


fragment half4 hueBlend(TwoInputVertexIO fragmentInput [[stage_in]],
                             texture2d<half> inputTexture [[ texture(0) ]],
                             texture2d<half> overlayTexture [[ texture(1) ]],
                             constant IntensityUniform& uniform [[ buffer(1) ]]
                             ) {
    constexpr sampler quadSampler;
    half4 inputColor = inputTexture.sample(quadSampler, fragmentInput.textureCoordinate);
    half4 overlayColor = overlayTexture.sample(quadSampler, fragmentInput.textureCoordinate);
    half4 blendColor = half4(hueBlend(float4(inputColor),float4(overlayColor)));
    half4 outputColor = half4(mix(inputColor, blendColor, half(uniform.intensity)));
    return outputColor;
}

fragment half4 saturationBlend(TwoInputVertexIO fragmentInput [[stage_in]],
                             texture2d<half> inputTexture [[ texture(0) ]],
                             texture2d<half> overlayTexture [[ texture(1) ]],
                             constant IntensityUniform& uniform [[ buffer(1) ]]
                             ) {
    constexpr sampler quadSampler;
    half4 inputColor = inputTexture.sample(quadSampler, fragmentInput.textureCoordinate);
    half4 overlayColor = overlayTexture.sample(quadSampler, fragmentInput.textureCoordinate);
    half4 blendColor = half4(saturationBlend(float4(inputColor),float4(overlayColor)));
    half4 outputColor = half4(mix(inputColor, blendColor, half(uniform.intensity)));
    return outputColor;
}

fragment half4 colorBlend(TwoInputVertexIO fragmentInput [[stage_in]],
                             texture2d<half> inputTexture [[ texture(0) ]],
                             texture2d<half> overlayTexture [[ texture(1) ]],
                             constant IntensityUniform& uniform [[ buffer(1) ]]
                             ) {
    constexpr sampler quadSampler;
    half4 inputColor = inputTexture.sample(quadSampler, fragmentInput.textureCoordinate);
    half4 overlayColor = overlayTexture.sample(quadSampler, fragmentInput.textureCoordinate);
    half4 blendColor = half4(colorBlend(float4(inputColor),float4(overlayColor)));
    half4 outputColor = half4(mix(inputColor, blendColor, half(uniform.intensity)));
    return outputColor;
}


fragment half4 luminosityBlend(TwoInputVertexIO fragmentInput [[stage_in]],
                             texture2d<half> inputTexture [[ texture(0) ]],
                             texture2d<half> overlayTexture [[ texture(1) ]],
                             constant IntensityUniform& uniform [[ buffer(1) ]]
                             ) {
    constexpr sampler quadSampler;
    half4 inputColor = inputTexture.sample(quadSampler, fragmentInput.textureCoordinate);
    half4 overlayColor = overlayTexture.sample(quadSampler, fragmentInput.textureCoordinate);
    half4 blendColor = half4(luminosityBlend(float4(inputColor),float4(overlayColor)));
    half4 outputColor = half4(mix(inputColor, blendColor, half(uniform.intensity)));
    return outputColor;
}


