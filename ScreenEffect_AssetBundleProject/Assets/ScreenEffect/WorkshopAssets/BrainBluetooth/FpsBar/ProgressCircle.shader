Shader "Unlit/ProgressCircle"
{
    Properties
    {
		[HideInInspector] _MainTex("Main Texture", 2D) = "black" {}
		_ColorBackground("Color Background", Color) = (0, 0, 0, 1)
		_ColorForeground ("Color Foreground", Color) = (1, 1, 1, 1)
		_Thickness("Thickness", Range(0, 1)) = 0.5
		_Thickness2 ("Thickness 2", Range(0, 1)) = 0.5
		_Progress("Progress", Range(0, 1)) = 0
		_Rotate("Rotate", Range(0, 1)) = 0
		_Direction("Direction", float) = 1
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        LOD 100

        Pass
        {
			Blend One Zero
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

			float4 _ColorBackground;
			float4 _ColorForeground;
			float _Thickness;
			float _Thickness2;
			float _Progress;
			float _Rotate;
			float _Direction;

            v2f vert (appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
				o.uv = v.uv * 2 - 1;
                return o;
            }

            fixed4 frag (v2f i) : SV_Target
            {
				float len = length(i.uv);
				if (len < 1 - _Thickness)
					discard;
				if (len > 1)
					discard;
				
				len = (len - (1 - _Thickness)) / _Thickness;
				len = 2 * len - 1;
				if (abs(len) > _Thickness2)
					return _ColorBackground;

				float theta = atan2(i.uv.y, i.uv.x);
				theta = frac(_Direction * theta / UNITY_TWO_PI + _Rotate);

				if (theta < _Progress)
					return _ColorForeground;
				return _ColorBackground;
            }
            ENDCG
        }
    }
}
