using ScreenEffect;
using UnityEngine;
using SInput = ScreenEffect.Input;
using UInput = UnityEngine.Input;

public class ImpactScript : MonoBehaviour
{
    public GameObject prefab;
    public float destroyDelay = 2f;
    private long lastTime;

    private void LateUpdate()
    {
        var data = UnityScreenEffectMemoryMappedFile.Instance.GetMouseInputData(UnityScreenEffectMemoryMappedFile.MouseInputType.LeftButtonDown);
#if UNITY_EDITOR
        if (UInput.GetMouseButtonDown(0))
#else
        if (data.timeStamp != lastTime)
#endif
        {
            lastTime = data.timeStamp;
            Vector3 cursorPos =
#if UNITY_EDITOR
                SInput.mousePosition;
#else
                new Vector3(data.cursorPos.x, 
                Screen.height - 1 - data.cursorPos.y);
#endif
            var pos = Camera.main.ScreenToWorldPoint(cursorPos + Vector3.forward * 10);
            var gObj = Instantiate(prefab, this.transform);
            gObj.transform.position = pos;
            Destroy(gObj, destroyDelay);
        }
    }
}