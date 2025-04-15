UCLASS(Abstract)
class ASwitchableDevice : AActor
{
    UPROPERTY()
    bool bIsOn = false; 
    UPROPERTY()
    bool bIsActive = false; 
    UPROPERTY(EditAnywhere)
    APowerSource PowerSource;

    UFUNCTION(BlueprintOverride)
    void BeginPlay()
    {
        SetActorTickEnabled(true); 
    }

    UFUNCTION(BlueprintOverride)
    void Tick(float DeltaSeconds)
    {
        if (PowerSource != nullptr && PowerSource.IsProvidingPower())
        {
            
            if (bIsOn && !bIsActive)
            {
                bIsActive = true;
                ApplyState(true);
            }
        }
        else
        {
            
            if (bIsActive)
            {
                bIsActive = false;
                ApplyState(false);
                Print("Device turned OFF due to power loss");
            }
        }
    }

    UFUNCTION(BlueprintCallable)
    void Toggle()
    {
        bIsOn = !bIsOn;
        Print("Device switch set to: " + (bIsOn ? "On" : "Off"));
    }

    UFUNCTION(BlueprintEvent)
    void ApplyState(bool bNewState)
    {
        
    }
}
