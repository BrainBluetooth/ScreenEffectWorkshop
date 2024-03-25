using UnityEngine;
using UnityEngine.UI;

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

#if UNITY_EDITOR
    private void Reset()
    {
        var texts = GetComponentsInChildren<Text>();
        if (texts.Length > 0)
        {
            text1 = texts[0];
            if (texts.Length > 1)
                text2 = texts[1];
        }
        image = GetComponentInChildren<RawImage>();
    }
#endif
    private void Awake()
    {
        if (image)
            mat = image.material;

        canvas.worldCamera = CameraList.Instance.FindCamera("Display").Camera;
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