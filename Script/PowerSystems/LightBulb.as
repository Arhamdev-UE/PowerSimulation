UCLASS()
class ALightBulb : ASwitchableDevice
{
    UPROPERTY(DefaultComponent)
    USceneComponent SceneRoot;
    UPROPERTY(DefaultComponent, Attach = SceneRoot)
    UStaticMeshComponent LightMesh;
    UPROPERTY(DefaultComponent, Attach = SceneRoot)
    UPointLightComponent PointLight;

    UFUNCTION(BlueprintOverride)
    void ApplyState(bool bNewState)
    {
        Super::ApplyState(bNewState);
        PointLight.SetVisibility(bNewState);
    }
};