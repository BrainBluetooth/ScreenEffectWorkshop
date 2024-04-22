#pragma warning disable IDE1006
using UnityEngine;
using UnityEngine.UI;

[SerializeField]
public class Wallpaper : MonoBehaviour
{
    private Text prevText;
    private string prevName;
    [SerializeField] private Text _text;
    [SerializeField] private string _name;

    private void UpdateProperties()
    {
        this.prevText = this._text;
        this.prevName = this._name;

        this._text.text = this._name;
    }

    public Text text
    {
        get => this._text;
        set
        {
            this._text = value;
            UpdateProperties();
        }
    }
    public new string name
    {
        get => this._name;
        set
        {
            this._name = value;
            UpdateProperties();
        }
    }

    private void Awake()
    {
        UpdateProperties();
    }
}