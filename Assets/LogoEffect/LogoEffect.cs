using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[RequireComponent(typeof(Camera)), ExecuteInEditMode]
public class LogoEffect : MonoBehaviour {

    [SerializeField]
    Shader _shader;

    Material _material;

    void Setup()
    {
        if (_material != null) return;
        _material = new Material(_shader);
        _material.hideFlags = HideFlags.DontSave;
    }

    private void OnRenderImage(RenderTexture source, RenderTexture destination)
    {
        Setup();

        Graphics.Blit(source, destination, _material);
    }
}
