using System;
using System.Runtime.InteropServices;
using UnityEngine;
using UnityEngine.UI;

public struct Timer
{
    public float elapsed;
    public float maxTime;
}

public class Bluescreen : MonoBehaviour
{
    [SerializeField] private Text text;

    [Range(0, 1)] public float progress;

    public float speed;

    [DllImport("user32")]
    private static extern int LockWorkStation();

    private bool hasLocked = false;

    [SerializeField] private RawImage background;

    private void Start()
    {
        var camera = CameraList.Instance.FindCamera("Display").Camera;

        base.GetComponent<Canvas>().worldCamera = camera;

        try
        {
            int color = Native.GetSysColor(13);
            background.color = new Color32(
                (byte)(color & 255),
                (byte)((color >> 8) & 255),
                (byte)((color >> 16) & 255),
                255);
        }
        catch (Exception e)
        {
            Debug.LogException(e);
        }

        int hwnd = Native.FindWindow("Shell_TrayWnd", "");
        Native.ShowWindow(hwnd, 0);
    }

    private void LateUpdate()
    {
        if (this.progress == 1f)
        {
            Destroy(this.gameObject);
            if (!hasLocked)
            {
                hasLocked = true;
                LockWorkStation();
            }
        }

        this.progress += Time.deltaTime * Mathf.Lerp(0.5f, 1f, UnityEngine.Random.value) * speed;
        this.progress = Mathf.Clamp01(this.progress);

        text.text = $"{Mathf.RoundToInt(100 * progress)}% complete";
    }

    private void OnDestroy()
    {
        int hwnd = Native.FindWindow("Shell_TrayWnd", "");
        Native.ShowWindow(hwnd, 1);
    }
}