//
//  shader.metal
//  B2D
//
//  Created by Birth2Death on 1/23/24.
//

#include <metal_stdlib>
#include <SwiftUI/SwiftUI_Metal.h>
using namespace metal;


[[ stitchable ]] half4 noise(float2 position, half4 currentColor, float time) {
    float value = fract(sin(dot(position + time, float2(12.9898, 78.233))) * 43758.5453);
    return half4(value, value, value, 1) * currentColor.a;
}



[[ stitchable ]] float2 simpleWave(float2 position, float time) {
//    return position + float2 (0, sin(time + position.x / 20)) * 10;
    return position + float2 (sin(time + position.y / 20), sin(time + position.x / 20)) * 2;
}

[[ stitchable ]] float2 complexWave(float2 position, float time, float2 size, float speed, float strength, float frequency) {
    float2 normalizedPosition = position / size;
    float moveAmount = time * speed;

    position.x += sin((normalizedPosition.x + moveAmount) * frequency) * strength;
    position.y += cos((normalizedPosition.y + moveAmount) * frequency) * strength;

    return position;
}
[[ stitchable ]]
half4 bumpNoise(float2 position, half4 currentColor, float time) {
    float noiseValue = fract(sin(dot(position + time, float2(12.9898, 78.233))) * 43758.5453);
    float bumpValue = 1.0 + sin(time) * 0.5; // 시간에 따라 변하는 볼록한 효과를 만듭니다.
    return half4(noiseValue, noiseValue, noiseValue, 1) * currentColor.a * bumpValue;
}
