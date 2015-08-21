Shader "Custom/Diffuse Simple" {
	
	Properties {
		_Color ( "Display Color", Color ) = (0, 0, 0, 1)
	}
	
	SubShader {
		Tags { "RenderType" = "Opaque" }
		CGPROGRAM
		#pragma surface surf Lambert
		
		struct Input {
			float4 color : COLOR;
		};
		
		float4 _Color;
		void surf ( Input IN, inout SurfaceOutput o ) {
			o.Albedo = _Color.rgb;
			o.Alpha = _Color.a;
		}
		
		ENDCG
	}
	Fallback "Diffuse"
}
