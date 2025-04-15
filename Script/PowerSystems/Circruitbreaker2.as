UCLASS()
class ACircruitbreaker2 : APowerSource
{
    UPROPERTY()
    bool bIsOn = true;

    UFUNCTION(BlueprintCallable)
    void Toggle()
    {
        bIsOn=!bIsOn;
        Print("CircuitBreaker: "+(bIsOn? "On":"off"));
    }
    UFUNCTION(BlueprintOverride)
    bool IsProvidingPower()
    {
        return bIsOn;
    }
};