using UnityEngine;

[ExecuteInEditMode]
internal sealed class PargbPostProcess : MonoBehaviour
{
    [SerializeField] private Material imageEffect;

    private void OnRenderImage(RenderTexture source, RenderTexture destination)
    {
        if (imageEffect != null)
            Graphics.Blit(source, destination, this.imageEffect);
        else
            Graphics.Blit(source, destination);
    }
}