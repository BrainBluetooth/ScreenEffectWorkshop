#pragma warning disable IDE1006
#pragma warning disable CS0162
using UnityEngine;
using UnityInput = UnityEngine.Input;

namespace ScreenEffect
{
    public static class Input
    {
        private static KeyCode GetKeyCode(VirtualKeyCode vk)
        {
            Debug.LogWarning("Convert VirtualKeyCode -> UnityEngine.KeyCode");
            return (KeyCode)vk;
        }

        public static Vector2 mousePosition => UnityInput.mousePosition;

        public static bool GetMouseButton(int button)
            => UnityInput.GetMouseButton(button);

        public static bool GetKey(VirtualKeyCode key)
            => UnityInput.GetKey(GetKeyCode(key));

        public static bool GetMouseButtonDwon(int button)
            => UnityInput.GetMouseButtonDown(button);

        public static bool GetMouseButtonUp(int button)
            => UnityInput.GetMouseButtonUp(button);

        public static bool GetKeyDown(VirtualKeyCode key)
            => UnityInput.GetKeyDown(GetKeyCode(key));

        public static bool GetKeyUp(VirtualKeyCode key)
            => UnityInput.GetKeyUp(GetKeyCode(key));
    }

    public enum VirtualKeyCode
    {
        // ----------------------

        /// <summary>
        /// BACKSPACE key
        /// </summary>
        Backspace = 0x08,

        // ----------------------

        /// <summary>
        /// 0 key
        /// </summary>
        Alpha0 = 0x30,
        /// <summary>
        /// 1 key
        /// </summary>
        Alpha1 = 0x31,
        /// <summary>
        /// 2 key
        /// </summary>
        Alpha2 = 0x32,
        /// <summary>
        /// 3 key
        /// </summary>
        Alpha3 = 0x33,
        /// <summary>
        /// 4 key
        /// </summary>
        Alpha4 = 0x34,
        /// <summary>
        /// 5 key
        /// </summary>
        Alpha5 = 0x35,
        /// <summary>
        /// 6 key
        /// </summary>
        Alpha6 = 0x36,
        /// <summary>
        /// 7 key
        /// </summary>
        Alpha7 = 0x37,
        /// <summary>
        /// 8 key
        /// </summary>
        Alpha8 = 0x38,
        /// <summary>
        /// 9 key
        /// </summary>
        Alpha9 = 0x39,

        // ----------------------

        /// <summary>
        /// Left SHIFT key
        /// </summary>
        LeftShift = 0xA0,
        /// <summary>
        /// Right SHIFT key
        /// </summary>
        RightShift = 0xA1,
        /// <summary>
        /// Left CONTROL key
        /// </summary>
        LeftControl = 0xA2,
        /// <summary>
        /// Right CONTROL key
        /// </summary>
        RightControl = 0xA3

        // ----------------------
    }
}