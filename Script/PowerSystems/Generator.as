UCLASS()
class AGenerator : APowerSource
{
    UPROPERTY()
    float Fuel = 100.0f;

    UPROPERTY()
    bool bManualSwitch = false;
    UPROPERTY(DefaultComponent)
    USceneComponent SceneRoot;
    

    UPROPERTY(EditAnywhere)
    TArray<APowerSource> InputPowerSource;

   

    UFUNCTION(BlueprintOverride)
    void BeginPlay()
    {
        SetActorTickEnabled(true);
        Print("tickEnabled");
        
        
    }

    UFUNCTION(BlueprintCallable)
    void ToggleSwitch()
    {
        if (Fuel > 0 && AreInputsOn())
        {
            bManualSwitch = !bManualSwitch;
            Print("Generator Switch " + (bManualSwitch ? "On" : "Off"));
        }
        else
        {
            Print("Cannot Toggle Generator: No Power or No Fuel");
        }
    }

    bool AreInputsOn()
    {
        for (int i = 0; i < InputPowerSource.Num(); i++)
        {
            if (InputPowerSource[i] == nullptr || !InputPowerSource[i].IsProvidingPower())
                return false;
        }
        return true;
    }

    UFUNCTION(BlueprintOverride)
    void Tick(float DeltaSeconds)
    {
        if (IsProvidingPower())
        {
            Print("Generator is Active");

            if (Fuel > 0)
            {
                Fuel -= DeltaSeconds * 10.0f;
                if (Fuel < 0)
                    Fuel = 0;
                Print("Fuel Left: " + Fuel);
            }
            else
            {
                Fuel = 0;
                bManualSwitch = false;
                Print("Generator Ran Out of Fuel!");
            }

        }
    }

    UFUNCTION(BlueprintOverride)
    bool IsProvidingPower()
    {
        return Fuel > 0 && bManualSwitch && AreInputsOn();
    }

    // ✅ NEW: Refill fuel function
    UFUNCTION(BlueprintCallable)
    void RefillFuel(float Amount = 100.0f)
    {
        Fuel = Amount;
        Print("Fuel Refilled to: " + Fuel);
    }
};