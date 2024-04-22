// Upgrade NOTE: replaced 'defined FOG_COMBINED_WITH_WORLD_POS' with 'defined (FOG_COMBINED_WITH_WORLD_POS)'

Shader "EGA/Particles/FireSphere"
{
	Properties
	{
		_MainTex("Main Tex", 2D) = "white" {}
		_Color("Color", Color) = (1,1,1,1)
		_Emission("Emission", Float) = 2
		_StartFrequency("Start Frequency", Float) = 4
		_Frequency("Frequency", Float) = 10
		_Amplitude("Amplitude", Float) = 1
		[Toggle]_Useblack("Use black", Float) = 0
		_Opacity("Opacity", Float) = 1
		[HideInInspector] _tex3coord("", 2D) = "white" {}
		[HideInInspector] __dirty("", Int) = 1
	}

		SubShader
		{
			Blend One One

			Tags{ "RenderType" = "Transparent"  "Queue" = "Transparent" "IgnoreProjector" = "True" "IsEmissive" = "true"  "PreviewType" = "Plane" }
			Cull Back

			// ------------------------------------------------------------
			// Surface shader code generated out of a CGPROGRAM block:
			ZWrite Off


			// ---- forward rendering base pass:
			Pass {
				Name "FORWARD"
				Tags { "LightMode" = "ForwardBase" }
				Blend SrcAlpha OneMinusSrcAlpha

		CGPROGRAM
			// compile directives
			#pragma vertex vert_surf
			#pragma fragment frag_surf
			#pragma target 3.0
			#pragma multi_compile_instancing
			#pragma multi_compile_fog
			#pragma multi_compile_fwdbasealpha noshadow
			#include "HLSLSupport.cginc"
			#define UNITY_INSTANCED_LOD_FADE
			#define UNITY_INSTANCED_SH
			#define UNITY_INSTANCED_LIGHTMAPSTS
			#include "UnityShaderVariables.cginc"
			#include "UnityShaderUtilities.cginc"
			// -------- variant for: <when no other keywords are defined>
			#if !defined(INSTANCING_ON)
			// Surface shader code generated based on:
			// writes to per-pixel normal: no
			// writes to emission: no
			// writes to occlusion: no
			// needs world space reflection vector: no
			// needs world space normal vector: no
			// needs screen space position: no
			// needs world space position: no
			// needs view direction: no
			// needs world space view direction: no
			// needs world space position for lighting: no
			// needs world space view direction for lighting: no
			// needs world space view direction for lightmaps: no
			// needs vertex color: YES
			// needs VFACE: no
			// needs SV_IsFrontFace: no
			// passes tangent-to-world matrix to pixel shader: no
			// reads from normal: no
			// 1 texcoords actually used
			//   float3 _tex3coord
			#include "UnityCG.cginc"
			#include "Lighting.cginc"
			#include "AutoLight.cginc"

			#define INTERNAL_DATA
			#define WorldReflectionVector(data,normal) data.worldRefl
			#define WorldNormalVector(data,normal) normal

			// Original surface shader snippet:
			#line 22 ""
			#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
			#endif
			/* UNITY: Original start of shader */
					#include "UnityShaderVariables.cginc"
					#include "UnityCG.cginc"
					//#pragma target 3.0
					//#pragma surface surf Unlit alpha noshadow 
					#undef TRANSFORM_TEX
					#define TRANSFORM_TEX(tex,name) float4(tex.xy * name##_ST.xy + name##_ST.zw, tex.z, tex.w)

					struct Input
					{
						float4 vertexColor : COLOR;
						float3 uv_tex3coord;
						float4 screenPos;
					};

					uniform float _Useblack;
					uniform float _Emission;
					uniform float4 _Color;
					uniform sampler2D _MainTex;
					uniform float _StartFrequency;
					uniform float _Amplitude;
					uniform float _Frequency;
					uniform float _Opacity;
					uniform float4 _CameraDepthTexture_TexelSize;

					inline half4 LightingUnlit(SurfaceOutput s, half3 lightDir, half atten)
					{
						return half4(s.Albedo * s.Alpha, s.Alpha);
					}

					void surf(Input i , inout SurfaceOutput o)
					{
						float4 temp_output_121_0 = (_Emission * _Color * i.vertexColor);
						float2 temp_output_8_0 = (((float2(0.2,0) * _Time.y) + (i.uv_tex3coord).xy + i.uv_tex3coord.z) * _StartFrequency);
						float2 break18 = floor(temp_output_8_0);
						float temp_output_21_0 = (break18.x + (break18.y * 57.0));
						float2 temp_output_10_0 = frac(temp_output_8_0);
						float2 temp_cast_1 = 3;
						float2 break17 = (temp_output_10_0 * temp_output_10_0 * (temp_cast_1 - (temp_output_10_0 * 2.0)));
						float lerpResult39 = lerp(frac((473.5 * sin(temp_output_21_0))) , frac((473.5 * sin((1.0 + temp_output_21_0)))) , break17.x);
						float lerpResult38 = lerp(frac((473.5 * sin((57.0 + temp_output_21_0)))) , frac((473.5 * sin((58.0 + temp_output_21_0)))) , break17.x);
						float lerpResult40 = lerp(lerpResult39 , lerpResult38 , break17.y);
						float3 temp_output_51_0 = ((float3((float2(0.5,0.5) * _Time.y) ,  0.0) + (i.uv_tex3coord * (lerpResult40 * _Amplitude)) + i.uv_tex3coord.z) * _Frequency);
						float3 break87 = floor(temp_output_51_0);
						float temp_output_90_0 = (break87.x + (break87.y * 57.0));
						float3 temp_output_52_0 = frac(temp_output_51_0);
						float3 temp_cast_3 = 3;
						float3 break110 = (temp_output_52_0 * temp_output_52_0 * (temp_cast_3 - (temp_output_52_0 * 2.0)));
						float lerpResult109 = lerp(frac((473.5 * sin(temp_output_90_0))) , frac((473.5 * sin((1.0 + temp_output_90_0)))) , break110.x);
						float lerpResult105 = lerp(frac((473.5 * sin((57.0 + temp_output_90_0)))) , frac((473.5 * sin((58.0 + temp_output_90_0)))) , break110.x);
						float lerpResult106 = lerp(lerpResult109 , lerpResult105 , break110.y);
						float4 tex2DNode117 = tex2D(_MainTex, (i.uv_tex3coord + (0.2 * (lerpResult106 * _Amplitude))).xy);
						o.Albedo = lerp(temp_output_121_0,(temp_output_121_0 * tex2DNode117),_Useblack).rgb;

						float clampResult132 = saturate(i.vertexColor.a * tex2DNode117.r * _Opacity);
						o.Alpha = clampResult132;
					}



					// vertex-to-fragment interpolation data
					// no lightmaps:
					#ifndef LIGHTMAP_ON
					// half-precision fragment shader registers:
					#ifdef UNITY_HALF_PRECISION_FRAGMENT_SHADER_REGISTERS
					#define FOG_COMBINED_WITH_WORLD_POS
					struct v2f_surf {
					  UNITY_POSITION(pos);
					  float3 pack0 : TEXCOORD0; // _tex3coord
					  float3 worldNormal : TEXCOORD1;
					  float4 worldPos : TEXCOORD2;
					  fixed4 color : COLOR0;
					  fixed3 vlight : TEXCOORD3; // ambient/SH/vertexlights
					  DECLARE_LIGHT_COORDS(4)
					  #if SHADER_TARGET >= 30
					  float4 lmap : TEXCOORD5;
					  #endif
					  UNITY_VERTEX_INPUT_INSTANCE_ID
					  UNITY_VERTEX_OUTPUT_STEREO
					};
					#endif
					// high-precision fragment shader registers:
					#ifndef UNITY_HALF_PRECISION_FRAGMENT_SHADER_REGISTERS
					struct v2f_surf {
					  UNITY_POSITION(pos);
					  float3 pack0 : TEXCOORD0; // _tex3coord
					  float3 worldNormal : TEXCOORD1;
					  float3 worldPos : TEXCOORD2;
					  fixed4 color : COLOR0;
					  fixed3 vlight : TEXCOORD3; // ambient/SH/vertexlights
					  UNITY_FOG_COORDS(4)
					  DECLARE_LIGHT_COORDS(5)
					  #if SHADER_TARGET >= 30
					  float4 lmap : TEXCOORD6;
					  #endif
					  UNITY_VERTEX_INPUT_INSTANCE_ID
					  UNITY_VERTEX_OUTPUT_STEREO
					};
					#endif
					#endif
					// with lightmaps:
					#ifdef LIGHTMAP_ON
					// half-precision fragment shader registers:
					#ifdef UNITY_HALF_PRECISION_FRAGMENT_SHADER_REGISTERS
					#define FOG_COMBINED_WITH_WORLD_POS
					struct v2f_surf {
					  UNITY_POSITION(pos);
					  float3 pack0 : TEXCOORD0; // _tex3coord
					  float3 worldNormal : TEXCOORD1;
					  float4 worldPos : TEXCOORD2;
					  fixed4 color : COLOR0;
					  float4 lmap : TEXCOORD3;
					  DECLARE_LIGHT_COORDS(4)
					  UNITY_VERTEX_INPUT_INSTANCE_ID
					  UNITY_VERTEX_OUTPUT_STEREO
					};
					#endif
					// high-precision fragment shader registers:
					#ifndef UNITY_HALF_PRECISION_FRAGMENT_SHADER_REGISTERS
					struct v2f_surf {
					  UNITY_POSITION(pos);
					  float3 pack0 : TEXCOORD0; // _tex3coord
					  float3 worldNormal : TEXCOORD1;
					  float3 worldPos : TEXCOORD2;
					  fixed4 color : COLOR0;
					  float4 lmap : TEXCOORD3;
					  UNITY_FOG_COORDS(4)
					  DECLARE_LIGHT_COORDS(5)
					  #ifdef DIRLIGHTMAP_COMBINED
					  float3 tSpace0 : TEXCOORD6;
					  float3 tSpace1 : TEXCOORD7;
					  float3 tSpace2 : TEXCOORD8;
					  #endif
					  UNITY_VERTEX_INPUT_INSTANCE_ID
					  UNITY_VERTEX_OUTPUT_STEREO
					};
					#endif
					#endif
					float4 _tex3coord_ST;

					// vertex shader
					v2f_surf vert_surf(appdata_full v) {
					  UNITY_SETUP_INSTANCE_ID(v);
					  v2f_surf o;
					  UNITY_INITIALIZE_OUTPUT(v2f_surf,o);
					  UNITY_TRANSFER_INSTANCE_ID(v,o);
					  UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
					  o.pos = UnityObjectToClipPos(v.vertex);
					  o.pack0.xyz = TRANSFORM_TEX(v.texcoord, _tex3coord);
					  float3 worldPos = mul(unity_ObjectToWorld, v.vertex).xyz;
					  float3 worldNormal = UnityObjectToWorldNormal(v.normal);
					  #if defined(LIGHTMAP_ON) && defined(DIRLIGHTMAP_COMBINED)
					  fixed3 worldTangent = UnityObjectToWorldDir(v.tangent.xyz);
					  fixed tangentSign = v.tangent.w * unity_WorldTransformParams.w;
					  fixed3 worldBinormal = cross(worldNormal, worldTangent) * tangentSign;
					  #endif
					  #if defined(LIGHTMAP_ON) && defined(DIRLIGHTMAP_COMBINED) && !defined(UNITY_HALF_PRECISION_FRAGMENT_SHADER_REGISTERS)
					  o.tSpace0 = float4(worldTangent.x, worldBinormal.x, worldNormal.x, worldPos.x);
					  o.tSpace1 = float4(worldTangent.y, worldBinormal.y, worldNormal.y, worldPos.y);
					  o.tSpace2 = float4(worldTangent.z, worldBinormal.z, worldNormal.z, worldPos.z);
					  #endif
					  o.worldPos.xyz = worldPos;
					  o.worldNormal = worldNormal;
					  o.color = v.color;
					  #ifdef DYNAMICLIGHTMAP_ON
					  o.lmap.zw = v.texcoord2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
					  #endif
					  #ifdef LIGHTMAP_ON
					  o.lmap.xy = v.texcoord1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
					  #endif

					  // SH/ambient and vertex lights
					  #ifndef LIGHTMAP_ON
					  #if UNITY_SHOULD_SAMPLE_SH && !UNITY_SAMPLE_FULL_SH_PER_PIXEL
					  float3 shlight = ShadeSH9(float4(worldNormal,1.0));
					  o.vlight = shlight;
					  #else
					  o.vlight = 0.0;
					  #endif
					  #ifdef VERTEXLIGHT_ON
					  o.vlight += Shade4PointLights(
						unity_4LightPosX0, unity_4LightPosY0, unity_4LightPosZ0,
						unity_LightColor[0].rgb, unity_LightColor[1].rgb, unity_LightColor[2].rgb, unity_LightColor[3].rgb,
						unity_4LightAtten0, worldPos, worldNormal);
					  #endif // VERTEXLIGHT_ON
					  #endif // !LIGHTMAP_ON

					  COMPUTE_LIGHT_COORDS(o); // pass light cookie coordinates to pixel shader
					  #ifdef FOG_COMBINED_WITH_TSPACE
						UNITY_TRANSFER_FOG_COMBINED_WITH_TSPACE(o,o.pos); // pass fog coordinates to pixel shader
					  #elif defined (FOG_COMBINED_WITH_WORLD_POS)
						UNITY_TRANSFER_FOG_COMBINED_WITH_WORLD_POS(o,o.pos); // pass fog coordinates to pixel shader
					  #else
						UNITY_TRANSFER_FOG(o,o.pos); // pass fog coordinates to pixel shader
					  #endif
					  return o;
					}

					// fragment shader
					fixed4 frag_surf(v2f_surf IN) : SV_Target {
					  UNITY_SETUP_INSTANCE_ID(IN);
					// prepare and unpack data
					Input surfIN;
					#ifdef FOG_COMBINED_WITH_TSPACE
					  UNITY_EXTRACT_FOG_FROM_TSPACE(IN);
					#elif defined (FOG_COMBINED_WITH_WORLD_POS)
					  UNITY_EXTRACT_FOG_FROM_WORLD_POS(IN);
					#else
					  UNITY_EXTRACT_FOG(IN);
					#endif
					UNITY_INITIALIZE_OUTPUT(Input,surfIN);
					surfIN.vertexColor.x = 1.0;
					surfIN.uv_tex3coord.x = 1.0;
					surfIN.screenPos.x = 1.0;
					surfIN.uv_tex3coord = IN.pack0.xyz;
					float3 worldPos = IN.worldPos.xyz;
					#ifndef USING_DIRECTIONAL_LIGHT
					  fixed3 lightDir = normalize(UnityWorldSpaceLightDir(worldPos));
					#else
					  fixed3 lightDir = _WorldSpaceLightPos0.xyz;
					#endif
					surfIN.vertexColor = IN.color;
					#ifdef UNITY_COMPILER_HLSL
					SurfaceOutput o = (SurfaceOutput)0;
					#else
					SurfaceOutput o;
					#endif
					o.Albedo = 0.0;
					o.Emission = 0.0;
					o.Specular = 0.0;
					o.Alpha = 0.0;
					o.Gloss = 0.0;
					fixed3 normalWorldVertex = fixed3(0,0,1);
					o.Normal = IN.worldNormal;
					normalWorldVertex = IN.worldNormal;

					// call surface function
					surf(surfIN, o);

					// compute lighting & shadowing factor
					UNITY_LIGHT_ATTENUATION(atten, IN, worldPos)
					fixed4 c = 0;
					#ifndef LIGHTMAP_ON
					c.rgb += o.Albedo * IN.vlight;
					#endif // !LIGHTMAP_ON

					// lightmaps
					#ifdef LIGHTMAP_ON
					  #if DIRLIGHTMAP_COMBINED
						// directional lightmaps
						fixed4 lmtex = UNITY_SAMPLE_TEX2D(unity_Lightmap, IN.lmap.xy);
						half3 lm = DecodeLightmap(lmtex);
					  #else
						// single lightmap
						fixed4 lmtex = UNITY_SAMPLE_TEX2D(unity_Lightmap, IN.lmap.xy);
						fixed3 lm = DecodeLightmap(lmtex);
					  #endif

					#endif // LIGHTMAP_ON


						// realtime lighting: call lighting function
						#ifndef LIGHTMAP_ON
						c += LightingUnlit(o, lightDir, atten);
						#else
						  c.a = o.Alpha;
						#endif

						#ifdef LIGHTMAP_ON
						  // combine lightmaps with realtime shadows
						  #ifdef SHADOWS_SCREEN
							#if defined(UNITY_LIGHTMAP_DLDR_ENCODING)
							c.rgb += o.Albedo * min(lm, atten * 2);
							#else
							c.rgb += o.Albedo * max(min(lm,(atten * 2)*lmtex.rgb), lm*atten);
							#endif
						  #else // SHADOWS_SCREEN
							c.rgb += o.Albedo * lm;
						  #endif // SHADOWS_SCREEN
						#endif // LIGHTMAP_ON

						#ifdef DYNAMICLIGHTMAP_ON
						fixed4 dynlmtex = UNITY_SAMPLE_TEX2D(unity_DynamicLightmap, IN.lmap.zw);
						c.rgb += o.Albedo * DecodeRealtimeLightmap(dynlmtex);
						#endif

						UNITY_APPLY_FOG(_unity_fogCoord, c); // apply fog
						return c;
					  }


					  #endif

						// -------- variant for: INSTANCING_ON 
						#if defined(INSTANCING_ON)
						// Surface shader code generated based on:
						// writes to per-pixel normal: no
						// writes to emission: no
						// writes to occlusion: no
						// needs world space reflection vector: no
						// needs world space normal vector: no
						// needs screen space position: no
						// needs world space position: no
						// needs view direction: no
						// needs world space view direction: no
						// needs world space position for lighting: no
						// needs world space view direction for lighting: no
						// needs world space view direction for lightmaps: no
						// needs vertex color: YES
						// needs VFACE: no
						// needs SV_IsFrontFace: no
						// passes tangent-to-world matrix to pixel shader: no
						// reads from normal: no
						// 1 texcoords actually used
						//   float3 _tex3coord
						#include "UnityCG.cginc"
						#include "Lighting.cginc"
						#include "AutoLight.cginc"

						#define INTERNAL_DATA
						#define WorldReflectionVector(data,normal) data.worldRefl
						#define WorldNormalVector(data,normal) normal

						// Original surface shader snippet:
						#line 22 ""
						#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
						#endif
						/* UNITY: Original start of shader */
								#include "UnityShaderVariables.cginc"
								#include "UnityCG.cginc"
								//#pragma target 3.0
								//#pragma surface surf Unlit alpha noshadow 
								#undef TRANSFORM_TEX
								#define TRANSFORM_TEX(tex,name) float4(tex.xy * name##_ST.xy + name##_ST.zw, tex.z, tex.w)

								struct Input
								{
									float4 vertexColor : COLOR;
									float3 uv_tex3coord;
									float4 screenPos;
								};

								uniform float _Useblack;
								uniform float _Emission;
								uniform float4 _Color;
								uniform sampler2D _MainTex;
								uniform float _StartFrequency;
								uniform float _Amplitude;
								uniform float _Frequency;
								uniform float _Opacity;
								uniform float4 _CameraDepthTexture_TexelSize;

								inline half4 LightingUnlit(SurfaceOutput s, half3 lightDir, half atten)
								{
									return half4(s.Albedo * s.Alpha, s.Alpha);
								}

								void surf(Input i , inout SurfaceOutput o)
								{
									float4 temp_output_121_0 = (_Emission * _Color * i.vertexColor);
									float2 temp_output_8_0 = (((float2(0.2,0) * _Time.y) + (i.uv_tex3coord).xy + i.uv_tex3coord.z) * _StartFrequency);
									float2 break18 = floor(temp_output_8_0);
									float temp_output_21_0 = (break18.x + (break18.y * 57.0));
									float2 temp_output_10_0 = frac(temp_output_8_0);
									float2 temp_cast_1 = 3;
									float2 break17 = (temp_output_10_0 * temp_output_10_0 * (temp_cast_1 - (temp_output_10_0 * 2.0)));
									float lerpResult39 = lerp(frac((473.5 * sin(temp_output_21_0))) , frac((473.5 * sin((1.0 + temp_output_21_0)))) , break17.x);
									float lerpResult38 = lerp(frac((473.5 * sin((57.0 + temp_output_21_0)))) , frac((473.5 * sin((58.0 + temp_output_21_0)))) , break17.x);
									float lerpResult40 = lerp(lerpResult39 , lerpResult38 , break17.y);
									float3 temp_output_51_0 = ((float3((float2(0.5,0.5) * _Time.y) ,  0.0) + (i.uv_tex3coord * (lerpResult40 * _Amplitude)) + i.uv_tex3coord.z) * _Frequency);
									float3 break87 = floor(temp_output_51_0);
									float temp_output_90_0 = (break87.x + (break87.y * 57.0));
									float3 temp_output_52_0 = frac(temp_output_51_0);
									float3 temp_cast_3 = 3;
									float3 break110 = (temp_output_52_0 * temp_output_52_0 * (temp_cast_3 - (temp_output_52_0 * 2.0)));
									float lerpResult109 = lerp(frac((473.5 * sin(temp_output_90_0))) , frac((473.5 * sin((1.0 + temp_output_90_0)))) , break110.x);
									float lerpResult105 = lerp(frac((473.5 * sin((57.0 + temp_output_90_0)))) , frac((473.5 * sin((58.0 + temp_output_90_0)))) , break110.x);
									float lerpResult106 = lerp(lerpResult109 , lerpResult105 , break110.y);
									float4 tex2DNode117 = tex2D(_MainTex, (i.uv_tex3coord + (0.2 * (lerpResult106 * _Amplitude))).xy);
									o.Albedo = lerp(temp_output_121_0,(temp_output_121_0 * tex2DNode117),_Useblack).rgb;

									float clampResult132 = saturate(i.vertexColor.a * tex2DNode117.r * _Opacity);
									o.Alpha = clampResult132;
								}



								// vertex-to-fragment interpolation data
								// no lightmaps:
								#ifndef LIGHTMAP_ON
								// half-precision fragment shader registers:
								#ifdef UNITY_HALF_PRECISION_FRAGMENT_SHADER_REGISTERS
								#define FOG_COMBINED_WITH_WORLD_POS
								struct v2f_surf {
								  UNITY_POSITION(pos);
								  float3 pack0 : TEXCOORD0; // _tex3coord
								  float3 worldNormal : TEXCOORD1;
								  float4 worldPos : TEXCOORD2;
								  fixed4 color : COLOR0;
								  fixed3 vlight : TEXCOORD3; // ambient/SH/vertexlights
								  DECLARE_LIGHT_COORDS(4)
								  #if SHADER_TARGET >= 30
								  float4 lmap : TEXCOORD5;
								  #endif
								  UNITY_VERTEX_INPUT_INSTANCE_ID
								  UNITY_VERTEX_OUTPUT_STEREO
								};
								#endif
								// high-precision fragment shader registers:
								#ifndef UNITY_HALF_PRECISION_FRAGMENT_SHADER_REGISTERS
								struct v2f_surf {
								  UNITY_POSITION(pos);
								  float3 pack0 : TEXCOORD0; // _tex3coord
								  float3 worldNormal : TEXCOORD1;
								  float3 worldPos : TEXCOORD2;
								  fixed4 color : COLOR0;
								  fixed3 vlight : TEXCOORD3; // ambient/SH/vertexlights
								  UNITY_FOG_COORDS(4)
								  DECLARE_LIGHT_COORDS(5)
								  #if SHADER_TARGET >= 30
								  float4 lmap : TEXCOORD6;
								  #endif
								  UNITY_VERTEX_INPUT_INSTANCE_ID
								  UNITY_VERTEX_OUTPUT_STEREO
								};
								#endif
								#endif
								// with lightmaps:
								#ifdef LIGHTMAP_ON
								// half-precision fragment shader registers:
								#ifdef UNITY_HALF_PRECISION_FRAGMENT_SHADER_REGISTERS
								#define FOG_COMBINED_WITH_WORLD_POS
								struct v2f_surf {
								  UNITY_POSITION(pos);
								  float3 pack0 : TEXCOORD0; // _tex3coord
								  float3 worldNormal : TEXCOORD1;
								  float4 worldPos : TEXCOORD2;
								  fixed4 color : COLOR0;
								  float4 lmap : TEXCOORD3;
								  DECLARE_LIGHT_COORDS(4)
								  UNITY_VERTEX_INPUT_INSTANCE_ID
								  UNITY_VERTEX_OUTPUT_STEREO
								};
								#endif
								// high-precision fragment shader registers:
								#ifndef UNITY_HALF_PRECISION_FRAGMENT_SHADER_REGISTERS
								struct v2f_surf {
								  UNITY_POSITION(pos);
								  float3 pack0 : TEXCOORD0; // _tex3coord
								  float3 worldNormal : TEXCOORD1;
								  float3 worldPos : TEXCOORD2;
								  fixed4 color : COLOR0;
								  float4 lmap : TEXCOORD3;
								  UNITY_FOG_COORDS(4)
								  DECLARE_LIGHT_COORDS(5)
								  #ifdef DIRLIGHTMAP_COMBINED
								  float3 tSpace0 : TEXCOORD6;
								  float3 tSpace1 : TEXCOORD7;
								  float3 tSpace2 : TEXCOORD8;
								  #endif
								  UNITY_VERTEX_INPUT_INSTANCE_ID
								  UNITY_VERTEX_OUTPUT_STEREO
								};
								#endif
								#endif
								float4 _tex3coord_ST;

								// vertex shader
								v2f_surf vert_surf(appdata_full v) {
								  UNITY_SETUP_INSTANCE_ID(v);
								  v2f_surf o;
								  UNITY_INITIALIZE_OUTPUT(v2f_surf,o);
								  UNITY_TRANSFER_INSTANCE_ID(v,o);
								  UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
								  o.pos = UnityObjectToClipPos(v.vertex);
								  o.pack0.xyz = TRANSFORM_TEX(v.texcoord, _tex3coord);
								  float3 worldPos = mul(unity_ObjectToWorld, v.vertex).xyz;
								  float3 worldNormal = UnityObjectToWorldNormal(v.normal);
								  #if defined(LIGHTMAP_ON) && defined(DIRLIGHTMAP_COMBINED)
								  fixed3 worldTangent = UnityObjectToWorldDir(v.tangent.xyz);
								  fixed tangentSign = v.tangent.w * unity_WorldTransformParams.w;
								  fixed3 worldBinormal = cross(worldNormal, worldTangent) * tangentSign;
								  #endif
								  #if defined(LIGHTMAP_ON) && defined(DIRLIGHTMAP_COMBINED) && !defined(UNITY_HALF_PRECISION_FRAGMENT_SHADER_REGISTERS)
								  o.tSpace0 = float4(worldTangent.x, worldBinormal.x, worldNormal.x, worldPos.x);
								  o.tSpace1 = float4(worldTangent.y, worldBinormal.y, worldNormal.y, worldPos.y);
								  o.tSpace2 = float4(worldTangent.z, worldBinormal.z, worldNormal.z, worldPos.z);
								  #endif
								  o.worldPos.xyz = worldPos;
								  o.worldNormal = worldNormal;
								  o.color = v.color;
								  #ifdef DYNAMICLIGHTMAP_ON
								  o.lmap.zw = v.texcoord2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
								  #endif
								  #ifdef LIGHTMAP_ON
								  o.lmap.xy = v.texcoord1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
								  #endif

								  // SH/ambient and vertex lights
								  #ifndef LIGHTMAP_ON
								  #if UNITY_SHOULD_SAMPLE_SH && !UNITY_SAMPLE_FULL_SH_PER_PIXEL
								  float3 shlight = ShadeSH9(float4(worldNormal,1.0));
								  o.vlight = shlight;
								  #else
								  o.vlight = 0.0;
								  #endif
								  #ifdef VERTEXLIGHT_ON
								  o.vlight += Shade4PointLights(
									unity_4LightPosX0, unity_4LightPosY0, unity_4LightPosZ0,
									unity_LightColor[0].rgb, unity_LightColor[1].rgb, unity_LightColor[2].rgb, unity_LightColor[3].rgb,
									unity_4LightAtten0, worldPos, worldNormal);
								  #endif // VERTEXLIGHT_ON
								  #endif // !LIGHTMAP_ON

								  COMPUTE_LIGHT_COORDS(o); // pass light cookie coordinates to pixel shader
								  #ifdef FOG_COMBINED_WITH_TSPACE
									UNITY_TRANSFER_FOG_COMBINED_WITH_TSPACE(o,o.pos); // pass fog coordinates to pixel shader
								  #elif defined (FOG_COMBINED_WITH_WORLD_POS)
									UNITY_TRANSFER_FOG_COMBINED_WITH_WORLD_POS(o,o.pos); // pass fog coordinates to pixel shader
								  #else
									UNITY_TRANSFER_FOG(o,o.pos); // pass fog coordinates to pixel shader
								  #endif
								  return o;
								}

								// fragment shader
								fixed4 frag_surf(v2f_surf IN) : SV_Target {
								  UNITY_SETUP_INSTANCE_ID(IN);
								// prepare and unpack data
								Input surfIN;
								#ifdef FOG_COMBINED_WITH_TSPACE
								  UNITY_EXTRACT_FOG_FROM_TSPACE(IN);
								#elif defined (FOG_COMBINED_WITH_WORLD_POS)
								  UNITY_EXTRACT_FOG_FROM_WORLD_POS(IN);
								#else
								  UNITY_EXTRACT_FOG(IN);
								#endif
								UNITY_INITIALIZE_OUTPUT(Input,surfIN);
								surfIN.vertexColor.x = 1.0;
								surfIN.uv_tex3coord.x = 1.0;
								surfIN.screenPos.x = 1.0;
								surfIN.uv_tex3coord = IN.pack0.xyz;
								float3 worldPos = IN.worldPos.xyz;
								#ifndef USING_DIRECTIONAL_LIGHT
								  fixed3 lightDir = normalize(UnityWorldSpaceLightDir(worldPos));
								#else
								  fixed3 lightDir = _WorldSpaceLightPos0.xyz;
								#endif
								surfIN.vertexColor = IN.color;
								#ifdef UNITY_COMPILER_HLSL
								SurfaceOutput o = (SurfaceOutput)0;
								#else
								SurfaceOutput o;
								#endif
								o.Albedo = 0.0;
								o.Emission = 0.0;
								o.Specular = 0.0;
								o.Alpha = 0.0;
								o.Gloss = 0.0;
								fixed3 normalWorldVertex = fixed3(0,0,1);
								o.Normal = IN.worldNormal;
								normalWorldVertex = IN.worldNormal;

								// call surface function
								surf(surfIN, o);

								// compute lighting & shadowing factor
								UNITY_LIGHT_ATTENUATION(atten, IN, worldPos)
								fixed4 c = 0;
								#ifndef LIGHTMAP_ON
								c.rgb += o.Albedo * IN.vlight;
								#endif // !LIGHTMAP_ON

								// lightmaps
								#ifdef LIGHTMAP_ON
								  #if DIRLIGHTMAP_COMBINED
									// directional lightmaps
									fixed4 lmtex = UNITY_SAMPLE_TEX2D(unity_Lightmap, IN.lmap.xy);
									half3 lm = DecodeLightmap(lmtex);
								  #else
									// single lightmap
									fixed4 lmtex = UNITY_SAMPLE_TEX2D(unity_Lightmap, IN.lmap.xy);
									fixed3 lm = DecodeLightmap(lmtex);
								  #endif

								#endif // LIGHTMAP_ON


									// realtime lighting: call lighting function
									#ifndef LIGHTMAP_ON
									c += LightingUnlit(o, lightDir, atten);
									#else
									  c.a = o.Alpha;
									#endif

									#ifdef LIGHTMAP_ON
									  // combine lightmaps with realtime shadows
									  #ifdef SHADOWS_SCREEN
										#if defined(UNITY_LIGHTMAP_DLDR_ENCODING)
										c.rgb += o.Albedo * min(lm, atten * 2);
										#else
										c.rgb += o.Albedo * max(min(lm,(atten * 2)*lmtex.rgb), lm*atten);
										#endif
									  #else // SHADOWS_SCREEN
										c.rgb += o.Albedo * lm;
									  #endif // SHADOWS_SCREEN
									#endif // LIGHTMAP_ON

									#ifdef DYNAMICLIGHTMAP_ON
									fixed4 dynlmtex = UNITY_SAMPLE_TEX2D(unity_DynamicLightmap, IN.lmap.zw);
									c.rgb += o.Albedo * DecodeRealtimeLightmap(dynlmtex);
									#endif

									UNITY_APPLY_FOG(_unity_fogCoord, c); // apply fog
									return c;
								  }


								  #endif


								  ENDCG

								  }

			// ---- forward rendering additive lights pass:
			Pass {
				Name "FORWARD"
				Tags { "LightMode" = "ForwardAdd" }
				ZWrite Off Blend One One
				Blend SrcAlpha One

		CGPROGRAM
									  // compile directives
									  #pragma vertex vert_surf
									  #pragma fragment frag_surf
									  #pragma target 3.0
									  #pragma multi_compile_instancing
									  #pragma multi_compile_fog
									  #pragma skip_variants INSTANCING_ON
									  #pragma multi_compile_fwdadd noshadow
									  #include "HLSLSupport.cginc"
									  #define UNITY_INSTANCED_LOD_FADE
									  #define UNITY_INSTANCED_SH
									  #define UNITY_INSTANCED_LIGHTMAPSTS
									  #include "UnityShaderVariables.cginc"
									  #include "UnityShaderUtilities.cginc"
									  // -------- variant for: <when no other keywords are defined>
									  #if !defined(INSTANCING_ON)
									  // Surface shader code generated based on:
									  // writes to per-pixel normal: no
									  // writes to emission: no
									  // writes to occlusion: no
									  // needs world space reflection vector: no
									  // needs world space normal vector: no
									  // needs screen space position: no
									  // needs world space position: no
									  // needs view direction: no
									  // needs world space view direction: no
									  // needs world space position for lighting: no
									  // needs world space view direction for lighting: no
									  // needs world space view direction for lightmaps: no
									  // needs vertex color: YES
									  // needs VFACE: no
									  // needs SV_IsFrontFace: no
									  // passes tangent-to-world matrix to pixel shader: no
									  // reads from normal: no
									  // 1 texcoords actually used
									  //   float3 _tex3coord
									  #include "UnityCG.cginc"
									  #include "Lighting.cginc"
									  #include "AutoLight.cginc"

									  #define INTERNAL_DATA
									  #define WorldReflectionVector(data,normal) data.worldRefl
									  #define WorldNormalVector(data,normal) normal

									  // Original surface shader snippet:
									  #line 22 ""
									  #ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
									  #endif
									  /* UNITY: Original start of shader */
											  #include "UnityShaderVariables.cginc"
											  #include "UnityCG.cginc"
											  //#pragma target 3.0
											  //#pragma surface surf Unlit alpha noshadow 
											  #undef TRANSFORM_TEX
											  #define TRANSFORM_TEX(tex,name) float4(tex.xy * name##_ST.xy + name##_ST.zw, tex.z, tex.w)

											  struct Input
											  {
												  float4 vertexColor : COLOR;
												  float3 uv_tex3coord;
												  float4 screenPos;
											  };

											  uniform float _Useblack;
											  uniform float _Emission;
											  uniform float4 _Color;
											  uniform sampler2D _MainTex;
											  uniform float _StartFrequency;
											  uniform float _Amplitude;
											  uniform float _Frequency;
											  uniform float _Opacity;
											  uniform float4 _CameraDepthTexture_TexelSize;

											  inline half4 LightingUnlit(SurfaceOutput s, half3 lightDir, half atten)
											  {
												  return half4(s.Albedo * s.Alpha, s.Alpha);
											  }

											  void surf(Input i , inout SurfaceOutput o)
											  {
												  float4 temp_output_121_0 = (_Emission * _Color * i.vertexColor);
												  float2 temp_output_8_0 = (((float2(0.2,0) * _Time.y) + (i.uv_tex3coord).xy + i.uv_tex3coord.z) * _StartFrequency);
												  float2 break18 = floor(temp_output_8_0);
												  float temp_output_21_0 = (break18.x + (break18.y * 57.0));
												  float2 temp_output_10_0 = frac(temp_output_8_0);
												  float2 temp_cast_1 = 3;
												  float2 break17 = (temp_output_10_0 * temp_output_10_0 * (temp_cast_1 - (temp_output_10_0 * 2.0)));
												  float lerpResult39 = lerp(frac((473.5 * sin(temp_output_21_0))) , frac((473.5 * sin((1.0 + temp_output_21_0)))) , break17.x);
												  float lerpResult38 = lerp(frac((473.5 * sin((57.0 + temp_output_21_0)))) , frac((473.5 * sin((58.0 + temp_output_21_0)))) , break17.x);
												  float lerpResult40 = lerp(lerpResult39 , lerpResult38 , break17.y);
												  float3 temp_output_51_0 = ((float3((float2(0.5,0.5) * _Time.y) ,  0.0) + (i.uv_tex3coord * (lerpResult40 * _Amplitude)) + i.uv_tex3coord.z) * _Frequency);
												  float3 break87 = floor(temp_output_51_0);
												  float temp_output_90_0 = (break87.x + (break87.y * 57.0));
												  float3 temp_output_52_0 = frac(temp_output_51_0);
												  float3 temp_cast_3 = 3;
												  float3 break110 = (temp_output_52_0 * temp_output_52_0 * (temp_cast_3 - (temp_output_52_0 * 2.0)));
												  float lerpResult109 = lerp(frac((473.5 * sin(temp_output_90_0))) , frac((473.5 * sin((1.0 + temp_output_90_0)))) , break110.x);
												  float lerpResult105 = lerp(frac((473.5 * sin((57.0 + temp_output_90_0)))) , frac((473.5 * sin((58.0 + temp_output_90_0)))) , break110.x);
												  float lerpResult106 = lerp(lerpResult109 , lerpResult105 , break110.y);
												  float4 tex2DNode117 = tex2D(_MainTex, (i.uv_tex3coord + (0.2 * (lerpResult106 * _Amplitude))).xy);
												  o.Albedo = lerp(temp_output_121_0,(temp_output_121_0 * tex2DNode117),_Useblack).rgb;

												  float clampResult132 = saturate(i.vertexColor.a * tex2DNode117.r * _Opacity);
												  o.Alpha = clampResult132;
											  }



											  // vertex-to-fragment interpolation data
											  struct v2f_surf {
												UNITY_POSITION(pos);
												float3 pack0 : TEXCOORD0; // _tex3coord
												float3 worldNormal : TEXCOORD1;
												float3 worldPos : TEXCOORD2;
												fixed4 color : COLOR0;
												DECLARE_LIGHT_COORDS(3)
												UNITY_FOG_COORDS(4)
												UNITY_VERTEX_INPUT_INSTANCE_ID
												UNITY_VERTEX_OUTPUT_STEREO
											  };
											  float4 _tex3coord_ST;

											  // vertex shader
											  v2f_surf vert_surf(appdata_full v) {
												UNITY_SETUP_INSTANCE_ID(v);
												v2f_surf o;
												UNITY_INITIALIZE_OUTPUT(v2f_surf,o);
												UNITY_TRANSFER_INSTANCE_ID(v,o);
												UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
												o.pos = UnityObjectToClipPos(v.vertex);
												o.pack0.xyz = TRANSFORM_TEX(v.texcoord, _tex3coord);
												float3 worldPos = mul(unity_ObjectToWorld, v.vertex).xyz;
												float3 worldNormal = UnityObjectToWorldNormal(v.normal);
												o.worldPos.xyz = worldPos;
												o.worldNormal = worldNormal;
												o.color = v.color;

												COMPUTE_LIGHT_COORDS(o); // pass light cookie coordinates to pixel shader
												UNITY_TRANSFER_FOG(o,o.pos); // pass fog coordinates to pixel shader
												return o;
											  }

											  // fragment shader
											  fixed4 frag_surf(v2f_surf IN) : SV_Target {
												UNITY_SETUP_INSTANCE_ID(IN);
											  // prepare and unpack data
											  Input surfIN;
											  #ifdef FOG_COMBINED_WITH_TSPACE
												UNITY_EXTRACT_FOG_FROM_TSPACE(IN);
											  #elif defined (FOG_COMBINED_WITH_WORLD_POS)
												UNITY_EXTRACT_FOG_FROM_WORLD_POS(IN);
											  #else
												UNITY_EXTRACT_FOG(IN);
											  #endif
											  UNITY_INITIALIZE_OUTPUT(Input,surfIN);
											  surfIN.vertexColor.x = 1.0;
											  surfIN.uv_tex3coord.x = 1.0;
											  surfIN.screenPos.x = 1.0;
											  surfIN.uv_tex3coord = IN.pack0.xyz;
											  float3 worldPos = IN.worldPos.xyz;
											  #ifndef USING_DIRECTIONAL_LIGHT
												fixed3 lightDir = normalize(UnityWorldSpaceLightDir(worldPos));
											  #else
												fixed3 lightDir = _WorldSpaceLightPos0.xyz;
											  #endif
											  surfIN.vertexColor = IN.color;
											  #ifdef UNITY_COMPILER_HLSL
											  SurfaceOutput o = (SurfaceOutput)0;
											  #else
											  SurfaceOutput o;
											  #endif
											  o.Albedo = 0.0;
											  o.Emission = 0.0;
											  o.Specular = 0.0;
											  o.Alpha = 0.0;
											  o.Gloss = 0.0;
											  fixed3 normalWorldVertex = fixed3(0,0,1);
											  o.Normal = IN.worldNormal;
											  normalWorldVertex = IN.worldNormal;

											  // call surface function
											  surf(surfIN, o);
											  UNITY_LIGHT_ATTENUATION(atten, IN, worldPos)
											  fixed4 c = 0;
											  c += LightingUnlit(o, lightDir, atten);
											  UNITY_APPLY_FOG(_unity_fogCoord, c); // apply fog
											  return c;
											}


											#endif


											ENDCG

											}

									  // ---- meta information extraction pass:
									  Pass {
										  Name "Meta"
										  Tags { "LightMode" = "Meta" }
										  Cull Off

								  CGPROGRAM
												// compile directives
												#pragma vertex vert_surf
												#pragma fragment frag_surf
												#pragma target 3.0
												#pragma multi_compile_instancing
												#pragma skip_variants FOG_LINEAR FOG_EXP FOG_EXP2
												#pragma shader_feature EDITOR_VISUALIZATION

												#include "HLSLSupport.cginc"
												#define UNITY_INSTANCED_LOD_FADE
												#define UNITY_INSTANCED_SH
												#define UNITY_INSTANCED_LIGHTMAPSTS
												#include "UnityShaderVariables.cginc"
												#include "UnityShaderUtilities.cginc"
												// -------- variant for: <when no other keywords are defined>
												#if !defined(INSTANCING_ON)
												// Surface shader code generated based on:
												// writes to per-pixel normal: no
												// writes to emission: no
												// writes to occlusion: no
												// needs world space reflection vector: no
												// needs world space normal vector: no
												// needs screen space position: no
												// needs world space position: no
												// needs view direction: no
												// needs world space view direction: no
												// needs world space position for lighting: no
												// needs world space view direction for lighting: no
												// needs world space view direction for lightmaps: no
												// needs vertex color: YES
												// needs VFACE: no
												// needs SV_IsFrontFace: no
												// passes tangent-to-world matrix to pixel shader: no
												// reads from normal: no
												// 1 texcoords actually used
												//   float3 _tex3coord
												#include "UnityCG.cginc"
												#include "Lighting.cginc"

												#define INTERNAL_DATA
												#define WorldReflectionVector(data,normal) data.worldRefl
												#define WorldNormalVector(data,normal) normal

												// Original surface shader snippet:
												#line 22 ""
												#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
												#endif
												/* UNITY: Original start of shader */
														#include "UnityShaderVariables.cginc"
														#include "UnityCG.cginc"
														//#pragma target 3.0
														//#pragma surface surf Unlit alpha noshadow 
														#undef TRANSFORM_TEX
														#define TRANSFORM_TEX(tex,name) float4(tex.xy * name##_ST.xy + name##_ST.zw, tex.z, tex.w)

														struct Input
														{
															float4 vertexColor : COLOR;
															float3 uv_tex3coord;
															float4 screenPos;
														};

														uniform float _Useblack;
														uniform float _Emission;
														uniform float4 _Color;
														uniform sampler2D _MainTex;
														uniform float _StartFrequency;
														uniform float _Amplitude;
														uniform float _Frequency;
														uniform float _Opacity;
														uniform float4 _CameraDepthTexture_TexelSize;

														inline half4 LightingUnlit(SurfaceOutput s, half3 lightDir, half atten)
														{
															return half4(s.Albedo * s.Alpha, s.Alpha);
														}

														void surf(Input i , inout SurfaceOutput o)
														{
															float4 temp_output_121_0 = (_Emission * _Color * i.vertexColor);
															float2 temp_output_8_0 = (((float2(0.2,0) * _Time.y) + (i.uv_tex3coord).xy + i.uv_tex3coord.z) * _StartFrequency);
															float2 break18 = floor(temp_output_8_0);
															float temp_output_21_0 = (break18.x + (break18.y * 57.0));
															float2 temp_output_10_0 = frac(temp_output_8_0);
															float2 temp_cast_1 = 3;
															float2 break17 = (temp_output_10_0 * temp_output_10_0 * (temp_cast_1 - (temp_output_10_0 * 2.0)));
															float lerpResult39 = lerp(frac((473.5 * sin(temp_output_21_0))) , frac((473.5 * sin((1.0 + temp_output_21_0)))) , break17.x);
															float lerpResult38 = lerp(frac((473.5 * sin((57.0 + temp_output_21_0)))) , frac((473.5 * sin((58.0 + temp_output_21_0)))) , break17.x);
															float lerpResult40 = lerp(lerpResult39 , lerpResult38 , break17.y);
															float3 temp_output_51_0 = ((float3((float2(0.5,0.5) * _Time.y) ,  0.0) + (i.uv_tex3coord * (lerpResult40 * _Amplitude)) + i.uv_tex3coord.z) * _Frequency);
															float3 break87 = floor(temp_output_51_0);
															float temp_output_90_0 = (break87.x + (break87.y * 57.0));
															float3 temp_output_52_0 = frac(temp_output_51_0);
															float3 temp_cast_3 = 3;
															float3 break110 = (temp_output_52_0 * temp_output_52_0 * (temp_cast_3 - (temp_output_52_0 * 2.0)));
															float lerpResult109 = lerp(frac((473.5 * sin(temp_output_90_0))) , frac((473.5 * sin((1.0 + temp_output_90_0)))) , break110.x);
															float lerpResult105 = lerp(frac((473.5 * sin((57.0 + temp_output_90_0)))) , frac((473.5 * sin((58.0 + temp_output_90_0)))) , break110.x);
															float lerpResult106 = lerp(lerpResult109 , lerpResult105 , break110.y);
															float4 tex2DNode117 = tex2D(_MainTex, (i.uv_tex3coord + (0.2 * (lerpResult106 * _Amplitude))).xy);
															o.Albedo = lerp(temp_output_121_0,(temp_output_121_0 * tex2DNode117),_Useblack).rgb;

															float clampResult132 = saturate(i.vertexColor.a * tex2DNode117.r * _Opacity);
															o.Alpha = clampResult132;
														}


												#include "UnityMetaPass.cginc"

														// vertex-to-fragment interpolation data
														struct v2f_surf {
														  UNITY_POSITION(pos);
														  float3 pack0 : TEXCOORD0; // _tex3coord
														  fixed4 color : COLOR0;
														#ifdef EDITOR_VISUALIZATION
														  float2 vizUV : TEXCOORD1;
														  float4 lightCoord : TEXCOORD2;
														#endif
														  UNITY_VERTEX_INPUT_INSTANCE_ID
														  UNITY_VERTEX_OUTPUT_STEREO
														};
														float4 _tex3coord_ST;

														// vertex shader
														v2f_surf vert_surf(appdata_full v) {
														  UNITY_SETUP_INSTANCE_ID(v);
														  v2f_surf o;
														  UNITY_INITIALIZE_OUTPUT(v2f_surf,o);
														  UNITY_TRANSFER_INSTANCE_ID(v,o);
														  UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
														  o.pos = UnityMetaVertexPosition(v.vertex, v.texcoord1.xy, v.texcoord2.xy, unity_LightmapST, unity_DynamicLightmapST);
														#ifdef EDITOR_VISUALIZATION
														  o.vizUV = 0;
														  o.lightCoord = 0;
														  if (unity_VisualizationMode == EDITORVIZ_TEXTURE)
															o.vizUV = UnityMetaVizUV(unity_EditorViz_UVIndex, v.texcoord.xy, v.texcoord1.xy, v.texcoord2.xy, unity_EditorViz_Texture_ST);
														  else if (unity_VisualizationMode == EDITORVIZ_SHOWLIGHTMASK)
														  {
															o.vizUV = v.texcoord1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
															o.lightCoord = mul(unity_EditorViz_WorldToLight, mul(unity_ObjectToWorld, float4(v.vertex.xyz, 1)));
														  }
														#endif
														  o.pack0.xyz = TRANSFORM_TEX(v.texcoord, _tex3coord);
														  float3 worldPos = mul(unity_ObjectToWorld, v.vertex).xyz;
														  float3 worldNormal = UnityObjectToWorldNormal(v.normal);
														  o.color = v.color;
														  return o;
														}

														// fragment shader
														fixed4 frag_surf(v2f_surf IN) : SV_Target {
														  UNITY_SETUP_INSTANCE_ID(IN);
														// prepare and unpack data
														Input surfIN;
														#ifdef FOG_COMBINED_WITH_TSPACE
														  UNITY_EXTRACT_FOG_FROM_TSPACE(IN);
														#elif defined (FOG_COMBINED_WITH_WORLD_POS)
														  UNITY_EXTRACT_FOG_FROM_WORLD_POS(IN);
														#else
														  UNITY_EXTRACT_FOG(IN);
														#endif
														UNITY_INITIALIZE_OUTPUT(Input,surfIN);
														surfIN.vertexColor.x = 1.0;
														surfIN.uv_tex3coord.x = 1.0;
														surfIN.screenPos.x = 1.0;
														surfIN.uv_tex3coord = IN.pack0.xyz;
														surfIN.vertexColor = IN.color;
														#ifdef UNITY_COMPILER_HLSL
														SurfaceOutput o = (SurfaceOutput)0;
														#else
														SurfaceOutput o;
														#endif
														o.Albedo = 0.0;
														o.Emission = 0.0;
														o.Specular = 0.0;
														o.Alpha = 0.0;
														o.Gloss = 0.0;
														fixed3 normalWorldVertex = fixed3(0,0,1);

														// call surface function
														surf(surfIN, o);
														UnityMetaInput metaIN;
														UNITY_INITIALIZE_OUTPUT(UnityMetaInput, metaIN);
														metaIN.Albedo = o.Albedo;
														metaIN.Emission = o.Emission;
														metaIN.SpecularColor = o.Specular;
													  #ifdef EDITOR_VISUALIZATION
														metaIN.VizUV = IN.vizUV;
														metaIN.LightCoord = IN.lightCoord;
													  #endif
														return UnityMetaFragment(metaIN);
													  }


													  #endif

															// -------- variant for: INSTANCING_ON 
															#if defined(INSTANCING_ON)
															// Surface shader code generated based on:
															// writes to per-pixel normal: no
															// writes to emission: no
															// writes to occlusion: no
															// needs world space reflection vector: no
															// needs world space normal vector: no
															// needs screen space position: no
															// needs world space position: no
															// needs view direction: no
															// needs world space view direction: no
															// needs world space position for lighting: no
															// needs world space view direction for lighting: no
															// needs world space view direction for lightmaps: no
															// needs vertex color: YES
															// needs VFACE: no
															// needs SV_IsFrontFace: no
															// passes tangent-to-world matrix to pixel shader: no
															// reads from normal: no
															// 1 texcoords actually used
															//   float3 _tex3coord
															#include "UnityCG.cginc"
															#include "Lighting.cginc"

															#define INTERNAL_DATA
															#define WorldReflectionVector(data,normal) data.worldRefl
															#define WorldNormalVector(data,normal) normal

															// Original surface shader snippet:
															#line 22 ""
															#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
															#endif
															/* UNITY: Original start of shader */
																	#include "UnityShaderVariables.cginc"
																	#include "UnityCG.cginc"
																	//#pragma target 3.0
																	//#pragma surface surf Unlit alpha noshadow 
																	#undef TRANSFORM_TEX
																	#define TRANSFORM_TEX(tex,name) float4(tex.xy * name##_ST.xy + name##_ST.zw, tex.z, tex.w)

																	struct Input
																	{
																		float4 vertexColor : COLOR;
																		float3 uv_tex3coord;
																		float4 screenPos;
																	};

																	uniform float _Useblack;
																	uniform float _Emission;
																	uniform float4 _Color;
																	uniform sampler2D _MainTex;
																	uniform float _StartFrequency;
																	uniform float _Amplitude;
																	uniform float _Frequency;
																	uniform float _Opacity;
																	uniform float4 _CameraDepthTexture_TexelSize;

																	inline half4 LightingUnlit(SurfaceOutput s, half3 lightDir, half atten)
																	{
																		return half4(s.Albedo * s.Alpha, s.Alpha);
																	}

																	void surf(Input i , inout SurfaceOutput o)
																	{
																		float4 temp_output_121_0 = (_Emission * _Color * i.vertexColor);
																		float2 temp_output_8_0 = (((float2(0.2,0) * _Time.y) + (i.uv_tex3coord).xy + i.uv_tex3coord.z) * _StartFrequency);
																		float2 break18 = floor(temp_output_8_0);
																		float temp_output_21_0 = (break18.x + (break18.y * 57.0));
																		float2 temp_output_10_0 = frac(temp_output_8_0);
																		float2 temp_cast_1 = 3;
																		float2 break17 = (temp_output_10_0 * temp_output_10_0 * (temp_cast_1 - (temp_output_10_0 * 2.0)));
																		float lerpResult39 = lerp(frac((473.5 * sin(temp_output_21_0))) , frac((473.5 * sin((1.0 + temp_output_21_0)))) , break17.x);
																		float lerpResult38 = lerp(frac((473.5 * sin((57.0 + temp_output_21_0)))) , frac((473.5 * sin((58.0 + temp_output_21_0)))) , break17.x);
																		float lerpResult40 = lerp(lerpResult39 , lerpResult38 , break17.y);
																		float3 temp_output_51_0 = ((float3((float2(0.5,0.5) * _Time.y) ,  0.0) + (i.uv_tex3coord * (lerpResult40 * _Amplitude)) + i.uv_tex3coord.z) * _Frequency);
																		float3 break87 = floor(temp_output_51_0);
																		float temp_output_90_0 = (break87.x + (break87.y * 57.0));
																		float3 temp_output_52_0 = frac(temp_output_51_0);
																		float3 temp_cast_3 = 3;
																		float3 break110 = (temp_output_52_0 * temp_output_52_0 * (temp_cast_3 - (temp_output_52_0 * 2.0)));
																		float lerpResult109 = lerp(frac((473.5 * sin(temp_output_90_0))) , frac((473.5 * sin((1.0 + temp_output_90_0)))) , break110.x);
																		float lerpResult105 = lerp(frac((473.5 * sin((57.0 + temp_output_90_0)))) , frac((473.5 * sin((58.0 + temp_output_90_0)))) , break110.x);
																		float lerpResult106 = lerp(lerpResult109 , lerpResult105 , break110.y);
																		float4 tex2DNode117 = tex2D(_MainTex, (i.uv_tex3coord + (0.2 * (lerpResult106 * _Amplitude))).xy);
																		o.Albedo = lerp(temp_output_121_0,(temp_output_121_0 * tex2DNode117),_Useblack).rgb;

																		float clampResult132 = saturate(i.vertexColor.a * tex2DNode117.r * _Opacity);
																		o.Alpha = clampResult132;
																	}


															#include "UnityMetaPass.cginc"

																	// vertex-to-fragment interpolation data
																	struct v2f_surf {
																	  UNITY_POSITION(pos);
																	  float3 pack0 : TEXCOORD0; // _tex3coord
																	  fixed4 color : COLOR0;
																	#ifdef EDITOR_VISUALIZATION
																	  float2 vizUV : TEXCOORD1;
																	  float4 lightCoord : TEXCOORD2;
																	#endif
																	  UNITY_VERTEX_INPUT_INSTANCE_ID
																	  UNITY_VERTEX_OUTPUT_STEREO
																	};
																	float4 _tex3coord_ST;

																	// vertex shader
																	v2f_surf vert_surf(appdata_full v) {
																	  UNITY_SETUP_INSTANCE_ID(v);
																	  v2f_surf o;
																	  UNITY_INITIALIZE_OUTPUT(v2f_surf,o);
																	  UNITY_TRANSFER_INSTANCE_ID(v,o);
																	  UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
																	  o.pos = UnityMetaVertexPosition(v.vertex, v.texcoord1.xy, v.texcoord2.xy, unity_LightmapST, unity_DynamicLightmapST);
																	#ifdef EDITOR_VISUALIZATION
																	  o.vizUV = 0;
																	  o.lightCoord = 0;
																	  if (unity_VisualizationMode == EDITORVIZ_TEXTURE)
																		o.vizUV = UnityMetaVizUV(unity_EditorViz_UVIndex, v.texcoord.xy, v.texcoord1.xy, v.texcoord2.xy, unity_EditorViz_Texture_ST);
																	  else if (unity_VisualizationMode == EDITORVIZ_SHOWLIGHTMASK)
																	  {
																		o.vizUV = v.texcoord1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
																		o.lightCoord = mul(unity_EditorViz_WorldToLight, mul(unity_ObjectToWorld, float4(v.vertex.xyz, 1)));
																	  }
																	#endif
																	  o.pack0.xyz = TRANSFORM_TEX(v.texcoord, _tex3coord);
																	  float3 worldPos = mul(unity_ObjectToWorld, v.vertex).xyz;
																	  float3 worldNormal = UnityObjectToWorldNormal(v.normal);
																	  o.color = v.color;
																	  return o;
																	}

																	// fragment shader
																	fixed4 frag_surf(v2f_surf IN) : SV_Target {
																	  UNITY_SETUP_INSTANCE_ID(IN);
																	// prepare and unpack data
																	Input surfIN;
																	#ifdef FOG_COMBINED_WITH_TSPACE
																	  UNITY_EXTRACT_FOG_FROM_TSPACE(IN);
																	#elif defined (FOG_COMBINED_WITH_WORLD_POS)
																	  UNITY_EXTRACT_FOG_FROM_WORLD_POS(IN);
																	#else
																	  UNITY_EXTRACT_FOG(IN);
																	#endif
																	UNITY_INITIALIZE_OUTPUT(Input,surfIN);
																	surfIN.vertexColor.x = 1.0;
																	surfIN.uv_tex3coord.x = 1.0;
																	surfIN.screenPos.x = 1.0;
																	surfIN.uv_tex3coord = IN.pack0.xyz;
																	surfIN.vertexColor = IN.color;
																	#ifdef UNITY_COMPILER_HLSL
																	SurfaceOutput o = (SurfaceOutput)0;
																	#else
																	SurfaceOutput o;
																	#endif
																	o.Albedo = 0.0;
																	o.Emission = 0.0;
																	o.Specular = 0.0;
																	o.Alpha = 0.0;
																	o.Gloss = 0.0;
																	fixed3 normalWorldVertex = fixed3(0,0,1);

																	// call surface function
																	surf(surfIN, o);
																	UnityMetaInput metaIN;
																	UNITY_INITIALIZE_OUTPUT(UnityMetaInput, metaIN);
																	metaIN.Albedo = o.Albedo;
																	metaIN.Emission = o.Emission;
																	metaIN.SpecularColor = o.Specular;
																  #ifdef EDITOR_VISUALIZATION
																	metaIN.VizUV = IN.vizUV;
																	metaIN.LightCoord = IN.lightCoord;
																  #endif
																	return UnityMetaFragment(metaIN);
																  }


																  #endif


																  ENDCG

																  }

												// ---- end of surface shader generated code

											#LINE 82

		}
}

