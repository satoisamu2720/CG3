
struct Material {
	float32_t4 color;
};

ConstantBuffer<Material> gMaterial : register(b0);

struct PixelShaderOutput {
	float32_t4 color : SV_TARGET0;
};

PixelShaderOutput main() {
	PixelShaderOutput output;
	output.color = gMaterial.color;
	//output.color = float32_t4(1.0f, 1.0f, 0.0f, 1.0f);
	return output;
}