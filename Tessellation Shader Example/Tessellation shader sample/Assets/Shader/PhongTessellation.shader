Shader "Custom/PhongTessellation" {
	Properties {
		_EdgeLegnth ( "Edge Length", Range( 2, 50 ) ) = 5
		_Phong ("Phong Strength", Range ( 0 , 1) ) = 0.5
		_MainTex( "Texture", 2D ) = "white" {}
		_NormalMap ( "NormalMap", 2D ) = "Bump" {}
		_Color ("Color", Color ) = (1, 1, 1, 0)
	}
	SubShader {
		Tags { "RenderType"="Opaque" }
		LOD 300
		
		CGPROGRAM
		#pragma surface surf Lambert vertex:dispNone tessellate:tessEdge tessphong:_Phong nolightmap
		#include "Tessellation.cginc"
		
		struct appdata {
			float4 vertex : POSITION;
			float4 tangent : TANGENT;
			float3 normal : NORMAL;
			float2 texcoord : TEXCOORD0;
		};
		
		void dispNone (inout appdata v) { }
		
		float _Phong;
		float _EdgeLength;
		
		float4 tessEdge( appdata v0, appdata v1, appdata v2) {
			return UnityEdgeLengthBasedTess ( v0.vertex, v1.vertex, v2.vertex, _EdgeLength );
		}
		
		struct Input {
			float2 uv_MainTex;
			float2 uv_NormalMap;
		};
		
		sampler2D _MainTex;
		sampler2D _NormalMap;
		fixed4 _Color;
		
		void surf ( Input IN, inout SurfaceOutput o ) {
			half4 c = tex2D ( _MainTex, IN.uv_MainTex)*_Color;
			o.Albedo = c.rgb;
			o.Alpha = c.a;
			o.Normal = UnpackNormal ( tex2D ( _NormalMap, IN.uv_NormalMap ) );
		}

		ENDCG
	} 
	FallBack "Diffuse"
}
