UCLASS()
class AGenerator : APowerSource
{
    UPROPERTY()
    float Fuel = 100.0f;  // Initial fuel level
    UPROPERTY()
    bool bManualSwitch = false;  // Manual switch to toggle the generator's state
    UPROPERTY(EditAnywhere)
    TArray<APowerSource> InputPowerSource;  // Array to store input power sources (circuit breakers)

    UFUNCTION(BlueprintOverride)
    void BeginPlay()
    {
        SetActorTickEnabled(true);
        Print("tickEnabled");
    }

    // Toggle the generator's manual switch
    UFUNCTION(BlueprintCallable)
    void ToggleSwitch()
    {
        if (Fuel > 0 && AreInputsOn())  // Check if generator has fuel and inputs are on
        {
            bManualSwitch = !bManualSwitch;  // Toggle the generator's state
            Print("Generator Switch " + (bManualSwitch ? "On" : "Off"));
        }
        else
        {
            Print("Cannot Toggle Generator: No Power or No Fuel");
        }
    }

    // Check if all input power sources are on
    bool AreInputsOn()
    {
        for (int i = 0; i < InputPowerSource.Num(); i++)
        {
            if (InputPowerSource[i] == nullptr || !InputPowerSource[i].IsProvidingPower())
                return false;  // If any input power source is off or null, return false
        }
        return true;  // All inputs are on
    }

    // Tick function to handle fuel consumption over time
    UFUNCTION(BlueprintOverride)
    void Tick(float DeltaSeconds)
    {
        if (IsProvidingPower())  // Check if generator is providing power
        {
            Print("Generator is Active");

            if (Fuel > 0)
            {
                Fuel -= DeltaSeconds * 10.0f;  // Decrease fuel over time
                if (Fuel < 0)
                    Fuel = 0;
                Print("Fuel Left: " + Fuel);  // Print the current fuel level
            }
            else
            {
                Fuel = 0;
                bManualSwitch = false;  // Turn off the generator if fuel is exhausted
                Print("Generator Ran Out of Fuel!");
            }
        }
    }

    // Check if the generator is providing power (has fuel and is switched on)
    UFUNCTION(BlueprintOverride)
    bool IsProvidingPower()
    {
        return Fuel > 0 && bManualSwitch && AreInputsOn();  // Generator is on if it has fuel, switch is on, and inputs are on
    }
};
