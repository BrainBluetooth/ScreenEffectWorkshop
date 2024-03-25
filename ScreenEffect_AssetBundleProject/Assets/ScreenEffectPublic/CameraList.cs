#pragma warning disable IDE0003
using System;
using UnityEngine;

[Serializable]
public struct CameraInfo
{
    [SerializeField] private string name;
    [SerializeField] private Camera camera;
    public string Name => this.name;
    public Camera Camera => this.camera;
}

public sealed class CameraList : MonoBehaviour
{
    public static CameraList Instance { get; private set; }

    [SerializeField] CameraInfo[] cameras;

    private void Awake()
    {
        if (Instance != null)
        {
            Debug.LogError("Singleton-CameraList");
            Destroy(this);
            return;
        }
        Instance = this;
    }

    private void OnDestroy()
    {
        if (Instance == this)
        {
            Instance = null;
            Dispose();
        }
    }

    private void Dispose()
    {
        cameras = null;
    }

    public CameraInfo FindCamera(string name)
    {
        foreach (var item in cameras)
        {
            if (item.Name == name)
                return item;
        }
        return default;
    }
}