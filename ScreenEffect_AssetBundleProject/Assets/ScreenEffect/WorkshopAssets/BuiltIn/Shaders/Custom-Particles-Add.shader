Shader "Custom/Particles/Add"
{
	Properties
	{
		_TintColor ("Tint Color", Color) = (0.5,0.5,0.5,0.5)
		_MainTex ("Particle Texture", 2D) = "white" {}
	}
	Category
	{
		Tags { "Queue"="Transparent" "RenderType"="Transparent" "PreviewType"="Plane" }
		Blend One One
		Cull Off Lighting Off ZWrite Off

		SubShader
		{
			Pass
			{
				CGPROGRAM
				#pragma vertex vert
				#pragma fragment frag
				#pragma target 2.0
				#pragma multi_compile_particles

				#include "UnityCG.cginc"

				struct appdata_t
				{
					float4 vertex : POSITION;
					float4 color : COLOR;
					float2 texcoord : TEXCOORD0;
					UNITY_VERTEX_INPUT_INSTANCE_ID
				};

				struct v2f
				{
					float4 vertex : SV_POSITION;
					float4 color : COLOR;
					float2 texcoord : TEXCOORD0;
					UNITY_VERTEX_OUTPUT_STEREO
				};

				struct PixelData
				{
					float4 color;
					float depth;
				};

				float4 _TintColor;
				sampler2D _MainTex;
				float4 _MainTex_ST;
				
				v2f vert (appdata_t v)
				{
					v2f o;
					UNITY_SETUP_INSTANCE_ID(v);
					UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

					o.vertex = UnityObjectToClipPos(v.vertex);
					o.color = v.color * _TintColor;
					o.texcoord = TRANSFORM_TEX(v.texcoord,_MainTex);

					return o;
				}

				float4 frag (v2f IN) : SV_Target
				{
					float4 color = 2.0f * IN.color * tex2D(_MainTex, IN.texcoord);
					color.a = saturate(color.a);

					color.rgb *= color.a;
					color.a = 0;
					return color;
				}
				ENDCG
			}
		}
	}
}