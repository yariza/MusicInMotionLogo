Shader "Hidden/LogoEffect"
{
	Properties
	{
		_MainTex ("Texture", 2D) = "white" {}
		_CosA ("CosineA", Color) = (0.5, 0.5, 0.5, 1)
		_CosB ("CosineB", Color) = (0.5, 0.5, 0.5, 1)
		_CosC ("CosineC", Color) = (1.0, 0.7, 0.4, 1)
		_CosD ("CosineD", Color) = (0.0, 0.15, 0.20, 1)
	}
	SubShader
	{
		// No culling or depth
		Cull Off ZWrite Off ZTest Always

		Pass
		{
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			
			#include "UnityCG.cginc"

			struct appdata
			{
				float4 vertex : POSITION;
				float2 uv : TEXCOORD0;
			};

			struct v2f
			{
				float2 uv : TEXCOORD0;
				float4 vertex : SV_POSITION;
			};

			v2f vert (appdata v)
			{
				v2f o;
				o.vertex = UnityObjectToClipPos(v.vertex);
				o.uv = v.uv;
				return o;
			}
			
			sampler2D _MainTex;

			float3 cosineGrad(float t, float3 a, float3 b, float3 c, float3 d)
			{
				return a + b * cos(2.0 * 3.1415926535 * (c * t + d));
			}

			fixed4 frag (v2f i) : SV_Target
			{
				float3 col = float3(0,0,0);

				col += float3(i.uv, 0);
				
				return fixed4(col, 1);
			}
			ENDCG
		}
	}
}