/*
Shader "EGA/Particles/FireSphere"
{
	Properties
	{
		_MainTex("Main Tex", 2D) = "white" {}
		_Color("Color", Color) = (1,1,1,1)
		_Emission("Emission", Float) = 2
		_StartFrequency("Start Frequency", Float) = 4
		_Frequency("Frequency", Float) = 10
		_Amplitude("Amplitude", Float) = 1
		[Toggle]_Useblack("Use black", Float) = 0
		_Opacity("Opacity", Float) = 1
		[HideInInspector] _tex3coord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Blend One One
		ColorMask RGBA

		Tags{ "RenderType" = "Transparent"  "Queue" = "Transparent" "IgnoreProjector" = "True" "IsEmissive" = "true"  "PreviewType"="Plane" }
		Cull Back
		CGPROGRAM
		#include "UnityShaderVariables.cginc"
		#include "UnityCG.cginc"
		#pragma target 3.0
		#pragma surface surf Unlit alpha noshadow 
		#undef TRANSFORM_TEX
		#define TRANSFORM_TEX(tex,name) float4(tex.xy * name##_ST.xy + name##_ST.zw, tex.z, tex.w)

		struct Input
		{
			float4 vertexColor : COLOR;
			float3 uv_tex3coord;
			float4 screenPos;
		};

		uniform float _Useblack;
		uniform float _Emission;
		uniform float4 _Color;
		uniform sampler2D _MainTex;
		uniform float _StartFrequency;
		uniform float _Amplitude;
		uniform float _Frequency;
		uniform float _Opacity;
		uniform float4 _CameraDepthTexture_TexelSize;

		inline half4 LightingUnlit( SurfaceOutput s, half3 lightDir, half atten )
		{
			return half4(s.Albedo * s.Alpha, s.Alpha);
		}

		void surf( Input i , inout SurfaceOutput o )
		{
			float4 temp_output_121_0 = ( _Emission * _Color * i.vertexColor );
			float2 temp_output_8_0 = ( ( ( float2( 0.2,0 ) * _Time.y ) + (i.uv_tex3coord).xy + i.uv_tex3coord.z ) * _StartFrequency );
			float2 break18 = floor( temp_output_8_0 );
			float temp_output_21_0 = ( break18.x + ( break18.y * 57.0 ) );
			float2 temp_output_10_0 = frac( temp_output_8_0 );
			float2 temp_cast_1 = 3;
			float2 break17 = ( temp_output_10_0 * temp_output_10_0 * ( temp_cast_1 - ( temp_output_10_0 * 2.0 ) ) );
			float lerpResult39 = lerp( frac( ( 473.5 * sin( temp_output_21_0 ) ) ) , frac( ( 473.5 * sin( ( 1.0 + temp_output_21_0 ) ) ) ) , break17.x);
			float lerpResult38 = lerp( frac( ( 473.5 * sin( ( 57.0 + temp_output_21_0 ) ) ) ) , frac( ( 473.5 * sin( ( 58.0 + temp_output_21_0 ) ) ) ) , break17.x);
			float lerpResult40 = lerp( lerpResult39 , lerpResult38 , break17.y);
			float3 temp_output_51_0 = ( ( float3( ( float2( 0.5,0.5 ) * _Time.y ) ,  0.0 ) + ( i.uv_tex3coord * ( lerpResult40 * _Amplitude ) ) + i.uv_tex3coord.z ) * _Frequency );
			float3 break87 = floor( temp_output_51_0 );
			float temp_output_90_0 = ( break87.x + ( break87.y * 57.0 ) );
			float3 temp_output_52_0 = frac( temp_output_51_0 );
			float3 temp_cast_3 = 3;
			float3 break110 = ( temp_output_52_0 * temp_output_52_0 * ( temp_cast_3 - ( temp_output_52_0 * 2.0 ) ) );
			float lerpResult109 = lerp( frac( ( 473.5 * sin( temp_output_90_0 ) ) ) , frac( ( 473.5 * sin( ( 1.0 + temp_output_90_0 ) ) ) ) , break110.x);
			float lerpResult105 = lerp( frac( ( 473.5 * sin( ( 57.0 + temp_output_90_0 ) ) ) ) , frac( ( 473.5 * sin( ( 58.0 + temp_output_90_0 ) ) ) ) , break110.x);
			float lerpResult106 = lerp( lerpResult109 , lerpResult105 , break110.y);
			float4 tex2DNode117 = tex2D( _MainTex, ( i.uv_tex3coord + ( 0.2 * ( lerpResult106 * _Amplitude) ) ).xy );
			o.Albedo = lerp(temp_output_121_0,( temp_output_121_0 * tex2DNode117 ),_Useblack).rgb;
			
			float clampResult132 = saturate( i.vertexColor.a * tex2DNode117.r * _Opacity );
			o.Alpha = clampResult132;
		}

		ENDCG
	}
}
*/