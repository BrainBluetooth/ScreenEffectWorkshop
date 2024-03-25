using UnityEngine;
#if UNITY_EDITOR
using UnityEditor;
#endif

internal sealed class CaptureScreenshot : MonoBehaviour
{
    [SerializeField] private Material imageEffect;

#if UNITY_EDITOR
    [MenuItem("Edit/Capture")]
    private static void Capture()
    {
        ScreenCapture.CaptureScreenshot("Screen.png");
    }
#endif

    private void OnRenderImage(RenderTexture source, RenderTexture destination)
    {
        if (imageEffect != null)
            Graphics.Blit(source, destination, this.imageEffect);
        else
            Graphics.Blit(source, destination);
    }
}