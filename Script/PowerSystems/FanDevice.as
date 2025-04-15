UCLASS()
class AFanDevice : ASwitchableDevice
{
    UPROPERTY(DefaultComponent)
    USceneComponent SceneRoot;
    UPROPERTY(DefaultComponent, Attach = SceneRoot)
    UStaticMeshComponent FanMesh;
    UPROPERTY(DefaultComponent)
    URotatingMovementComponent Rotator;

    UFUNCTION(BlueprintOverride)
    void ApplyState(bool bNewState)
    {
        Super::ApplyState(bNewState);

        if (bNewState)
        {
            Rotator.Activate();  // Start fan rotation
        }
        else
        {
            Rotator.Deactivate();  // Stop fan rotation
        }
    }
};