//
//  ShaderType.h
//  GPUMetal2D
//
//  Created by Quinn on 2018/12/10.
//  Copyright © 2018 Quinn. All rights reserved.
//

#ifndef ShaderType_h
#define ShaderType_h
using namespace metal;

constant half3 luminanceWeighting = half3(0.2125, 0.7154, 0.0721);

struct SingleInputVertexIO
{
    float4 position [[position]];
    float2 textureCoordinate [[user(texturecoord)]];
};

struct TwoInputVertexIO
{
    float4 position [[position]];
    float2 textureCoordinate [[user(texturecoord)]];
    float2 textureCoordinate2 [[user(texturecoord2)]];
};

struct ThreeInputVertexIO
{
    float4 position [[position]];
    float2 textureCoordinate [[user(texturecoord)]];
    float2 textureCoordinate2 [[user(texturecoord2)]];
    float2 textureCoordinate3 [[user(texturecoord3)]];

};
#endif /* ShaderType_h */
