Shader "Hidden/ImageEffect"
{
    Properties
    {
        [HideInInspector] _MainTex ("Texture", 2D) = "white" {}
        [NoScaleOffset] _Wallpaper("Wallpaper", 2D) = "gray" {}
    }
    SubShader
    {
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
            sampler2D _Wallpaper;

            float4 frag (v2f i) : SV_Target
            {
                float4 foreground = tex2D(_MainTex, i.uv); // premultiplied argb
                foreground = saturate(foreground);
                float3 background = tex2D(_Wallpaper, i.uv).rgb; // rgb
                background = saturate(background);

                float3 alphaBlend = foreground.rgb + background * (1 - foreground.a);

                return float4(alphaBlend, 1);
            }
            ENDCG
        }
    }
}
