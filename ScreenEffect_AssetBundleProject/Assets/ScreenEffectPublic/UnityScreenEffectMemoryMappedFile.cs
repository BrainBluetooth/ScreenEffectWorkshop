using ScreenEffect;
using UnityEngine;

public sealed class UnityScreenEffectMemoryMappedFile
{
    public static readonly UnityScreenEffectMemoryMappedFile Instance = new UnityScreenEffectMemoryMappedFile();

    public readonly ScreenEffectSharedMemory file;

    private UnityScreenEffectMemoryMappedFile()
    {
        file = new ScreenEffectSharedMemory();
    }
    ~UnityScreenEffectMemoryMappedFile()
    {
        file.Dispose();
    }

    public enum MouseInputType
    {
        LeftButtonDown = 0,
        LeftButtonUp = 1,
        RightButtonDown = 2,
        RightButtonUp = 3,
        MiddleButtonDown = 4,
        MiddleButtonUp = 5,
        XButton1Down = 6,
        XButton1Up = 7,
        XButton2Down = 8,
        XButton2Up = 9,
    }
    public MouseInputData GetMouseInputData(MouseInputType type)
    {
        return file.GetMouseInputData((int)type);
    }

    public Vector2Int GetMouseWheelData()
    {
        Short2 p = file.GetWheel();
        return new Vector2Int(p.x, p.y);
    }
}