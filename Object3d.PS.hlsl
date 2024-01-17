#include "Object3d.hlsli"

struct Material {
	float32_t4 color;
};

ConstantBuffer<Material> gMaterial : register(b0);

struct PixelShaderOutput {
	float32_t4 color : SV_TARGET0;
};

Texture2D<float32_t4> gTexture : register(t0);
SamplerState gSampler : register(s0);

PixelShaderOutput main(VertexShaderOutput input)
{
	PixelShaderOutput output;
    float32_t4 textureColor = gTexture.Sample(gSampler, input.texcoord);
    output.color = gMaterial.color * textureColor;

	/*float NdotL = dot(normalize(input.normal), -gDirectionalLight.direction);
	float cos = pow(NdotL * 0.5f + 0.5f, 2.0f);
	output.color.rgb = gMaterial.color.rgb * textureColor.rgb * gDirectionalLight.color.rgb * cos * gDirectionalLight.intensity;
	output.color.a = gMaterial.color.a * textureColor.a;*/

	//output.color = float32_t4(1.0f, 1.0f, 0.0f, 1.0f);
	return output;
}

