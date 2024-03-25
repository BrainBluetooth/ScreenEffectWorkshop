using System.IO;
using UnityEditor;

public static class AssetBundleBuilder
{
    [MenuItem("Assets/Build Asset Bundles")]
    public static void BuildAssetBundles()
    {
        Directory.CreateDirectory("AssetBundles");
        BuildPipeline.BuildAssetBundles("AssetBundles", BuildAssetBundleOptions.StrictMode, BuildTarget.StandaloneWindows);
    }
}