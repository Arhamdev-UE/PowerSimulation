UCLASS(Abstract)
class ASwitchableDevice : AActor
{
    UPROPERTY()
    UPowerSource PowerSource;
    UPROPERTY(DefaultComponent)
    UStaticMeshComponent Mesh;
    UPROPERTY()
    bool bIsOn =false;
    UFUNCTION(BlueprintCallable)
    void ToggleDevice()
    {
        if(PowerSource!=nullptr&&PowerSource.IsPowerAvailable())
        {
            bIsOn=false;
            
        }
    }
    UFUNCTION(BlueprintOverride)
    void Tick(float DeltaSeconds)
    {
        if(!PowerSource.IsPowerAvailable())
        {
            if(bIsOn)
            {
                bIsOn=false;

            }
        }
    }
    UFUNCTION(BlueprintCallable)
    void ApplyState(bool bNewState)
    {
        bIsOn = bNewState;
        if(bIsOn)
        {
            Mesh.SetVisibility(true);
            Print("Device Turned On");
        }
        else
        {
            Mesh.SetVisibility(false);
            Print("Device Turned Off");
        }
    }
};