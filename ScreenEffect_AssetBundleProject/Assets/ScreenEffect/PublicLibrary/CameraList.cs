#pragma warning disable IDE0003
using System;
using UnityEngine;

namespace ScreenEffect
{
    [Serializable]
    public struct CameraInfo
    {
        [SerializeField] private string _name;
        [SerializeField] private Camera _camera;
        public string name => this._name;
        public Camera camera => this._camera;
    }

    public sealed class CameraList : MonoBehaviour
    {
        public static CameraList Instance { get; private set; }

        [SerializeField] private CameraInfo[] cameras;

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
                this.cameras = null;
            }
        }

        public CameraInfo FindCamera(string name)
        {
            foreach (var item in this.cameras)
            {
                if (item.name == name)
                    return item;
            }
            return default;
        }
    }
}