using UnityEngine;
using UnityEngine.UI;
using ScreenEffect;

namespace BrainBluetooth.FpsBar
{
    internal sealed class FpsBarScript : MonoBehaviour
    {
        [SerializeField] private Canvas canvas;

        [SerializeField] private Text text1;
        [SerializeField] private Text text2;
        public string format = "{0:N2}";
        [SerializeField] private RawImage image;

        public float minFps;
        public float maxFps;

        [Range(0, 1)] public float weight = 0.9f;
        private float prevFps = -1;

        private Material mat;

        private void Start()
        {
            if (image)
                mat = image.material;

            canvas.worldCamera = CameraList.Instance.FindCamera("Display").camera;
        }

        private void Update()
        {
            float dt = Time.deltaTime;
            float fps = 1 / dt;
            if (prevFps == -1)
                prevFps = fps;
            else
                prevFps = Mathf.Lerp(prevFps, fps, weight);
            fps = prevFps;

            string str = string.Format(format, fps);
            if (text1)
                text1.text = str;
            if (text2)
                text2.text = str;

            if (mat)
            {
                float progress = Mathf.InverseLerp(Mathf.Log10(minFps), Mathf.Log10(maxFps), Mathf.Log10(fps));
                mat.SetFloat("_Progress", progress);
            }
        }
    }
}