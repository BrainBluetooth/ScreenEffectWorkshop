using System;
using System.Runtime.InteropServices;

struct RECT
{
    public uint left, top, right, bottom;
}

internal static class Native
{
    [DllImport("user32")]
    public static extern IntPtr GetActiveWindow();

    [DllImport("user32")]
    [return: MarshalAs(UnmanagedType.Bool)]
    public static extern bool SetLayeredWindowAttributes(
        IntPtr hwnd,
        uint crKey,
        byte bAlpha,
        uint dwFlags
    );

    [DllImport("user32")]
    public static extern int GetWindowLongW(IntPtr wnd, int index);

    [DllImport("user32")]
    public static extern int SetWindowLongW(IntPtr wnd, int index, int newLong);

    [DllImport("user32")]
    public  static extern int FindWindow(string className, string windowText);

    [DllImport("user32")]
    public static extern int ShowWindow(int hwnd, int command);

    [DllImport("user32")]
    public static extern int GetSysColor(int index);
}