using System;
using UnityEngine;
using ScreenEffect;
using UnityEngine.UI;
using UInput = UnityEngine.Input;
using SInput = ScreenEffect.Input;

namespace BrainBluetooth.LogInput
{
    public class LogInputScript : MonoBehaviour
    {
        [SerializeField] private Text leftText;
        [SerializeField] private Text rightText;

        private void LateUpdate()
        {
            string newLine = Environment.NewLine;

            leftText.text = "[Mouse]" + newLine +
                "Unity" + newLine +
                "mousePosition=" + UInput.mousePosition + newLine +
                "button0=" + UInput.GetMouseButton(0) + newLine +
                "button1=" + UInput.GetMouseButton(1) + newLine +
                "button2=" + UInput.GetMouseButton(2) + newLine +
                "button3=" + UInput.GetMouseButton(3) + newLine +
                "button4=" + UInput.GetMouseButton(4) + newLine +
                "ScreenEffect" + newLine +
                "mousePosition=" + SInput.mousePosition + newLine +
                "button0=" + SInput.GetMouseButton(0) + newLine +
                "button1=" + SInput.GetMouseButton(1) + newLine +
                "button2=" + SInput.GetMouseButton(2) + newLine +
                "button3=" + SInput.GetMouseButton(3) + newLine +
                "button4=" + SInput.GetMouseButton(4);

            rightText.text = "[Keyboard]" + newLine +
                "Unity" + newLine +
                "Alpha0 pressed=" + UInput.GetKey(KeyCode.Alpha0) + newLine +
                "ScreenEffect" + newLine +
                "Alpha0 pressed=" + SInput.GetKey(VirtualKeyCode.Alpha0);
        }
    }
}