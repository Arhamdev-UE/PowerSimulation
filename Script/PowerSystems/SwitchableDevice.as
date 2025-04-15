UCLASS(Abstract)
class ASwitchableDevice : AActor
{
    UPROPERTY()
    bool bIsOn = false;  // Manual user toggle
    UPROPERTY()
    bool bIsActive = false;  // Actual power state
    UPROPERTY(EditAnywhere)
    APowerSource PowerSource;

    UFUNCTION(BlueprintOverride)
    void BeginPlay()
    {
        SetActorTickEnabled(true);  // Enable ticking
    }

    UFUNCTION(BlueprintOverride)
    void Tick(float DeltaSeconds)
    {
        if (PowerSource != nullptr && PowerSource.IsProvidingPower())
        {
            // Power is available, device should run if user toggled it on
            if (bIsOn && !bIsActive)
            {
                bIsActive = true;
                ApplyState(true);
            }
        }
        else
        {
            // No power — shut down the device if it was active
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
        // To be implemented in child (fan, bulb etc)
    }
}
