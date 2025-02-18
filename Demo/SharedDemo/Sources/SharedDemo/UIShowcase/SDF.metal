//
//  SDF.metal
//  SharedDemo
//
//  Created by phoenix on 2025/2/18.
//

#include <metal_stdlib>
using namespace metal;

float smoothMin(float x1, float x2, float k) {
    float h = clamp(0.5 - 0.5 * (x2 - x1) / k, 0.0, 1.0);
    return mix(x1, x2, h) - k * h * (1.0 - h);
}

float circleSDF(float2 point, float2 center, float radius) {
    return length(point - center) - radius;
}

namespace SDF {
    [[ stitchable ]] half4 main(float2 position, half4 color, float4 box, float sec) {
        float2 pos = -1.0 + 2.0 * position / min(box.w, box.z);
        float tx = 0.5 * (1.0 + sin(2.0 * sec)) / 2.0;
        float ty = sin(sec);
        
        float sdf1 = circleSDF(pos, float2(tx, 1.0 + ty), 0.4);
        float sdf2 = circleSDF(pos, float2(-tx, 1.0 - ty), 0.4);
        float sdf3 = smoothMin(sdf1, sdf2, 0.4);
        
        if (sdf3 < 0) {
            return half4(0.1, 0.5, 1, 1);
        }
        return half4(1, 1, 1, 1);
    }
}
